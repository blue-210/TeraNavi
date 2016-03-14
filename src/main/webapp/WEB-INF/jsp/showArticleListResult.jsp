<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
   import="ttc.bean.ArticleBean"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <title>記事一覧表示</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="/TeraNavi/js/bootstrap.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/TeraNavi/css/style.css" rel="stylesheet" type="text/css">
    <link href="/TeraNavi/css/navbar.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/TeraNavi/css/mypage.css" type="text/css">
    <jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
    <style>
        .modal-open {
            overflow: auto;
        }
        .modal-close {
            overflow: auto;
        }
    </style>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <%-- トップのナビゲーションを読み込み --%>
    <div class="section hidden-xs">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <ul class="lead nav nav-justified nav-tabs">
                        <li>
                            <a href="/TeraNavi/front/top" class="text-warning">TOP</a>
                        </li>
                        <li>
                            <a href="/TeraNavi/front/top#blog" class="text-warning">ブログ</a>
                        </li>
                        <li>
                            <a href="/TeraNavi/front/top#community" class="text-warning">コミュニティ</a>
                        </li>
                        <li>
                            <a href="/TeraNavi/front/top#tag" class="text-warning">タグ</a>
                        </li>
                        <c:choose>
                            <c:when test="${sessionScope.loginUser.id eq result.user.id}">
                                <li class="active">
                                    <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="visible-xs">
        <nav class="nav nav-horizontal">
            <div class="mask">
                <ul class="list">
                    <li><a href="/TeraNavi/front/top">Top</a></li>
                    <li><a href="/TeraNavi/front/top#blog">ブログ</a></li>
                    <li><a href="/TeraNavi/front/top#community">コミュニティ</a></li>
                    <li><a href="/TeraNavi/front/top#tag">タグ</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.loginUser.id eq result.user.id}">
                            <li class="active">
                                <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </nav>
    </div>

    <div class="section">
        <div class="container">
            <div class="row">

                <!-- 自分のマイページの場合2列をサイドメニューに割り当て -->
<c:choose>
<c:when test="${sessionScope.loginUser.id eq result.user.id}">

                <div class="col-md-2 hidden-xs">
                    <jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
                </div>

                <!--スマホ版はドロップダウンメニュー-->
                <div class="container visible-xs">
                    <div class="dropdown">
                        <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">投稿記事一覧<span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <c:choose>
                                <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                                    <li>
                                        <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a>
                                    </li>
                                    <li>
                                        <a href="/TeraNavi/articlepost">記事を書く</a>
                                    </li>
                                    <li>
                                        <a href="/TeraNavi/front/showDraftArticleList?writeUserId=${sessionScope.loginUser.id}">下書き一覧</a>
                                    </li>
                                    <li>
                                        <a href="/TeraNavi/front/showBlog?edit=true&bloguserId=${sessionScope.loginUser.id}">ブログ設定</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="/TeraNavi/blogSetting">ブログ開設</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li>
                                <a href="/TeraNavi/front/commmy">コミュニティ管理</a>
                            </li>
                            <!--<li>
                                <a href="/TeraNavi/front/showDmList">DM</a>
                            </li>-->
                            <br><br>
                            <li>
                                <a href="/TeraNavi/withdraw">退会</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <script>
                    $("#articleListTab").attr("class", "active");
                </script>


                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div class="col-md-8 col-xs-12">
</c:when>
<c:otherwise>
                <!--自分のマイページじゃない場合はサイドメニュー分あける-->
                <div class="col-md-8 col-xs-12 col-md-offset-2">
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${fn:length(result.articles)  > 0}">
                    <table class="table table-striped">
                       <thead>
                           <tr>
                               <c:if test="${sessionScope.loginUser.id eq result.user.id}" >
                                   <th></th>
                               </c:if>
                               <th class="col-md-3 col-xs-5">タイトル</th>
                               <th class="col-md-3 hidden-xs">内容</th>
                               <th>投稿日時</th>
                               <c:if test="${sessionScope.loginUser.id eq result.user.id}" >
                                   <th>選択</th>
                               </c:if>
                           </tr>
                       </thead>
                       <tbody>
                           <input type="hidden" id="articlesSize" value="${fn:length(result.articles)}">
                           <c:forEach var="article" items="${result.articles}" varStatus="status">
                           <tr id="tableRow${article.articleId}">
                               <c:if test="${sessionScope.loginUser.id eq article.userId}" >
                                   <td> <a class="btn btn-default btn-sm" href="/TeraNavi/front/showArticle?articleId=${article.articleId}&edit=true">編集</a> </td>
                               </c:if>
                               <td>
                                   <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}">
                                       <c:out value="${article.title}"/>
                                   </a>
                               </td>
                               <td id="${status.index}" class="hidden-xs"><c:out value=" ${article.articleBody}" /></td>
                               <td> ${article.createdDate}</td>
                               <c:if test="${sessionScope.loginUser.id eq article.userId}" >
                                   <td> <input class="chDelete" type="checkbox" name="articleId" value="${article.articleId}"> </td>
                               </c:if>
                           </tr>
                           </c:forEach>
                       </tbody>
                   </table>
                   <c:if test="${sessionScope.loginUser.id eq result.user.id}" >
                       <a id="btn_articleDelete" class="btn btn-danger pull-right">削除</a>
                   </c:if>
</c:when>
<c:otherwise>
                    <p class="text-center">まだ記事がありません</p>
</c:otherwise>
</c:choose>
               </div><!--end col-->
           </div><!--end row-->
           <div id="dummyDiv"></div>
        </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    <!-- 確認モーダル -->
    <div class="fade modal text-justify" id="articleDeleteModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            　<h4 class="modal-title text-center">確認</h4>
             </div>
            <div class="modal-body">
                <p class="text-center">本当に削除しますか？</p>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-block btn-danger" id="btn_modalDelete" data-dismiss="modal">削除</button>
                <button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
            </div>
          </div>
        </div>
     </div>

     <!-- 結果モーダル -->
      <div class="modal fade" id="deleteArticleResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">閉じる</span></button>
              <h4 class="modal-title text-center" id="deleteArticleResultModalLabel">記事削除結果</h4>
            </div>
            <div class="modal-body">
              <p id="deleteArticleResultMessage" class="text-center">記事の削除が完了しました</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->

    <script>

        $(function(){


            //記事本文のHTMLタグ除去-----------------------------------------------------
				var size = $("#articlesSize").val();
                for(var i=0; i<size; i++){
                    var str = $("#"+i).text();
                    var body = str.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'');
                    $("#"+i).text(body.substr(0,15));
                }
			//--------------------------------------------------------------------------


            $("#btn_articleDelete").on("click",function(){
                $("#articleDeleteModal").modal();
            });

            $("#btn_modalDelete").on("click",function(){

                var checks=[];
                $("[name='articleId']:checked").each(function(){
                    checks.push(this.value);
                });

                $.ajax({
                    // urlで飛ばしたいコマンドを指定してあげる
                  url: '/TeraNavi/front/deleteArticle',
                  type:'POST',
                //   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
                  dataType: 'json',
                //   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
                  data:{
                    //   キー:バリューで書く。バリューには変数も使えます。
                    "articleId":checks,
                    ajax:'true'
                  }
               })
                //    成功時の処理
                   .done(function(data) {
                       $("#deleteArticleResultModal").modal();

                       jQuery.each(checks, function() {
                           $("#tableRow" + this).hide();
                           $("#dummyDiv").append('<div style="height:47px;"></div>');
                        });

                   })
                //    失敗時の処理
                   .fail(function() {
                       $("#deleteArticleResultMessage").text("記事の削除に失敗しました");
                       $("#deleteArticleResultModal").modal();
                   });
            });


        });

    </script>

</body>
</html>
