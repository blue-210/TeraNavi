/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).on("blur", "#pass", function () {
	var seiki = /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}$/i;

	var password = $("#pass").val();

	if (password != "") {

		if (password.match(seiki)) {
			$("#validatePass").css("display", "none");
		} else {
			$("#validatePass p").text("パスワードが不正です");
			$("#validatePass").css("display", "");
		}
	} else {
		$("#validatePass p").text("パスワードが入力されていません");
		$("#validatePass").css("display", "");
	}
});

$(document).on("click","#resetSubmit",function(){
	var seiki = /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}$/i;

	var password = $("#pass").val();

	if (password != "") {

		if (password.match(seiki)) {
			$("#validatePass").css("display", "none");
			
			$("#resetForm").submit();
			
		} else {
			$("#validatePass p").text("パスワードが不正です");
			$("#validatePass").css("display", "");
		}
	} else {
		$("#validatePass p").text("パスワードが入力されていません");
		$("#validatePass").css("display", "");
	}
});