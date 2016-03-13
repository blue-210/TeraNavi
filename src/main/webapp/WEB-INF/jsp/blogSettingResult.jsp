<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ブログの設定完了</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
    <jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
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

               <div calss="col-md-8">
                   <c:choose>
                       <c:when test="${result.status eq 0}">
                           <h1>ブログを閉鎖しました</h1>
                           <p>３秒後にマイページに戻ります<br>
                               戻らないに場合は<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">こちら</a></p>
                        </c:when>
                        <c:otherwise>
                            <h1>ブログの設定を変更しました</h1>
                            <p>３秒後にマイページに戻ります<br>
                                戻らないに場合は<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">こちら</a></p>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
    <script>
    $(document).ready( function(){

        setTimeout(function(){
            window.location.href = './mypage?paramUserId=${sessionScope.loginUser.id}';
        }, 3000);

    });


    </script>


</body>
</html>
