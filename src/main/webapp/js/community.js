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
