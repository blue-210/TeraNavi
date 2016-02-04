<div class="section">
    <div class="container">
      <div class="row col-md-10 col-md-offset-1">
        <h1 class="text-warning">人気コミュニティ</h1>

        <c:forEach var="community" items="${result.community}">
            <div class="col-md-4 well well-lg"><!--コミュニティ一件の領域-->
              <div class="row"><!--コミュニティヘッダ画像の領域-->
                  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                  class="img-responsive">
              </div><!--コミュニティヘッダ画像の領域おわり-->
              <div class="row"><!--コミュニティ名と紹介文の領域-->
                <h1 class="text-center">${community.name}</h1>
                <p class="text-center">${community.profile}</p>
              </div><!--コミュニティ名と紹介文の領域おわり-->
              <div class="row text-right"><!-- 参加するボタンの領域 -->
                <a class="btn btn-warning" href="/TeraNavi/front/showArticle?articleId=${article.articleId}">続きを読む</a>
            </div><!-- 参加するボタンの領域おわり -->
          </div><!--コミュニティ一件の領域おわり-->
        </c:forEach>

      </div>
    </div>
</div>
