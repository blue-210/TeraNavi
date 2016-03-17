/*******************************************************************************
* 退会処理
*******************************************************************************/
$(function(){

    var withDrawId;

    $(".btn_withDraw").on("click",function(){
        withDrawId = $(this).val();
        $("#withDrawModal").modal();
    });

    $("#btn_modalWithDraw").on("click",function(){

        $.ajax({
          url: '/TeraNavi/front/withDrawComm',
          type:'POST',
          dataType: 'json',
          data:{
            commId:withDrawId,
            ajax:'true'
          }
       })
           .done(function(data) {
               $("#withDrawResultModal").modal();
               console.log("#tableRow"+withDrawId);
                $("#tableRow" + withDrawId).hide();
           })
           .fail(function() {
               $("#withDrawResultMessage").text("退会できませんでした。もういちどお試しください。");
               $("#withDrawResultModal").modal();
           });
    });
});

/*******************************************************************************
* コミュニティ削除処理
*******************************************************************************/
$(function(){

    var deleteCommId;

    // 削除ボタンを押したら、削除確認モーダルを開く
    $(".deleteConfirm").on("click",function(){
        deleteCommId = $(this).val();
        $("#deleteCommModal").modal();
    });

    // 確認モーダルの削除ボタンを押したら、Ajaxでコマンドへ送信
    $("#btn_delete").on("click",function(){

        $.ajax({
          url: '/TeraNavi/front/deleteComm',
          type:'POST',
          dataType: 'json',
          data:{
            commId:deleteCommId,
            ajax:'true'
          }
       })
       .done(function(data) {
           $("#deleteResultModal").modal();
            $("#tableRow" + deleteCommId).hide();
       })
       .fail(function() {
           $("#deleteResultMessage").text("削除できませんでした。もういちどお試しください。");
           $("#deleteResultModal").modal();
       });
    });
});

/*******************************************************************************
* コミュニティ参加処理
*******************************************************************************/
$(function(){

    var commId;
    var button;
    $(".communityBtn").on("click",function(){
        button = $(this);
        commId = $(this).val();
        $("#partiCommModal").modal();
        $.ajax({
            // urlで飛ばしたいコマンドを指定してあげる
          url: '/TeraNavi/front/partiComm',
          type:'POST',
          dataType: 'json',
          data:{
            commId:commId,
            ajax:'true'
          }
       })
       .done(function(data) {
           console.log(data);
           $("#joinResultMessage").text("参加しました!");
           button.text("参加中");
           button.prop("disabled",true);
       })
       .fail(function() {
           $("#joinResultMessage").text("参加できませんでした。もういちどお試しください。");
       });
    });
});

/*******************************************************************************
* コミュニティ編集処理
*******************************************************************************/
$(function () {
    var ajaxSettings;
    var ajax;

    ajaxSettings = {
        type: 'post',
        url: '/TeraNavi/upload',
        processData: false,
        contentType: false,
        cache: false,
        dataType: 'json'
    };

    $("#edit").click(function () {
        var id = $('#commid');
        var userid = $('#userId');
        var name = $('#name');
        var profile = $('#profile').text();
        var iconPath = " ${result.iconPath}";
        var headerPath = "${result.headerPath}";
        var del = '0';
        var target = 'communitySettingResult';
        var button = $('#editButton');

        $("#name").html('<input type="text" class = "form-control" name="commName" value="' + name.text() + '" id="commName" maxlength="100"><br>');
        $("#name").css("background-color", "");
        $("#name").removeClass("col-md-12");
        $("#name").addClass("col-md-8");
        $("#profile").html('<textarea class="form-control" id="profile" rows="4" name="commProfile">' + profile + '</textarea>');
        $("#headerPath").append('<p id="headerText">ヘッダー画像を選択</p>');
        $("#headerPath").addClass("changeEffectHead");
        // $("#headimg").addClass("changeEffectHead");
        $("#iconPath").append('<p id="changeEffectIconText">アイコン画像を選択</p>');
        $("#iconPath").addClass("changeEffectIcon");
        $("#edit").css("display", "none");
        // $("#iconFile").show();
        $("#iconFile").append('<input id="comIconPath" type="hidden" name="iconPath">');
        // $("#headerFile").show();
        $("#headerFile").append('<input id="commHeaderPath" type="hidden" name="headerPath">');
        button.hide();

        //	<!-- 下は隠し要素 -->
        $('#userId').html('<input type="hidden" name="userId" value="' + userid.text() + '">');
        $('#commid').html('<input type="hidden" name="commId" value="' + id.text() + '">');
        $('#commid').append('<input type="hidden" name="deleteFlag" value="' + del + '">');
        $('#commid').append('<input type="hidden" name="target" value="' + target + '">');
        $('#commid').append('<input type="hidden" name="nowIconPath" value="' + iconPath + '">');
        $('#commid').append('<input type="hidden" name="nowHeaderPath" value="' + headerPath + '">');
        $('#sub').html('<button class="btn btn-warning btn-lg" type="button" id="commSubmit" data-toggle="modal">確認</button>');
    });
});

//画像のアップロード関係
function fileUpIcon() {
    var files = document.getElementById("iconFile").files;

    for (var i = 0; i < files.length; i++) {
        var f = files[i];
        var formData = new FormData();

        formData.append("file", f);
        ajaxSettings.data = formData;
        ajaxSettings.url = "/TeraNavi/upload";

        ajaxSettings.success = function (data) {
            $("#comIconPath").val(data.result);
            $("#icon").attr("src", data.result);
        }
        ajax = $.ajax(ajaxSettings);
    }
}

$(document).on("change", "#headerFile", function () {
    var file = this.files[0];
    // ブラウザごとの違いをフォローする
    window.URL = window.URL || window.webkitURL;

    // Blob URLの作成
    src = window.URL.createObjectURL(file);
    $("#headimg").attr("src", src);
    fileUpHeader();
});

$(document).on("change", "#iconFile", function () {
    var file = this.files[0];
    // ブラウザごとの違いをフォローする
    window.URL = window.URL || window.webkitURL;

    // Blob URLの作成
    src = window.URL.createObjectURL(file);

    fileUpIcon();
});


function fileUpHeader() {
    var files = document.getElementById("headerFile").files;

    for (var i = 0; i < files.length; i++) {
        var f = files[i];
        var formData = new FormData();

        formData.append("file", f);
        ajaxSettings.data = formData;
        ajaxSettings.url = "/TeraNavi/upload/header";

        ajaxSettings.success = function (data) {
            $("#commHeaderPath").val(data.result);
            $("#preHeader").attr("src", data.result);
        }
        ajax = $.ajax(ajaxSettings);
    }
}

$(document).on('click', "#commSubmit", function () {
    $("#modalName").empty();
    $("#modalProfile").empty();
    $("#commHeader").empty();
    $("#commIcon").empty();

    $("#modalName").append($("#commName").val());
    $("#modalProfile").append($("#profile").text());
    $("#commHeader").attr("src", $("#headimg").attr("src"));
    $("#commIcon").attr("src", $("#icon").attr("src"));

    $("#communitySetting-modal").modal("show");
});
