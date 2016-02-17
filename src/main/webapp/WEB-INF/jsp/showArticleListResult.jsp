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
    <title>記事一覧表示</title>
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
            <table class="table table-striped">
               <thead>
                   <tr>
                       <th class="deletable"></th>
                       <th>タイトル</th>
                       <th>内容</th>
                       <th>投稿日時</th>
                       <!-- <th class="deletable"></th> -->
                   </tr>
               </thead>
               <tbody>
                   <form name="form" method="post" action="/TeraNavi/front/deleteArticle">
                       <input type="hidden" name="loginUserId" value="${sessionScope.loginUser.id}">
                       <input type="hidden" name="articleUserId" value="${result[0].userId}">
                       <c:forEach var="article" items="${result}">
                       <tr>
                           <td class="deletable"> <input class="chDelete" type="checkbox" name="articleId" value="${article.articleId}"> </td>
                           <td> <a href="/TeraNavi/front/showArticle?articleId=${article.articleId}">
                               <c:out value="${article.title}"/>
                           </a> </td>
                           <td> ${article.articleBody} </td>
                           <td> <c:out value="${article.createdDate}"/> </td>
                           <!-- <td class="deletable"> <a href="/TeraNavi/deletArticle">編集</a> </td> -->
                       </tr>
                       </c:forEach>
                       <button id="btnDelete" class="deletable" type="submit" onclick="location.href='/TeraNavi/front/deleteArticle'">削除</button>
                   </form>
               </tbody>
           </table>
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    <script>
        var loginUserId = document.form.loginUserId.value;
        var articleUserId = document.form.articleUserId.value;
        console.log(loginUserId);
        console.log(articleUserId);

        if(loginUserId == articleUserId){
            $(function() {
                $("#btnDelete").attr("disabled","disabled");
                $("#btnDelete").attr("class","btn-default btn-sm");
                $(".chDelete").click(function() {
                    if ($(this).prop("checked") == false) {
                        $("#btnDelete").attr("disabled","disabled");
                        $("#btnDelete").attr("class","btn-default btn-sm");
                    }else{
                        $("#btnDelete").removeAttr("disabled");
                        $("#btnDelete").attr("class","btn-danger btn-sm");
                    }
                });
            });
        }else{
            $(".deletable").hide();
        }



    </script>
</body>
</html>
