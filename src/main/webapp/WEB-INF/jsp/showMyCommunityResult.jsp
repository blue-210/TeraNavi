<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
   import="ttc.bean.ArticleBean"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>作成したコミュニティ</title>
    <!-- Latest compiled and minified CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">

</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>
    <div class="section">
        <div class="container">
            <div class="row">

                <div class="col-md-2">
                  <ul class="nav nav-pills nav-stacked well">
                    <li class="active">
                      <a href="#">マイページ</a>
                    </li>
                    <li>
                      <a href="/TeraNavi/articlepost">記事を書く</a>
                    </li>
                    <li>
                        <a href="/TeraNavi/front/showDraftArticleList?writeUserId=${sessionScope.loginUser.id}">下書き一覧</a>
                    </li>
                    <c:choose>
                        <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                            <li>
                                <a href="/TeraNavi/blogSetting">ブログ設定</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="active">
                                <a href="/TeraNavi/blogSetting">ブログ開設</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <li>
                        <a href="/TeraNavi/front/commmy?groupBy=group+By+community_members_list.fk_community_id+&where=community_members_list.fk_user_id%3D+%3F+and+communities.community_delete_flag+%3D0+and+community_members_list.community_withdrawal_flag+%3D0&target=create">
                          コミュニティ管理
                        </a>
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
                    <div class="col-xs-10 col-xs-offset-1">
                        <h1 class="text-warning">作成したコミュニティ</h1>
                    </div>
                    <c:forEach var="comm" items="${result.list}">
                        <c:if test="${comm.adminFlag eq 1}">
                            <div class="row col-md-10 col-md-offset-1 well">
                                <div class="col-md-2">
                                    <img src="${comm.iconPath}" id="topicIcon">
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
                                            <input type="hidden" name="headerPath" value="${comm.headerPath}">
                                            <input type="hidden" name="deleteFlag" value="${comm.deleteFlag}">
                                            <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
                                            <input type="hidden" name="del" value="del">
                                            <input type="submit" id="showDel" value="削除"></input>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                <div class="col-xs-10 col-xs-offset-1">
                    <h1 class="text-warning">参加しているコミュニティ</h1>
                </div>
                    <c:forEach var="comm2" items="${result.list}">
                        <c:if test="${comm2.adminFlag ne 1}">
                            <div class="row col-md-10 col-md-offset-1 well">
                                <div class="col-md-2">
                                    <img src="${comm2.iconPath}" id="topicIcon">
                                </div>
                                <div class="col-md-7">
                                    <a href="/TeraNavi/front/showcomm?commId=${comm.id}">
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
                </div>
            </div>
        </div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
