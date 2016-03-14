<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>コミュニティ管理</title>
    <!-- Latest compiled and minified CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">
        <jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>
    <%-- トップのナビゲーションを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

    <div class="section">
        <div class="container">
            <div class="row">

                <div class="col-md-2 hidden-xs">
                    <jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
                    <script>
                      $("#commMgrTab").attr("class","active");
                    </script>

                    </script>
                </div>
                <!--モバイル用のドロップダウンメニュー-->
                <div class="container visible-xs">
                    <div class="dropdown">
                        <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">コミュニティ管理<span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li id="mypageTab">
                                <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.loginUser.blogStatus eq 1}">

                                    <li>
                                        <a href="/TeraNavi/front/showDraftArticleList?writeUserId=${sessionScope.loginUser.id}">下書き一覧</a>
                                    </li>
                                    <li>
                                        <a href="/TeraNavi/front/showBlog?edit=true&bloguserId=${sessionScope.loginUser.id}">ブログ設定</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="/TeraNavi/blogSetting">ブログ開設</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li>
                                <a href="/TeraNavi/front/commmy?groupBy=group+By+community_members_list.fk_community_id+&where=community_members_list.fk_user_id%3D+%3F+and+communities.community_delete_flag+%3D0+and+community_members_list.community_withdrawal_flag+%3D0&target=create">コミュニティ管理</a>
                            </li>
<!--									<li>
                                <a href="/TeraNavi/front/showDmList">DM</a>
                            </li>-->
                            <br><br>
                            <li>
                                <a href="/TeraNavi/withdraw">退会</a>
                            </li>


                        </ul>
                    </div>
                </div>

                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div class="col-md-8">
                    <c:choose>
                        <c:when test="${fn:length(result.list) > 0}">
                            <div class="col-xs-10 col-xs-offset-1">
                                <h1 class="text-warning">作成したコミュニティ</h1>
                            </div>
                            <c:forEach var="comm" items="${result.list}">
                                <c:if test="${comm.adminFlag eq 1}">
                                    <div class="row col-md-10 col-md-offset-1 well">
                                        <div class="col-md-2">
                                            <img src="${comm.iconPath}" id="topicIcon" class="img-thumbnail">
                                        </div>
                                        <div class="col-md-7">
                                            <a href="/TeraNavi/front/showcomm?commId=${comm.id}">
                                                <h2 class="text-muted">${comm.name}</h2>
                                            </a>
                                            <p id="articleBody">${comm.profile}...</p>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="edit">
                                                <form action="commSetting" method="post" name="showDel">
                                                    <input type="hidden" name="commId" value="${comm.id}">
                                                    <input type="hidden" name="commName" value="${comm.name}">
                                                    <input type="hidden" name="commProfile" value="${comm.profile}">
                                                    <input type="hidden" name="iconPath" value="${comm.iconPath}">
                                                    <input type="hidden" name="headerPath" value="${comm.headerPath}">
                                                    <input type="hidden" name="nowIconPath" value="${comm.iconPath}">
                                                    <input type="hidden" name="nowHeaderPath" value="${comm.headerPath}">
                                                    <input type="hidden" name="deleteFlag" value="${comm.deleteFlag}">
                                                    <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
                                                    <input type="hidden" name="del" value="del">
                                                    <input type="hidden" name="target" value="communityDeleteResult">
                                                    <input type="submit" id="showDel" value="削除"></input>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>

                            <div class="col-xs-10 col-xs-offset-1">
                                <hr>
                            </div>

                            <div class="col-xs-10 col-xs-offset-1">
                                <h1 class="text-warning">参加しているコミュニティ</h1>
                            </div>
                            <c:forEach var="comm2" items="${result.list}">
                                <c:if test="${comm2.adminFlag ne 1}">
                                    <div class="row col-md-10 col-md-offset-1 well">
                                        <div class="col-md-2">
                                            <img src="${comm2.iconPath}" id="topicIcon" class="img-thumbnail">
                                        </div>
                                        <div class="col-md-7">
                                            <a href="/TeraNavi/front/showcomm?commId=${comm2.id}">
                                                <h2 class="text-muted">${comm2.name}</h2>
                                            </a>
                                            <p id="articleBody">${comm2.profile}...</p>
                                        </div>

                                        <div class="col-md-2">
                                            <form action="/TeraNavi/front/withDrawComm" method="post" name="showDel">
                                                <input type="hidden" name="commId" value="${comm.id}">
                                                <input type="hidden" name="commName" value="${comm.name}">
                                                <input type="hidden" name="target" value="community_withdrawal_flag=1">
                                                <input type="submit" id="showDel" value="退会"></input>
                                            </form>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p class="text-center">まだコミュニティに参加していません</p>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
