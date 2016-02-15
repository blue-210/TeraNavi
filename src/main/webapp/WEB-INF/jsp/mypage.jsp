
<!DOCTYPE html>
<html lang="ja">
<head>

    <meta charset="UTF-8">

    <title>マイページ</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">

</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <%-- トップのナビゲーションを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

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
                      <a href="/TeraNavi/withdraw">退会</a>
                    </li>
                  </ul>
                </div>

                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div class="col-md-8">
                    <img src="${sessionScope.loginUser.headerPath}" alt="" />

         		   <img src="${sessionScope.loginUser.iconPath}" alt="" style="position:absolute;top:10%;left:20%;" /> ${sessionScope.loginUser.userName} さんのマイページです

         		   <h2>自己紹介文</h2>
         		   <textarea>${sessionScope.loginUser.profile}</textarea>

         		   <a href="userSetting">プロフィールを編集</a>

                    <div class="col-sm-3 col-xs-6">
                        <a href="articlepost">記事を投稿</a><br><br>
                        <a href="後でいれｔ">下書き</a><br><br>
                        <a href="blogSetting">ブログ設定</a><br><br>
                        <a href="commmy">コミュニティの管理</a><br><br>
                        <a href="後でいれｔ">コメント管理</a><br><br>
                        <a href="dmsend">DMの送信</a><br><br>
         			   <a href="front/dmreceive">DMの受信</a><br><br>
                        <a href="chatwrite">チャット送信</a><br><br>
                        <form action="front/showchat" method="post">
                            チャット受信<input type="text" name="topicId">
                        </form>
                        <a href="後でいれｔ">大会</a><br><br>
                        <a href="search">検索</a><br><br>

                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <a href="openBlog">ブログ開設</a><br><br>
                        <a href="blogSetting">ブログ設定</a><br><br>
         			   <a href="blogDelete">ブログ閉鎖</a><br><br>
                        <a href="createcomm">コミュニティの作成</a><br><br>
                        <a href="joincomm">コミュニティの参加</a><br><br>
                        <a href="#" onclick="document.comForm.submit();">コミュニティ一覧</a>
                        <form action="/TeraNavi/front/commList" method="post" name="comForm">
                            <input type="hidden" name="intention" value="list">
                        </form>
                    </div>
                </div>


           </div><!--end row-->
        </div><!--end container-->
    </div><!--end section-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
