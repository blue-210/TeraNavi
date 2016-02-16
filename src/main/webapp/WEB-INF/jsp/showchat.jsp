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
    <title>チャット</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="container">
       <div class="row">

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>お名前</th>
                    <th>内容</th>
                    <th>受信日時</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ch" items="${result}">
                  <tr>
                      <td> <c:out value="${ch.userName}"/> </td>
                      <td> <c:out value="${ch.body}"/> </td>
                      <td> <c:out value="${ch.date}" /> </td>
                  </tr>
                </c:forEach>
            </tbody>
        </table>

		<label>チャットを書き込む</label>
			<p>本文</p>
            <textarea name="chatBody" rows="10" cols="90"></textarea>
			<input type="hidden" name="topicId" value="${result[0].fkTopicId}">
			<input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
			<button id="chatwrite" type="button" name="button">書き込む</button>
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    <script src="/TeraNavi/js/script.js"></script>
</body>
</html>
