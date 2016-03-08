<div class="section">
    <div class="container">

      <div class="row col-md-10 col-md-offset-1">
        <h1 class="text-warning">人気タグ</h1>
      </div>

<c:choose>
<c:when test="${fn:length(result.tags) > 0}">

      <div class="row col-md-10 col-md-offset-1">
        <h1><span class="label label-warning">${result.tags[0].name}</span></h1>
        <br>
      </div>

      <input type="hidden" id="tagArticleCount" value="${fn:length(result.tagArticles)}">

      <input type="hidden" id="tagArticlesSize0" value="${fn:length(result.tagArticles[0])}">
      <c:forEach var="article" items="${result.tagArticles[0]}" varStatus="status">
          <div class="row col-md-10 col-md-offset-1 well">
            <div class="col-md-2">
              <br>
              <img src="${article.iconPath}" class="img-responsive">
              <a href="/TeraNavi/front/mypage?paramUserId=${article.userId}"><h3 class="text-center text-muted">${article.userName}</h3></a>
            </div>
            <div class="col-md-7">
              <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
              <p id="0tag${status.index}"><c:out value="${fn:substring(article.articleBody, 0, 30)}" /></p>
              <div class="text-right">
                <a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
              </div>
            </div>
            <div class="col-md-3">
              <br>
              <br>
              <p>${article.createdDate}</p>
              <br>
              <p>コメント数 ${article.commentCount}</p>
            </div>
          </div>
      </c:forEach>

      <div class="row col-md-10 col-md-offset-1">
        <h1><span class="label label-warning">${result.tags[1].name}</span></h1>
        <br>
      </div>

      <input type="hidden" id="tagArticlesSize1" value="${fn:length(result.tagArticles[1])}">
      <c:forEach var="article" items="${result.tagArticles[1]}" varStatus="status">
          <div class="row col-md-10 col-md-offset-1 well">
            <div class="col-md-2">
              <br>
              <img src="${article.iconPath}" class="img-responsive">
              <a href="/TeraNavi/front/mypage?paramUserId=${article.userId}"><h3 class="text-center text-muted">${article.userName}</h3></a>
            </div>
            <div class="col-md-7">
              <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
              <p id="1tag${status.index}"><c:out value="${fn:substring(article.articleBody, 0, 30)}" /></p>
              <div class="text-right">
                <a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
              </div>
            </div>
            <div class="col-md-3">
              <br>
              <br>
              <p>${article.createdDate}</p>
              <br>
              <p>コメント数 ${article.commentCount}</p>
            </div>
          </div>
      </c:forEach>

      <div class="row col-md-10 col-md-offset-1">
        <h1><span class="label label-warning">${result.tags[2].name}</span></h1>
        <br>
      </div>

       <input type="hidden" id="tagArticlesSize2" value="${fn:length(result.tagArticles[2])}">
      <c:forEach var="article" items="${result.tagArticles[2]}"  varStatus="status">
          <div class="row col-md-10 col-md-offset-1 well">
            <div class="col-md-2">
              <br>
              <img src="${article.iconPath}" class="img-responsive">
              <a href="/TeraNavi/front/mypage?paramUserId=${article.userId}"><h3 class="text-center text-muted">${article.userName}</h3></a>
            </div>
            <div class="col-md-7">
              <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
              <p id="2tag${status.index}"><c:out value="${fn:substring(article.articleBody, 0, 30)}" /></p>
              <div class="text-right">
                <a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
              </div>
            </div>
            <div class="col-md-3">
              <br>
              <br>
              <p>${article.createdDate}</p>
              <br>
              <p>コメント数 ${article.commentCount}</p>
            </div>
          </div>
      </c:forEach>
</c:when>
<c:otherwise>
    <div class="row col-md-10 col-md-offset-1">
      <p class="text-center">まだタグ付けされた記事がありません</p>
    </div>
</c:otherwise>
</c:choose>


    </div><!-- contener -->
</div> <!-- section -->
