  <ul class="nav nav-pills nav-stacked well">
    <li id="mypageTab">
      <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a>
    </li>
    <c:choose>
        <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
            <li id="articlePostTab">
              <a href="/TeraNavi/articlepost">記事を書く</a>
            </li>
            <li id="draftArticleTab">
                <a href="/TeraNavi/front/showDraftArticleList?writeUserId=${sessionScope.loginUser.id}">下書き一覧</a>
            </li>
            <li id="blogSettingTab">
                <a href="/TeraNavi/front/showBlog?targetURL=blogSetting">ブログ設定</a>
            </li>
        </c:when>
        <c:otherwise>
            <li id="openBlogTab">
                <a href="/TeraNavi/blogSetting">ブログ開設</a>
            </li>
        </c:otherwise>
    </c:choose>
    <li id="commMgrTab">
      <a href="/TeraNavi/front/commmy?groupBy=group+By+community_members_list.fk_community_id+&where=community_members_list.fk_user_id%3D+%3F+and+communities.community_delete_flag+%3D0+and+community_members_list.community_withdrawal_flag+%3D0&target=create">コミュニティ管理</a>
    </li>
    <li id="dmTab">
      <a href="/TeraNavi/front/showDmList">DM</a>
    </li>
    <br><br><br><br>
    <li id="withdrawTab">
      <a href="/TeraNavi/withdraw">退会</a>
    </li>
  </ul>


<form name="form">
    <input type="hidden" name="loginUserId" value="${sessionScope.loginUser.id}">
</form>
