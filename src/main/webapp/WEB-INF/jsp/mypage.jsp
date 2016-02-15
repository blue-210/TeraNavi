
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


                <!-- 2列をサイドメニューに割り当て -->
                <div class="col-md-2">
                  <ul class="nav nav-pills nav-stacked well">
                    <li class="active">
                      <a href="#">マイページ</a>
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


                    <div class="row">
                        <div class="col-md-12">
                            <img src="${sessionScope.loginUser.headerPath}" style="width:100%; height:200px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <img src="${sessionScope.loginUser.iconPath}" style="width:130px; height:130px; position:relative; bottom:180px;">
                            <h3 style="position:relative; margin-top:-170px;">${sessionScope.loginUser.userName}</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <br>
                            <p style="position:relative margin-top:200px;" class="well">${sessionScope.loginUser.profile}</p>
                            <a href="/TeraNavi/userSetting" class="btn btn-default pull-right">編集</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="text-warning">投稿した記事</h1>
                            <table class="table table-striped">
                              <tbody>
                                <c:forEach var="article" items="${result.article}">
                                    <tr>
                                      <td>
                                        <img src="https://unsplash.imgix.net/photo-1421986527537-888d998adb74?w=1024&amp;q=50&amp;fm=jpg&amp;s=e633562a1da53293c4dc391fd41ce41d"
                                        style="width:50px;height:50px;">
                                      </td>
                                      <td>
                                          <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><p class="text-muted">${article.title}</p></a>
                                      </td>
                                      <td>${article.createdDate}</td>
                                    </tr>
                                    <tr>
                                </c:forEach>
                              </tbody>
                            </table>
                            <a href="/TeraNavi/front/showArticleList?userId=${sessionScope.loginUser.id}" class="btn btn-warning pull-right">もっと見る</a>　
                            <br>
                            <br>
                            <br>
                            <h1 class="text-warning">参加中のコミュニティ</h1>
                            <table class="table table-striped">
                              <tbody>
                                <tr>
                                  <td>
                                    <img src="https://unsplash.imgix.net/photo-1421986527537-888d998adb74?w=1024&amp;q=50&amp;fm=jpg&amp;s=e633562a1da53293c4dc391fd41ce41d"
                                    style="width:50px;height:50px;">
                                  </td>
                                  <td>コミュにティ名</td>
                                  <td>
                                    <a class="btn btn-danger pull-right">退会</a>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                            <a class="btn btn-warning pull-right">もっと見る</a>
                        </div>
                    </div>

                    <div class="col-sm-3 col-xs-6">
                        <a href="後でいれｔ">下書き</a><br><br>
                        <a href="/TeraNavi/blogSetting">ブログ設定</a><br><br>
                        <a href="/TeraNavi/commmy">コミュニティの管理</a><br><br>
                        <a href="/TeraNavi/dmsend">DMの送信</a><br><br>
         			   <a href="/TeraNavi/front/dmreceive">DMの受信</a><br><br>
                        <a href="/TeraNavi/chatwrite">チャット送信</a><br><br>
                        <form action="/TeraNavi/front/showchat" method="post">
                            チャット受信<input type="text" name="topicId">
                        </form>
                        <a href="/TeraNavi/search">検索</a><br><br>

                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <a href="/TeraNavi/openBlog">ブログ開設</a><br><br>
                        <a href="/TeraNavi/blogSetting">ブログ設定</a><br><br>
         			   <a href="/TeraNavi/blogDelete">ブログ閉鎖</a><br><br>
                        <a href="/TeraNavi/createcomm">コミュニティの作成</a><br><br>
                        <a href="/TeraNavi/joincomm">コミュニティの参加</a><br><br>
                        <a href="#" onclick="document.comForm.submit();">コミュニティ一覧</a>
                        <form action="/TeraNavi/front/commList" method="post" name="comForm">
                            <input type="hidden" name="intention" value="list">
                        </form><br>
                        <a href="/TeraNavi/createtopic">トピックの作成</a><br><br>
                        <a href="/TeraNavi/showTopic">トピックの一覧</a><br><br>
                    </div>
                </div>


           </div><!--end row-->
        </div><!--end container-->
    </div><!--end section-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
