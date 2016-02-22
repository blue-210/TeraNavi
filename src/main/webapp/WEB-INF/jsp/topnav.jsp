<div class="section">
    <div class="container">
      <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
          <ul class="lead nav nav-justified nav-tabs">
            <li>
              <a href="/TeraNavi/front/top" class="text-warning">TOP</a>
            </li>
            <li>
              <a href="/TeraNavi/front/top#blog" class="text-warning">ブログ</a>
            </li>
            <li>
              <a href="/TeraNavi/front/top#community" class="text-warning">コミュニティ</a>
            </li>
            <li>
              <a href="/TeraNavi/front/top#tag" class="text-warning">タグ</a>
            </li>
<c:choose>
<c:when test="${sessionScope.loginUser.id eq result.user.id}">
            <li class="active">
              <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
            </li>
</c:when>
<c:otherwise>
            <li>
              <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
            </li>
</c:otherwise>
</c:choose>
          </ul>
        </div>
      </div>
    </div>
</div>
