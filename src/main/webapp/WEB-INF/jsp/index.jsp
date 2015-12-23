<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.util.ArrayList, bean.ThreadBean, java.util.Iterator"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <jsp:include page="header.jsp"/>

    <div class="container">
       <div class="row">
           <h1>トップページだよ</h1>
           <h1>CommentPostのテスト</h1>
           <form action="compost" method="post">
               <input type="text" name="userId"><br>
               <input type="text" name="articleId"><br>
               <input type="text" name="body"><br>
               <input type="submit" value="test">
           </form>
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="footer.jsp"/>
</body>
</html>
