/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//基本的に入力チェック用のjsです
var flag = 0;	//未入力の項目があるかどうかの判定フラグ

var ajaxSettingsId = {
	type: 'post',
	url: '/TeraNavi/front/loginIdCheck',
	dataType: 'json',
	data: null,
	success:function(data){
		if(data=='true'){
			$("#validateLoginId").css("display", "none");
			$("#validateLoginIdOk").css("display", "");
		}else{
			$("#validateLoginIdOk").css("display", "none");
			$("#validateLoginId p").text("そのログインIDはすでに使用されています");
			$("#validateLoginId").css("display", "");
			flag=1;
		}
	}
};

function idCheck(id){
	ajaxSettingsId.data={
		ajax:'true',
		loginId:id
	};
	
	ajax = $.ajax(ajaxSettingsId);
}


$(document).on("blur", "#fName", function () {
	if ($("#fName").val().length <= 0) {

		$("#validateName").css("display", "");
	} else {
		$("#validateName").css("display", "none");
	}
});

$(document).on("blur", "#fNameKana", function () {
	if ($("#fNameKana").val().length <= 0) {

		$("#validateNameKana").css("display", "");
	} else {
		$("#validateNameKana").css("display", "none");
	}
});

$(document).on("blur", "#fMail", function () {
	var seiki = /[!#-9A-~]+@+[a-z0-9]+.+[^.]$/i;

	var address = $("#fMail").val();

	if (address != "") {

		if (address.match(seiki)) {
			$("#validateMail").css("display", "none");
		} else {
			$("#validateMail p").text("メールアドレスが不正です");
			$("#validateMail").css("display", "");
		}
	} else {
		$("#validateMail p").text("メールアドレスが入力されていません");
		$("#validateMail").css("display", "");
	}

});

$(document).on("blur", "#fMail2", function () {
	if ($("#fMail2").val() != "") {
		if ($("#fMail").val() == $("#fMail2").val()) {
			$("#validateMail2").css("display", "none");
		} else {

			$("#validateMail2").css("display", "");
		}

	} else {

		$("#validateMail2 p").text("メールアドレスの確認が未入力です");
		$("#validateMail2").css("display", "");
	}
});

$(document).on("blur", "#fLoginId", function () {
	if ($("#fLoginId").val().length <= 0) {
		$("#validateLoginIdOk").css("display", "none");
		$("#validateLoginId p").text("ログインIDは必須入力です");
		$("#validateLoginId").css("display", "");
	} else {
		idCheck($("#fLoginId").val());
	}

});


$(document).on("blur", "#fPassword", function () {
	var seiki = /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}$/i;

	var password = $("#fPassword").val();

	if (password != "") {

		if (password.match(seiki)) {
			$("#validatePassword").css("display", "none");
		} else {
			$("#validatePassword p").text("パスワードが不正です");
			$("#validatePassword").css("display", "");
		}
	} else {
		$("#validatePassword p").text("パスワードが入力されていません");
		$("#validatePassword").css("display", "");
	}
});

$(document).on("blur", "#fPassword2", function () {
	if ($("#fPassword2").val() != "") {

		if ($("#fPassword").val() == $("#fPassword2").val()) {
			$("#validatePassword2").css("display", "none");
		} else {

			$("#validatePassword2 p").text("パスワードとパスワードの確認が一致しません");
			$("#validatePassword2").css("display", "");
		}
	} else {
		$("#validatePassword2 p").text("パスワードの確認が未入力です");
		$("#validatePassword2").css("display", "");
	}
});

$(document).on("blur", "#fAnswer", function () {
	if ($("#fAnswer").val().length <= 0) {

		$("#validateAnswer").css("display", "");
	} else {
		$("#validateAnswer").css("display", "none");
	}

});

$(document).on("blur", "#fKey", function () {
	if ($("#fKey").val().length <= 0) {

		$("#validateKey").css("display", "");
	} else {
		$("#validateKey").css("display", "none");
	}

});



//確認モーダルを開くための処理

$(document).on("click", "#signsubmit", function () {

//	最後の入力チェック
	flag = 0;

	if ($("#fName").val().length <= 0) {

		$("#validateName").css("display", "");
		flag = 1;
	} else {
		$("#validateName").css("display", "none");
	}

	if ($("#fNameKana").val().length <= 0) {
		flag = 1;
		$("#validateNameKana").css("display", "");
	} else {
		$("#validateNameKana").css("display", "none");
	}

	var addressseiki = /[!#-9A-~]+@+[a-z0-9]+.+[^.]$/i;

	var address = $("#fMail").val();

	if (address != "") {

		if (address.match(addressseiki)) {
			$("#validateMail").css("display", "none");
		} else {
			flag = 1;
			$("#validateMail p").text("メールアドレスが不正です");
			$("#validateMail").css("display", "");
		}
	} else {
		flag = 1;
		$("#validateMail p").text("メールアドレスが入力されていません");
		$("#validateMail").css("display", "");
	}

	if ($("#fMail2").val() != "") {
		if ($("#fMail").val() == $("#fMail2").val()) {
			$("#validateMail2").css("display", "none");
		} else {
			flag = 1;
			$("#validateMail2 p").text("メールアドレスとメールアドレスの確認が一致しません");
			$("#validateMail2").css("display", "");
		}

	} else {
		flag = 1;
		$("#validateMail2 p").text("メールアドレスの確認が未入力です");
		$("#validateMail2").css("display", "");
	}


	if ($("#fLoginId").val().length <= 0) {
		flag = 1;
		$("#validateLoginId").css("display", "");
	} else {
		idCheck($("#fLoginId").val());
	}

	var seiki = /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}$/i;

	var password = $("#fPassword").val();

	if (password != "") {

		if (password.match(seiki)) {
			$("#validatePassword").css("display", "none");
		} else {
			flag = 1;
			$("#validatePassword p").text("パスワードが不正です");
			$("#validatePassword").css("display", "");
		}
	} else {
		flag = 1;
		$("#validatePassword p").text("パスワードが入力されていません");
		$("#validatePassword").css("display", "");
	}

	if ($("#fPassword2").val() != "") {

		if ($("#fPassword").val() == $("#fPassword2").val()) {
			$("#validatePassword2").css("display", "none");
		} else {
			flag = 1;
			$("#validatePassword2 p").text("パスワードとパスワードの確認が一致しません");
			$("#validatePassword2").css("display", "");
		}
	} else {
		flag = 1;
		$("#validatePassword2 p").text("パスワードの確認が未入力です");
		$("#validatePassword2").css("display", "");
	}

	if ($("#fAnswer").val().length <= 0) {
		flag = 1;
		$("#validateAnswer").css("display", "");
	} else {

		$("#validateAnswer").css("display", "none");
	}

	if ($("#fKey").val().length <= 0) {
		flag = 1;
		$("#validateKey").css("display", "");
	} else {
		$("#validateKey").css("display", "none");
	}

	if (!$("input:radio[name='sex']:checked").val()) {
		flag = 1;
		$("#validateSex").css("display", "");
	} else {
		$("#validateSex").css("display", "none");
	}

	if (flag == 0) {

		$("#sName").empty();
		$("#sKana").empty();
		$("#sSex").empty();
//					$("#sBirth").empty();
		$("#sMail").empty();
		$("#sId").empty();
		$("#sPass").empty();
		$("#sQuestion").empty();
		$("#sAnswer").empty();
		$("#sKey").empty();

		$("#sName").append($("#fName").val());
		$("#sKana").append($("#fNameKana").val());
		var cSex = $("input[name='sex']:checked").val();
		if (cSex == 'f') {
			cSex = '女';
		} else if (cSex == 'm') {
			cSex = '男';
		}
		$("#sSex").append(cSex);
//					$("#sBirth").append($("#fBirthday").val());
		$("#sMail").append($("#fMail").val());
		$("#sId").append($("#fLoginId").val());
		$("#sPass").append($("#fPassword").val());
		$("#sQuestion").append($("#fQuestionId option:selected").text());
		$("#sAnswer").append($("#fAnswer").val());
		$("#sKey").append($("#fKey").val());

		$("#signup-modal").modal("show");
	} else {
		alert("正しく入力されていない項目があります");
	}

});


$(document).on("click", "#signsubmitMobile", function () {

	var flag = 0;	//未入力の項目があるかどうかの判定フラグ

	if ($("#fName").val().length <= 0) {

		$("#validateName").css("display", "");
		flag = 1;
	} else {
		$("#validateName").css("display", "none");
	}

	if ($("#fNameKana").val().length <= 0) {
		flag = 1;
		$("#validateNameKana").css("display", "");
	} else {
		$("#validateNameKana").css("display", "none");
	}

	var addressseiki = /[!#-9A-~]+@+[a-z0-9]+.+[^.]$/i;

	var address = $("#fMail").val();

	if (address != "") {

		if (address.match(addressseiki)) {
			$("#validateMail").css("display", "none");
		} else {
			flag = 1;
			$("#validateMail p").text("メールアドレスが不正です");
			$("#validateMail").css("display", "");
		}
	} else {
		flag = 1;
		$("#validateMail p").text("メールアドレスが入力されていません");
		$("#validateMail").css("display", "");
	}

	if ($("#fMail2").val() != "") {
		if ($("#fMail").val() == $("#fMail2").val()) {
			$("#validateMail2").css("display", "none");
		} else {
			flag = 1;
			$("#validateMail2 p").text("メールアドレスとメールアドレスの確認が一致しません");
			$("#validateMail2").css("display", "");
		}

	} else {
		flag = 1;
		$("#validateMail2 p").text("メールアドレスの確認が未入力です");
		$("#validateMail2").css("display", "");
	}


	if ($("#fLoginId").val().length <= 0) {
		flag = 1;
		$("#validateLoginId").css("display", "");
	} else {
		idCheck($("#fLoginId").val());
	}

	var seiki = /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}$/i;

	var password = $("#fPassword").val();

	if (password != "") {

		if (password.match(seiki)) {
			$("#validatePassword").css("display", "none");
		} else {
			flag = 1;
			$("#validatePassword p").text("パスワードが不正です");
			$("#validatePassword").css("display", "");
		}
	} else {
		flag = 1;
		$("#validatePassword p").text("パスワードが入力されていません");
		$("#validatePassword").css("display", "");
	}

	if ($("#fPassword2").val() != "") {

		if ($("#fPassword").val() == $("#fPassword2").val()) {
			$("#validatePassword2").css("display", "none");
		} else {
			flag = 1;
			$("#validatePassword2 p").text("パスワードとパスワードの確認が一致しません");
			$("#validatePassword2").css("display", "");
		}
	} else {
		flag = 1;
		$("#validatePassword2 p").text("パスワードの確認が未入力です");
		$("#validatePassword2").css("display", "");
	}

	if ($("#fAnswer").val().length <= 0) {
		flag = 1;
		$("#validateAnswer").css("display", "");
	} else {

		$("#validateAnswer").css("display", "none");
	}

	if ($("#fKey").val().length <= 0) {
		flag = 1;
		$("#validateKey").css("display", "");
	} else {
		$("#validateKey").css("display", "none");
	}

	if (!$("input:radio[name='sex']:checked").val()) {
		flag = 1;
		$("#validateSex").css("display", "");
	} else {
		$("#validateSex").css("display", "none");
	}

	if (flag == 0) {

		$("#sNameMobile").empty();
		$("#sKanaMobile").empty();
		$("#sSexMobile").empty();
//					$("#sBirthMobile").empty();
		$("#sMailMobile").empty();
		$("#sIdMobile").empty();
		$("#sPassMobile").empty();
		$("#sQuestionMobile").empty();
		$("#sAnswerMobile").empty();
		$("#sKeyMobile").empty();

		$("#sNameMobile").append($("#fName").val());
		$("#sKanaMobile").append($("#fNameKana").val());
		var cSex = $("input[name='sex']:checked").val();
		if (cSex == 'f') {
			cSex = '女';
		} else if (cSex == 'm') {
			cSex = '男';
		}
		$("#sSexMobile").append(cSex);
//					$("#sBirthMobile").append($("#fBirthday").val());
		$("#sMailMobile").append($("#fMail").val());
		$("#sIdMobile").append($("#fLoginId").val());
		$("#sPassMobile").append($("#fPassword").val());
		$("#sQuestionMobile").append($("#fQuestionId option:selected").text());
		$("#sAnswerMobile").append($("#fAnswer").val());
		$("#sKeyMobile").append($("#fKey").val());

		$("#signup-modal-mobile").modal("show");

	} else {
		alert("正しく入力されていない項目があります");
	}


});