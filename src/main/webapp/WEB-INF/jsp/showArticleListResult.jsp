<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
   import="ttc.bean.ArticleBean"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <title>記事一覧表示</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/TeraNavi/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/TeraNavi/js/footerFixed.js"></script>
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
                           <td> ${ fn:substring(article.articleBody, 0, 30) } </td>
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
