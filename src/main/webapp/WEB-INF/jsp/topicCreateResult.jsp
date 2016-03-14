<!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>トピック一覧</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="/TeraNavi/css/search.css" rel="stylesheet" type="text/css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
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
