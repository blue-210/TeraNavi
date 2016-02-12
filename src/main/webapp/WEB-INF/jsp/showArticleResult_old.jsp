<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>記事表示</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="container">
       <div class="row">

           <h1>${result.title}</h1>
           <p>${result.createdDate}</p>
           <h2>${result.articleBody}</h2><br>

<%--
           <%
                ArticleBean ab = (ArticleBean)request.getAttribute("result");
                ArrayList tags = (ArrayList)ab.getTags();
                ArrayList comments = (ArrayList)ab.getComments();
                request.setAttribute("tags", tags);
                request.setAttribute("comments", comments);
            %>

            <h2>タグ</h2>
            <c:forEach var="tag" items="${tags}">
                <c:out value="${tag.name}" />
            </c:forEach>

            <h2>コメント</h2>
            <c:forEach var="comment" items="${comments}">
                <c:out value="${comment.userName}" />
                <c:out value="${comment.iconPath}" />
                <c:out value="${comment.commentDate}" />
                <c:out value="${comment.commentBody}" />
            </c:forEach>
--%>
<!--警告する関連 -->
    <p class="bun"><button id="dd">警告する</button></p>
    <form action="caution" method="post">
        <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
        <input type="hidden" name="cautionUserId" value="${result.userId}">
        <p id="cauTile"></p>
        <p id="cauBody"></p>
        <p id="sub"></p>
    </form>

       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
    <script>
        $("#dd").click(function(){
            $('.bun').remove();
            $('#cauTile').html('警告名：<input type="text" name="cautionTitle">');
            $('#cauBody').html('警告する内容：<input type="text" name="cautionBody" >');
            $('#cauBody').append('<input type="hidden" name="url" value="location.href">');
            $('#sub').html('<input type="submit" value="この記事を警告">');
        });

    </script>
</body>
</html>
