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
			<div class="row hidden-xs">
				<div class="col-md-12">
					<img src="${result.blog.headerPath}" style="width:100%; height:250px">
				</div>
			</div>


			<div class="row visible-xs">
				<div class="col-xs-12">
					<img src="${result.blog.headerPath}" style="width:100%; height:100px">
				</div>
			</div>



			<div class="row hidden-xs">
				<div class="col-md-12">
					<img src="${result.user.iconPath}" class="img-thumbnail" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px; z-index: 1100;">
					<h3 style="position:relative; margin-top:-100px; margin-left:50px;">
						<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${result.user.id}">${result.user.userName}</a>
					</h3>
				</div>
			</div>

			<div class="row visible-xs">
				<div class="col-xs-12">
					<img src="${result.user.iconPath}" class="img-thumbnail" style="width:60px; height:60px; margin-top: -95px; margin-left:10px;">
					<h3 style="margin-top: -35px; margin-left:10px;">
						<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${result.user.id}">${result.user.userName}</a>
					</h3>
				</div>
			</div>


			<div class="row hidden-xs">
				<div class="col-md-12">
					<p> <span  class="col-md-12 text-center" style="position:relative;margin-top:-200px;background-color:rgba(255,255,255,0.7);font-size: 60px;">
							${result.blog.title}</span>
					</p>
				</div>
			</div>


			<div class="row visible-xs">
				<div class="col-xs-12">
					<p> <span  class="text-center" style="position:relative;margin-top:-260px;background-color:rgba(255,255,255,0.7);font-size: 30px;">
							${result.blog.title}</span>
					</p>
				</div>
			</div>
		</header>


		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-offset-1 col-xs-12 hidden-xs">
						<p class="text-center well" style="margin-top:0px;margin-bottom:80px">${result.blog.explanation}</p>



						<h1>新着記事</h1>
					</div>


					<div class="visible-xs col-xs-12">
						<p class="text-center well" style="margin-top:0px;margin-bottom:40px">${result.blog.explanation}</p>
						<div class="container visible-xs">
							<div class="dropdown">
								
									<button type="button" class="btn btn-default dropdown-toggle btn-block" data-toggle="dropdown">
										月別アーカイブ <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" style="width:100%;">
										<c:forEach var="contents" items="${result.archives}">
											<li><a href="/TeraNavi/front/showArticleList?writeUserId=${result.blog.userId}&scope=${contents.year}${contents.month}">
													${contents.year}年${contents.month}月(${contents.count})
												</a></li>
											</c:forEach>
										
									</ul>
								
							</div>
						</div>
						<br>
					</div>

					<div class="col-md-2 hidden-xs blog-archive">
						<h3 class="text-center text-warning">月別アーカイブ</h3>
						<div class="btn-group archive-list-btn">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
								月を選択 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<c:forEach var="contents" items="${result.archives}">
									<li><a href="/TeraNavi/front/showArticleList?writeUserId=${result.blog.userId}&scope=${contents.year}${contents.month}">
											${contents.year}年${contents.month}月(${contents.count})
										</a></li>
									</c:forEach>
							</ul>
						</div>
					</div>

					<div class="visible-xs">
						<h2 style="margin-top: -20px;" class="text-center">新着記事</h2>

					</div>

					<%-- 記事一覧の表示 --%>
					<div class="col-md-2"></div>

					<c:forEach var="article" items="${result.articleList}"  begin="0" end="3">
						<div class="section hidden-xs">
							<div class=" col-md-9 col-md-offset-1 well">
								<div class="article-title">
									<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}">
										<h2 class="text-muted">${article.title}</h2>
									</a>

								</div>
								<div class="article-content">
									<div class="section">
										<p id="articleBody">${ fn:substring(article.articleBody, 0, 20) }...</p>

									</div>
									<p class="article-date">投稿日時 ${article.createdDate}</p>

									<p class="article-comment-count">コメント数 ${article.commentCount}</p>

								</div>
							</div>

						</div>



					</c:forEach>

					<div class="visible-xs col-xs-12">

						<table class="table table-hover">
							<tbody>
								<c:forEach var="article" items="${result.articleList}"  begin="0" end="3">

									<tr>
										<td>
											<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}">
												<h3 class="text-muted text-center">${article.title}</h3>
											</a>

											<p id="articleBodyMobile">${ fn:substring(article.articleBody, 0, 20) }...</p>

											<p class="article-date-mobile">投稿日時 ${article.createdDate}</p>

											<p class="article-comment-count-mobile">コメント数 ${article.commentCount}</p>
										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>







					<%--
							  <div class="col-md-8 col-md-offset-2">
								<p class="text-left">${result.blog.explanation}</p>
								<h1>新着記事</h1>
							  </div>
								<table class="table table-striped">
								   <tbody>
									   <c:forEach var="articles" items="${result.articleList}">
										   <tr id="tableRow${articles.articleId}">
											   <td>
												   <a href="/TeraNavi/front/showArticle?articleId=${articles.articleId}">
													   <c:out value="${articles.title}"/>
												   </a>
											   </td>
											   <td> ${ fn:substring(articles.articleBody, 0, 20) } </td>
											   <td> <c:out value="${articles.createdDate}"/> </td>
										   </tr>
									   </c:forEach>
								   </tbody>
							   </table>
					--%>


				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<ul class="pager">
							<c:choose>
								<c:when test="${result.previous >= 0}">
									<li class="previous">
										<a href="/TeraNavi/front/showArticle?articleId=${result.previous}" style="font-weight:bold">＜前の記事へ</a>
									</li>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${result.next >= 0}">
									<li class="next">
										<a href="/TeraNavi/front/showArticle?articleId=${result.next}" style="font-weight:bold">次の記事へ＞</a>
									</li>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>


			</div>
		</div>


		<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

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
