<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>${result.blog.title}</title>

		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/TeraNavi/css/blog.css" type="text/css">
		<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
	</head>
	<body>
		<%-- ヘッダー部分のHTMLを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/header.jsp"/>


		<header>
			<div class="row">
				<div class="col-md-12 hidden-xs">
					<img src="${result.blog.headerPath}" style="width:100%; height:250px">
				</div>

				<div class="col-md-12 visible-xs">
					<img src="${result.blog.headerPath}" style="width:100%; height:80px">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<p> <span  class="col-md-12 text-center" style="position:relative;margin-top:-200px;background-color:rgba(255,255,255,0.7);font-size: 60px;">
							<a href="/TeraNavi/front/showBlog?bloguserId=${result.blog.userId}" class="text-muted">${result.blog.title}</a></span>
					</p>

				</div>
			</div>
			<div class="row hidden-xs">
				<div class="col-md-12">
					<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${result.user.id}">
						<img src="${result.user.iconPath}" class="img-thumbnail" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px;">
					</a>
					<h3 style="position:relative; margin-top:-100px; margin-left:50px;">
						<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${result.user.id}">${result.user.userName}</a>
					</h3>
				</div>
			</div>

		</header>


		<div class="section">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 hidden-xs">
					<pre style="position:relative; margin-top:-100px;">${result.blog.explanation}</pre>
				</div>
			</div>
			<div class="container">

				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-xs-12">
						<input type="hidden" id="articlesSize" value="${fn:length(result.articles)}">
						<c:forEach var="article" items="${result.articles}" varStatus="status">
							<div class="row col-md-12 col-xs-12 well mobile-content-space" style="margin-left:0px;">
								<div class="col-md-9 col-xs-12">
									<div class="hidden-xs">
										<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
										<p id="${status.index}"><c:out value="${article.articleBody}" /></p>
										<div class="text-right">
											<a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
										</div>
									</div>
									<div class="visible-xs">
										<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h5 class="text-muted text-center mobile-article-title">${article.title}</h5></a>
										<%-- <p class="mobile-article-body" id="top${status.index}"><c:out value="${fn:substring(article.articleBody,0,30)}" /></p> --%>
										<a class="btn btn-warning btn-block" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">記事を読む</a>
									</div>
								</div>
								<div class="col-md-3 hidden-xs">
									<br><br>
									<p>${article.createdDate}</p>
									<br>
									<p>コメント数 ${article.commentCount}</p>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>


		<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

		<script>
			$(function(){
				//記事本文のHTMLタグ除去-----------------------------------------------------
				var size = $("#articlesSize").val();
				console.log("articlesSize="+size);
				for(var i=0; i<size; i++){
					var str = $("#"+i).text();
					console.log("無加工="+str);
					var body = str.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'');
					console.log("加工済み="+body);
					$("#"+i).text(body.substr(0,30));
				}
				//--------------------------------------------------------------------------
			});
		</script>

	</body>
</html>
