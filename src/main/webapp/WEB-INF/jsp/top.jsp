<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <title>TeraNavi TOP</title>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="section">
        <div class="container">
          <div class="row">
            <div class="col-xs-10 col-xs-offset-1">
              <ul class="lead nav nav-justified nav-tabs">
                <li class="active">
                  <a href="TeraNavi/front/top#top" data-toggle="tab" class="text-warning">TOP</a>
                </li>
                <li>
                  <a href="#blog" data-toggle="tab" class="text-warning">ブログ</a>
                </li>
                <li>
                  <a href="#community" data-toggle="tab" class="text-warning">コミュニティ</a>
                </li>
                <li>
                  <a href="#tag" data-toggle="tab" class="text-warning">タグ</a>
                </li>
                <li>
                  <a href="/TeraNavi/front/mypage" class="text-warning">マイページ</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
     <div class="tab-content">
          <div class="tab-pane active" id="top">
              <div class="section">
                <div class="container">
                    <div class="row col-md-10 col-md-offset-1">
                      <h1 class="text-warning">新着記事</h1>
                    </div>
					<c:forEach var="article" items="${result.article}">
						<div class="row col-md-10 col-md-offset-1 well">
							<div class="col-md-2">
							  <br>
							  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
							  <a href=""><h3 class="text-center text-muted">${article.userName}</h3></a>
							</div>
							<div class="col-md-7">
							  <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
							  <p　id="articleBody"><c:out value="${article.articleBody}" />...</p>
							  <div class="text-right">
								<a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
								</div>
							</div>
							<div class="col-md-3">
								<br><br>
								<p>投稿日時 ${article.createdDate}</p>
								<br>
								<p>コメント数 ${article.commentCount}</p>
							</div>
						</div>
					</c:forEach>
				</div>
            </div>
        </div>
        <div class="tab-pane" id="blog"> <jsp:include page="/WEB-INF/jsp/topblog.jsp"/> </div>
        <div class="tab-pane" id="community"> <jsp:include page="/WEB-INF/jsp/topcommunity.jsp"/> </div>
        <div class="tab-pane" id="tag"> <jsp:include page="/WEB-INF/jsp/toptag.jsp"/> </div>
    </div><!-- tab-content -->

    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    <script>



        $(document).ready(function() {

            // #(ハッシュ)指定されたタブを表示する
            var hashTabName = document.location.hash;
            if (hashTabName) {
                $('.nav-tabs a[href=' + hashTabName + ']').tab('show');

                event.preventDefault();

                // 所定の位置までスクロールする
                var tabParent = $("#" + $('.nav-tabs a[href=' + hashTabName + ']').parents('div').attr('id'));
                $('html, body').stop().animate({
                    scrollTop: 0
                }, 2000);
            }

        });
    </script>

</body>
</html>
