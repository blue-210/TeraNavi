<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>トピック一覧</title>
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
            <h1>トピックを作成しました</h1>

			<h1>トピック名 : ${result.topic_name}</h1>
			<button type="button" onclick="document.showForm.submit();">トピックの一覧を表示</button>
			<form action="showTopic" method="post" name="showForm">
				<input type="hidden" name="communityId" value="${result.communityId}">
			</form>


            <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
        </body>
    </html>
