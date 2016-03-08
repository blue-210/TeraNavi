

<div class="section">
	<div class="container">
		<div class="row col-md-10 col-xs-11 col-xs-offset-1 col-md-offset-1">
			<h1 class="text-warning">各科新着記事</h1>
		</div>
		<c:forEach var="article" items="${result.department}">
			<div class="row col-md-10 col-xs-10 col-xs-offset-1 col-md-offset-1 well mobile-content-space">
				<div class="col-md-2 col-xs-12">
					<br>
					<div class="hidden-xs">
						<img src="${article.iconPath}" style="width:100px;height:100px;">
						<a href="/TeraNavi/front/mypage?paramUserId=${article.userId}"><h3 class="text-center text-muted">${article.userName}</h3></a>

					</div>
					<div class="visible-xs">
						<img src="${article.iconPath}" style="width:100px;height:100px;">
						<a href="/TeraNavi/front/mypage?paramUserId=${article.userId}"><h5 class="text-center text-muted mobile-user-name">${article.userName}</h5></a>

					</div>
				</div>
				<div class="col-md-7 col-xs-12">
					<div class="hidden-xs">
						<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
						<p id="articleBody"><c:out value="${article.articleBody}" /></p>
						<div class="text-right">
							<a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
						</div>

					</div>
					<div class="visible-xs">
						<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h5 class="text-muted">${article.title}</h5></a>
						<p class="mobile-article-body" id="articleBody"><c:out value="${article.articleBody}" /></p>

						<a class="btn btn-warning btn-block" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>

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


<div class="section">
    <div class="container">
		<div class="row col-md-10 col-xs-11 col-xs-offset-1 col-md-offset-1">
			<h1 class="text-warning">人気ブログ</h1>
		</div>
		<%-- <div class="row col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1"> --%>
			<c:forEach var="blog" items="${result.blog}">
				<div class="row col-md-10 col-xs-10 col-xs-offset-1 col-md-offset-1 well mobile-content-space">
					<div class="col-md-2 col-xs-12">
						<br>
						<div class="hidden-xs">
							<img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive img-thumbnail">


						</div>
						<div class="visible-xs">
							<img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive img-thumbnail mobileBlogThumbnail">

						</div>
					</div>
					<div class="col-md-7 col-xs-12">
						<div class="hidden-xs">
							<a href="/TeraNavi/front/showBlog?bloguserId=${blog.userId}"><h2 class="text-muted">${blog.title}</h2></a>
							<p id="articleBody"><c:out value="${blog.explanation}" />!!</p>
							<div class="text-right">
								<a class="btn btn-warning" href="/TeraNavi/front/showBlog?bloguserId=${blog.userId}">ブログページへ</a>
							</div>

						</div>
						<div class="visible-xs">
							<a href="/TeraNavi/front/showBlog?bloguserId=${blog.userId}"><h4 class="text-muted text-center">${blog.title}</h4></a>
							<p class="mobile-article-body" id="articleBody"><c:out value="${blog.explanation}" />!!</p>

							<a class="btn btn-warning btn-block" href="/TeraNavi/front/showBlog?bloguserId=${blog.userId}">ブログページへ</a>

						</div>
					</div>
				</div>

			</c:forEach>

		<%-- </div> --%>
    </div>
</div>
