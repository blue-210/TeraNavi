<div class="section">
    <div class="container">
      <div class="row col-md-10 col-md-offset-1">
        <h1 class="text-warning">各科新着記事</h1>
      </div>

        <c:forEach var="article" items="${result.department}">
          <div class="row col-md-10 col-md-offset-1 well">
            <div class="col-md-2">
              <br>
              <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
              class="img-responsive">
              <a href=""><h3 class="text-center text-muted">${article.userName}</h3></a>
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

    </div><!-- contener -->
</div> <!-- section -->


<div class="section">
    <div class="container">
    　<div class="row col-md-10 col-md-offset-1">
    　 　<h1 class="text-warning">人気ブログ</h1>
    　</div>
      <div class="row col-md-10 col-md-offset-1">
        <c:forEach var="blog" items="${result.blog}">
            <div class="col-md-4 well well-lg"><!--ブログ一件の領域-->
              <div class="row"><!--アイコンとユーザー名の領域-->
                <div class="col-md-5">
                  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                  class="img-responsive">
                </div>
                <div class="col-md-7">
                  <a href=""><h2 class="text-center text-muted">ユーザ名</h2></a>
                </div>
              </div><!--アイコンとユーザー名の領域おわり-->
              <div class="row"><!--ブログ名と紹介文の領域-->
                <h1 class="text-center"><a href=""><h3 class="text-muted">${blog.title}</h3></a></h1>
                <p class="text-center">${blog.explanation}</p>
              </div><!--ブログ名と紹介文の領域おわり-->
          </div><!--ブログ一件の領域おわり-->
        </c:forEach>

      </div>
    </div>
</div>
