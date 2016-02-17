<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>コミュニティメンバー</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/fileup.js"></script>

    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">

</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>
    <header>
        <img src='${result.community.headerPath}' id="headimg"></span></p>
        <img class="pull-left" src='${result.community.iconPath}'width="200px" height="200px" id="icon"></span></p>
        <span id="name" class="col-md-8 text-center">${result.community.name}</span>
    </header>

    <div class="container">
        <div class="row">
            <form action="commGra" method="post">
                <p><button id="dd">権限付与</button></p>
			    <div class="container">
                    <div class="row text-center">
                        <div class="col-xs-10">
                            <h1>メンバー一覧</h1>

                            <div class="row">
                                <c:forEach var="member" items="${result.members}">
                                    <div class="col-md-3">
                                        <img src="${member.iconPath}" class="img-responsive">
                                        <h4>${member.userName}</h4>
                                        <input type="hidden" name="targetNo" value="${member.id}">
								        <input type="hidden" name="communityId" value="${result.value}">

                                        <div class="check"></div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
					</div>
				</div>
                <p id="sub"></p>
            </form>
        </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>


    <script>
        $("#dd").click(function(){
            $('.check').append('<input type="checkbox">');
            $('#sub').append('<input type="submit" value="確定">');
        });
    </script>




</body>
</html>
