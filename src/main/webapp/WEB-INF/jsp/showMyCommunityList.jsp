<!DOCTYPE html>
<html lang="ja">
<head>
    <title>参加コミュニティ一覧</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/TeraNavi/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/TeraNavi/js/footerFixed.js"></script>
    <jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <h1 class="text-warning" style="margin-bottom:5%">${result.user.userName} さんの参加コミュニティ一覧</h1>
                <table class="table table-striped">
                   <thead>
                       <tr>
                           <th>コミュニティアイコン</th>
                           <th>コミュニティ名</th>
                           <th>紹介文</th>
                           <c:if test="${sessionScope.loginUser.id eq result.user.id}" >
                               <th></th>
                           </c:if>
                       </tr>
                   </thead>
                   <tbody>
                       <c:forEach var="comm" items="${result.list}">
                       <tr id="tableRow${comm.id}">
                           <td>
                               <img src="${comm.iconPath}" class="img-thumbnail"
                                style="width:50px;height:50px;">
                        　 </td>
                           <td>
                               <a href="/TeraNavi/front/showcomm?commId=${comm.id}">
                                   <c:out value="${comm.name}"/>
                               </a>
                           </td>
                           <td> ${ fn:substring(comm.profile, 0, 20) } </td>
                           <c:if test="${sessionScope.loginUser.id eq result.user.id}" >
                               <td> <button type="button" class="btn btn-danger btn_withDraw" value="${comm.id}">退会</button> </td>
                           </c:if>
                       </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div><!--end col-->
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    <!-- 確認モーダル -->
    <div class="fade modal text-justify" id="withDrawModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            　<h4 class="modal-title text-center">確認</h4>
             </div>
            <div class="modal-body">
                <p class="text-center">本当に退会しますか？</p>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-block btn-danger" id="btn_modalWithDraw" data-dismiss="modal">退会</button>
                <button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
            </div>
          </div>
        </div>
     </div>

     <!-- 結果モーダル -->
      <div class="modal fade" id="withDrawResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">閉じる</span></button>
              <h4 class="modal-title text-center" id="withDrawResultModalLabel">退会結果</h4>
            </div>
            <div class="modal-body">
              <p id="withDrawResultMessage" class="text-center">記事の削除が完了しました</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->

    <script>

        $(function(){

            var withDrawId;

            $(".btn_withDraw").on("click",function(){
                withDrawId = $(".btn_withDraw").val();
                $("#withDrawModal").modal();
            });

            $("#btn_modalWithDraw").on("click",function(){

                $.ajax({
                    // urlで飛ばしたいコマンドを指定してあげる
                  url: '/TeraNavi/front/withDrawComm',
                  type:'POST',
                //   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
                  dataType: 'json',
                //   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
                  data:{
                    //   キー:バリューで書く。バリューには変数も使えます。
                    commId:withDrawId,
                    ajax:'true'
                  }
               })
                //    成功時の処理
                   .done(function(data) {
                       $("#deleteArticleResultModal").modal();

                        $("#tableRow" + withDrawId).hide();

                   })
                //    失敗時の処理
                   .fail(function() {
                       $("#withDrawResultMessage").text("記事の削除に失敗しました");
                       $("#withDrawResultModal").modal();
                   });
            });


        });

    </script>

</body>
</html>
