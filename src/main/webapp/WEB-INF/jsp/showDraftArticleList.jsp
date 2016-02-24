
<!DOCTYPE html>
<html lang="ja">
<head>

    <meta charset="UTF-8">

    <title>マイページ</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">

</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <%-- トップのナビゲーションを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

    <div class="section">
        <div class="container">
            <div class="row">


                <!-- 2列をサイドメニューに割り当て -->
                <div class="col-md-2">
                    <jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
                    <script>
                      $("#blogSettingTab").attr("class","active");
                      $("#openBlogTab").attr("class","active");
                    </script>

                </div>

                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div class="col-md-8">

                    <div class="row">
                        <table class="table table-striped">
                           <thead>
                               <tr>
                                   <th>タイトル</th>
                                   <th>投稿日時</th>
                                   <!-- <th class="deletable"></th> -->
                               </tr>
                           </thead>
                           <tbody>
                               <c:forEach var="article" items="${result}">
                               <tr>
                                   <td> <c:out value="${article.title}"/> </td>
                                   <td> <c:out value="${article.createdDate}"/> </td>
                                   <!-- <td class="deletable"> <a href="/TeraNavi/deletArticle">編集</a> </td> -->
                               </tr>
                               </c:forEach>
                           </tbody>
                       </table>
                   </div><!--end row-->

           </div><!--end row-->
        </div><!--end container-->
    </div><!--end section-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
