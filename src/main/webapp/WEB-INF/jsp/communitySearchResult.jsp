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
    <title>コミュニティ一覧</title>
    <!-- Latest compiled and minified CSS -->
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
    <div class="container">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1">
                <c:forEach var="comm" items="${result}">
                    <div class="row" id="communityList">
                        <div class="col-md-1">
                            <img src="${comm.iconPath}" id="topicIcon">
                        </div>
                        <!--
                            <div class="col-md-2">
                            <form action="showcomm" method="post" name="showForm">
                                <input type="hidden" name="commId" value="${comm.id}"></input>
                                <input type="submit" id="showCom" value="詳細へ"></input>
                            </form>
                        -->
                        <div class="col-md-5">
                            <h4 id="title" class="text-left">
                                <a href="showcomm?commId=${comm.id}"><c:out value="${comm.name}" /></a>
                            </h4>
                        </div>
                        <div class="col-md-5">
                            <h4 id="title" class="text-left">
                                <c:out value="${comm.profile}" /></a>
                            </h4>
                        </div>
                        <div class="col-md-1">
                            <h4 id="title" class="text-left">
                                <c:out value="${comm.countMember}" /></a>
                            </h4>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>


</body>
</html>
