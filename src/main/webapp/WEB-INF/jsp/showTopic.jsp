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
            <meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="/TeraNavi/css/search.css" rel="stylesheet" type="text/css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
        </head>
        <body>

			<form action="front/showTopic" method="post" name="showForm">
				<input type="text" name="communityId" value="${result.communityId}">
				<button type="submit" name="button">一覧表示</button>
			</form>


            <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
        </body>
    </html>
