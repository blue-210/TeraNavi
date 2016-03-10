

<div class="section">
	<div class="container">
		<div class="row col-md-10 col-xs-11 col-xs-offset-1 col-md-offset-1">
			<h1 class="text-warning">各科新着記事</h1>
		</div>
		<input type="hidden" id="blogArticlesSize" value="${fn:length(result.department)}">
		<c:forEach var="article" items="${result.department}" varStatus="status">
			<div class="row col-md-10 col-xs-10 col-xs-offset-1 col-md-offset-1 well mobile-content-space">
				<div class="col-md-2 col-xs-12">
					<br>
					<div class="hidden-xs">
						<a href="/TeraNavi/front/mypage?paramUserId=${article.userId}">
							<img src="${article.iconPath}" class="img-thumbnail" style="width:100px;height:100px;">
							<h3 class="text-muted" style="margin-top:0px;">${article.userName}</h3>
						</a>
					</div>
					<div class="visible-xs">
						<a href="/TeraNavi/front/mypage?paramUserId=${article.userId}">
							<img src="${article.iconPath}" class="img-thumbnail" style="width:100px;height:100px;">
							<h5 class="text-muted mobile-user-name" style="margin-top:0px;">${article.userName}</h5>
						</a>
					</div>
				</div>
				<div class="col-md-7 col-xs-12">
					<div class="hidden-xs">
						<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
						<p id="blog${status.index}"><c:out value="${fn:substring(article.articleBody, 0, 30)}" /></p>
						<div class="text-right">
							<a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
						</div>

					</div>
					<div class="visible-xs">
						<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h5 class="text-muted text-center">${article.title}</h5></a>
						<%-- <p class="mobile-article-body" id="blog${status.index}"><c:out value="${fn:substring(article.articleBody, 0, 30)}" /></p> --%>

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
							<img src="${blog.headerPath}" class="img-thumbnail" style="width:150px;height:50px;">
						</div>
						<div class="visible-xs">
							<img src="${blog.headerPath}" class="img-thumbnail" style="width:150px;height:50px;">
						</div>
					</div>
					<div class="col-md-7 col-xs-12">
						<div class="hidden-xs">
							<a href="/TeraNavi/front/showBlog?bloguserId=${blog.userId}"><h2 class="text-muted">${blog.title}</h2></a>
							<p id="articleBody"><c:out value="${blog.explanation}" /></p>
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
