<div class="section">
    <div class="container">
      <div class="row col-md-10 col-md-offset-1">
        <h1 class="text-warning">人気タグ</h1>
      </div>

      <div class="row col-md-10 col-md-offset-1">
        <h1><span class="label label-warning">タグ名</span></h1>
        <br>
      </div>

      <c:forEach var="article" items="${result.article}">
          <div class="row col-md-10 col-md-offset-1 well">
            <div class="col-md-2">
              <br>
              <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
              class="img-responsive">
              <a href=""><h3 class="text-center text-muted">ユーザ名</h3></a>
            </div>
            <div class="col-md-7">
              <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
              <p>${article.articleBody}...</p>
              <div class="text-right">
                <a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
              </div>
            </div>
            <div class="col-md-3">
              <br>
              <br>
              <p>投稿日時 ${article.createdDate}</p>
              <br>
              <p>コメント数 ${article.commentCount}</p>
            </div>
          </div>
      </c:forEach>

      <div class="row col-md-10 col-md-offset-1">
        <h1><span class="label label-warning">タグ名</span></h1>
        <br>
      </div>

      <c:forEach var="article" items="${result.article}">
          <div class="row col-md-10 col-md-offset-1 well">
            <div class="col-md-2">
              <br>
              <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
              class="img-responsive">
              <a href=""><h3 class="text-center text-muted">ユーザ名</h3></a>
            </div>
            <div class="col-md-7">
              <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
              <p>${article.articleBody}...</p>
              <div class="text-right">
                <a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
              </div>
            </div>
            <div class="col-md-3">
              <br>
              <br>
              <p>投稿日時 ${article.createdDate}</p>
              <br>
              <p>コメント数 2</p>
            </div>
          </div>
      </c:forEach>

      <div class="row col-md-10 col-md-offset-1">
        <h1><span class="label label-warning">タグ名</span></h1>
        <br>
      </div>

      <c:forEach var="article" items="${result.article}">
          <div class="row col-md-10 col-md-offset-1 well">
            <div class="col-md-2">
              <br>
              <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
              class="img-responsive">
              <a href=""><h3 class="text-center text-muted">ユーザ名</h3></a>
            </div>
            <div class="col-md-7">
              <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><h2 class="text-muted">${article.title}</h2></a>
              <p>${article.articleBody}...</p>
              <div class="text-right">
                <a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
              </div>
            </div>
            <div class="col-md-3">
              <br>
              <br>
              <p>投稿日時 ${article.createdDate}</p>
              <br>
              <p>コメント数 2</p>
            </div>
          </div>
      </c:forEach>

    </div><!-- contener -->
</div> <!-- section -->
