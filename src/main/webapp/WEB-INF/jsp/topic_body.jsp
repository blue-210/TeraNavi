<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>トピックページ</title>
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

            <!-- Optional theme -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        </head>
        <body>
            <%-- ヘッダー部分のHTMLを読み込み --%>
            <jsp:include page="/WEB-INF/jsp/header.jsp"/>
            <h1>>${session.topic.name}</h1>

            <c:forEach var="topic" items="topics">
                <li class="list-group-item">
                    <ul class="media-list">
                        <li class="media">
                            <a class="media-left" href="#">
                                <img arc="">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">${session.topic.name}</h4>
                                ${session.topic.updateDate}
                            </div>
                        </li>
                    </ul>
                </li>
            </c:forEach>
            <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
        </body>
    </html>
