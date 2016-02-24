<div class="section">
    <div class="container">
      <div class="row col-md-10 col-md-offset-1">
          <a class="btn btn-warning btn-lg" href="/TeraNavi/createcomm" role="button" style="margin-left: 80%;">コミュニティ作成</a>
          <h1 class="text-warning">人気コミュニティ</h1>
      </div>
      <div class="row col-md-10 col-md-offset-1">
        <c:forEach var="community" items="${result.community}">
            <div class="col-md-4 well well-lg"><!--コミュニティ一件の領域-->
              <div class="row"><!--コミュニティヘッダ画像の領域-->
                  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
              </div><!--コミュニティヘッダ画像の領域おわり-->
              <div class="row"><!--コミュニティ名と紹介文の領域-->
                <a href="/TeraNavi/front/showcomm?commId=${community.id}">
                    <h3 class="text-center text-muted">${community.name}</h3>
                </a>
                <p class="text-center">${community.profile}</p>
              </div><!--コミュニティ名と紹介文の領域おわり-->

              <c:choose>
                  <c:when test="${not empty sessionScope.loginUser.id}">
                      <div class="row text-right"><!-- 参加するボタンの領域 -->
                          <a class="btn btn-warning" href="/TeraNavi/front/showcomm?commId=${community.id}">
                              参加する
                          </a>
                    </div><!-- 参加するボタンの領域おわり -->
                  </c:when>
              </c:choose>
          </div><!--コミュニティ一件の領域おわり-->
        </c:forEach>
      </div>
    </div>
 </div>
 <div class="section">
    <div class="container">
      <div class="row col-md-10 col-md-offset-1">
        <h1 class="text-warning">新着トピックのあるコミュニティ</h1>
      </div>
      <div class="row col-md-10 col-md-offset-1">
        <c:forEach var="community" items="${result.community}">
            <div class="col-md-4 well well-lg"><!--コミュニティ一件の領域-->
              <div class="row"><!--コミュニティヘッダ画像の領域-->
                  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                  class="img-responsive">
              </div><!--コミュニティヘッダ画像の領域おわり-->
              <div class="row"><!--コミュニティ名と紹介文の領域-->
                <a href="/TeraNavi/front/showcomm?commId=${community.id}">
                    <h3 class="text-center text-muted">${community.name}</h3>
                </a>
                <p class="text-center">${community.profile}</p>
              </div><!--コミュニティ名と紹介文の領域おわり-->
              <div class="row text-right"><!-- 参加するボタンの領域 -->
                   <a class="btn btn-warning" href="/TeraNavi/front/partiComm?commId=${community.id}">参加する</a>            </div><!-- 参加するボタンの領域おわり -->
          </div><!--コミュニティ一件の領域おわり-->
        </c:forEach>
      </div>
    </div>
</div>

<div class="section">
    <div class="container">
    　<div class="row col-md-10 col-md-offset-1">
    　　<h1 class="text-warning">最近作成されたコミュニティ</h1>
    　</div>
      <div class="row col-md-10 col-md-offset-1">
        <c:forEach var="community" items="${result.community}">
            <div class="col-md-4 well well-lg"><!--コミュニティ一件の領域-->
              <div class="row"><!--コミュニティヘッダ画像の領域-->
                  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                  class="img-responsive">
              </div><!--コミュニティヘッダ画像の領域おわり-->
              <div class="row"><!--コミュニティ名と紹介文の領域-->
                <a href=href="/TeraNavi/front/showcomm?commId=${community.id}">
                    <h3 class="text-center text-muted">${community.name}</h3>
                </a>

                <p class="text-center">${community.profile}</p>
              </div><!--コミュニティ名と紹介文の領域おわり-->
              <div class="row text-right"><!-- 参加するボタンの領域 -->
                 <a class="btn btn-warning" href="/TeraNavi/front/partiComm?commId=${community.id}">参加する</a>
             </div><!-- 参加するボタンの領域おわり -->
          </div><!--コミュニティ一件の領域おわり-->
        </c:forEach>
      </div>
    </div>
</div>
