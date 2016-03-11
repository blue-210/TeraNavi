<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>${result.blog.title}</title>

		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/TeraNavi/css/blog.css" type="text/css">
		<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
	</head>
	<body>
		<div id="fb-root"></div>
		<script>(function (d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id))
					return;
				js = d.createElement(s);
				js.id = id;
				js.src = "//connect.facebook.net/ja_JP/sdk.js#xfbml=1&version=v2.5&appId=584104165076285";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));</script>


		<%-- ヘッダー部分のHTMLを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/header.jsp"/>


		<header>
			<%-- PCばん --%>
			<div class="row hidden-xs">
				<div class="col-md-12">
					<img src="${result.blog.headerPath}" style="width:100%; height:250px">
				</div>
			</div>

			<%-- MOBILEばん --%>
			<div class="row visible-xs">
				<div class="col-xs-12">
					<img src="${result.blog.headerPath}" style="width:100%; height:100px">
				</div>
			</div>

			<%-- PCばん --%>
			<div class="row hidden-xs">
				<div class="col-md-12">
					<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${result.user.id}">
						<img src="${result.user.iconPath}" class="img-thumbnail" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px; z-index: 1100;">
					</a>
					<h3 style="position:relative; margin-top:-100px; margin-left:50px;">
						<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${result.user.id}">${result.user.userName}</a>
					</h3>
				</div>
			</div>

			<%-- MOBILEばん --%>
			<div class="row visible-xs">
				<div class="col-xs-12">
					<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${result.user.id}">
						<img src="${result.user.iconPath}" class="img-thumbnail" style="width:60px; height:60px; margin-top: -95px; margin-left:10px;">
					</a>
					<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${result.user.id}">
						<h3 style="margin-top: -35px; margin-left:10px;">${result.user.userName}</h3>
					</a>
				</div>
			</div>

			<%-- PCばん --%>
			<div class="row hidden-xs">
				<div class="col-md-12">
					<p> <span  class="col-md-12 text-center" style="position:relative;margin-top:-200px;background-color:rgba(255,255,255,0.7);font-size: 60px;">
							${result.blog.title}</span>
					</p>
				</div>
			</div>

			<%-- MOBILEばん --%>
			<div class="row visible-xs">
				<div class="col-xs-12">
					<p> <span  class="text-center" style="position:relative;margin-top:-260px;background-color:rgba(255,255,255,0.7);font-size: 30px;">
							${result.blog.title}</span>
					</p>
				</div>
			</div>

		</header>


		<div class="section">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 hidden-xs">
					<pre>${result.blog.explanation}</pre>
				</div>
				<div class="col-md-2 col-md-offset-2 hidden-xs">
					<h3 class="text-warning">月別アーカイブ</h3>
					<div class="btn-group btn-block">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							月を選択 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<c:forEach var="contents" items="${result.archives}">
								<li><a href="/TeraNavi/front/showArticleList?writeUserId=${result.user.id}&scope=${contents.year}${contents.month}">
										${contents.year}年${contents.month}月(${contents.count})
									</a></li>
								</c:forEach>
						</ul>
					</div>
				</div>

			</div>
			<div class="container">

				<div class="row">

					<div class="row col-md-6 col-xs-12 col-md-offset-1">
						<h1 class="text-warning">新着記事</h1>
					</div>

					<div class="col-md-10 col-md-offset-1 col-xs-12">
						<input type="hidden" id="articlesSize" value="${fn:length(result.articleList)}">
						<c:forEach var="article" items="${result.articleList}"  begin="0" end="6" varStatus="status">
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
			$(function () {

				//記事本文のHTMLタグ除去-----------------------------------------------------
					var size = $("#articlesSize").val();
					for(var i=0; i<size; i++){
						var str = $("#"+i).text();
						var body = str.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'');
						$("#"+i).text(body.substr(0,30));//20文字分かえす
					}
				//--------------------------------------------------------------------------
			});
		</script>
		<script>
			$("#dd").click(function () {
				$('.bun').remove();
				$('#cauTile').html('警告名：<input type="text" name="cautionTitle">');
				$('#cauBody').html('警告する内容：<input type="text" name="cautionBody" >');
				$('#cauBody').append('<input type="hidden" name="url" value="location.href">');
				$('#sub').html('<input type="submit" value="この記事を警告">');
			});
		</script>
		<script>
			!function (d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
				if (!d.getElementById(id)) {
					js = d.createElement(s);
					js.id = id;
					js.src = p + '://platform.twitter.com/widgets.js';
					fjs.parentNode.insertBefore(js, fjs);
				}
			}(document, 'script', 'twitter-wjs');
		</script>

		<script src="/TeraNavi/js/articleCaution.js"></script>
		<script src="/TeraNavi/js/commentPost.js"></script>
	</body>
</html>
