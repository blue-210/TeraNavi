

<div class="section">
    <div class="container">
        <div class="row">
            <!-- 4列をサイドメニューに割り当て -->
            <div class="col-md-2">
              <ul class="nav nav-pills nav-stacked well">
                <li class="active">
                  <a href="#mypage">マイページ</a>
                </li>
                <li>
                  <a href="/TeraNavi/articlepost">記事を書く</a>
                </li>
                <li>
                  <a href="#draftarticle">下書き一覧</a>
                </li>
                <li>
                  <a href="#blogsetting">ブログ設定</a>
                </li>
                <li>
                  <a href="#communitymanage">コミュニティ管理</a>
                </li>
                <li>
                  <a href="#directmessage">DM</a>
                </li>
                <br><br><br><br>
                <li>
                  <a href="#leave">退会</a>
                </li>
              </ul>
            </div>
        </div><!-- row -->
    </div><!-- contener -->
</div> <!-- section -->

<form name="form">
    <input type="hidden" name="loginUserId" value="${sessionScope.loginUser.id}">
</form>
