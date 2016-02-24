
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

    <div class="section">
        <div class="container">
            <div class="row">

<c:choose>
<c:when test="${sessionScope.loginUser.id eq result.user.id}">


                <!-- 2列をサイドメニューに割り当て -->
                <div class="col-md-2">
                  <jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
                </div>
                <script>
                  $("#mypageTab").attr("class","active");
                </script>

                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div class="col-md-8">
</c:when>
<c:otherwise>

                <div class="col-md-8 col-md-offset-2">

</c:otherwise>
</c:choose>
                    <div class="row">
                        <div class="col-md-12">
                            <img src="${result.user.headerPath}" style="width:100%; height:200px">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <img src="${result.user.iconPath}" class="img-thumbnail" style="width:130px; height:130px; position:relative; bottom:100px; margin-left:20px">
                            <h3 style="position:relative; margin-top:-100px; margin-left:20px;">${result.user.userName}</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <br>
                            <p style="position:relative;" class="well">${result.user.profile}</p>
                            <c:if test="${sessionScope.loginUser.id eq result.user.id}">
                                <a href="/TeraNavi/userSetting" class="btn btn-default pull-right">プロフィール編集</a>
                            </c:if>
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
                                          <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><p class="text-muted">${article.title}</p></a>
                                      </td>
                                      <td>${article.createdDate}</td>
                                    </tr>
                                    <tr>
                                </c:forEach>
                              </tbody>
                            </table>
                            <a href="/TeraNavi/front/showArticleList?writeUserId=${sessionScope.loginUser.id}&scope=-1" class="btn btn-warning pull-right">もっと見る</a>　
                            <br>
                            <br>
                            <br>
                            <h1 class="text-warning">参加中のコミュニティ</h1>
                            <table class="table table-striped">
                              <tbody>
								  <c:forEach var="community" items="${sessionScope.myCommunities}">
									<tr>
										<td>
										  <img src="${community.iconPath}" class="img-thumbnail"
										  style="width:50px;height:50px;">
										</td>
										<td>${community.name}</td>
										<td>
										<form action="/TeraNavi/front/withDrawComm" method="post" name="showDel">
											<input type="hidden" name="commId" value="${community.id}">
											<input type="hidden" name="commName" value="${community.name}">
											<input type="hidden" name="target" value="community_withdrawal_flag=1">
											<button type="submit" class="btn btn-danger pull-right">退会</button>
										</form>
										</td>
									</tr>

								  </c:forEach>

                              </tbody>
                            </table>
                            <a class="btn btn-warning pull-right">もっと見る</a>
                        </div>
                    </div>

                    <div class="col-sm-3 col-xs-6">
                        <a href="/TeraNavi/dmsend">DMの送信</a><br><br>
                    </div>
                    <div class="col-sm-3 col-xs-6">
         			   <a href="/TeraNavi/blogDelete">ブログ閉鎖</a><br><br>

                        <a href="/TeraNavi/joincomm">コミュニティの参加</a><br><br>
                        <a href="#" onclick="document.comForm.submit();">コミュニティ一覧</a>
                        <form action="/TeraNavi/front/commList" method="post" name="comForm">
                            <input type="hidden" name="intention" value="list">
                        </form><br>
                        <a href="/TeraNavi/showTopic">トピックの一覧</a><br><br>
                    </div>
                </div>


           </div><!--end row-->
        </div><!--end container-->
    </div><!--end section-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
