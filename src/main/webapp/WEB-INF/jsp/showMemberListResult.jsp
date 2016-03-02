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
    <form action="commSetting" method="post" id="setting" >

    <img src="${result.community.headerPath}" id="headimg">
    <label for="headerFile" id="headerPath">
            <input type="file" id="headerFile" style="display:none">
    </label>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-5">
                <p> <span id="name" class="col-md-12 text-center" style="position:relative;margin-top:-200px;margin-left:20px;background-color:rgba(255,255,255,0.7);font-size: 60px;">${result.community.name}</span>
                </p>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <img id="icon" src="${result.community.iconPath}" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px;"></img>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <form action="commGra" method="post">
    			    <div class="container">
                        <div class="row text-center">
                            <div class="col-xs-10">
                                <h1>コミュニティメンバー</h1>
                                <div class="row">
                                    <c:forEach var="member" items="${result.members}">
                                        <div class="col-md-3">
                                            <img src="${member.iconPath}" class="img-responsive">
                                            <h4>${member.userName}</h4>
                                            <input type="hidden" name="targetUser" value="${member.id}">
    								        <input type="hidden" name="communityId" value="${result.value}">
                                            <c:choose>
                                                <c:when test="${result.community.adminFlag eq 1}">
                                                    <div class="check"></div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
    					</div>
    				</div>
                    <c:choose>
                        <c:when test="${result.community.adminFlag eq 1}">
                            <p id="sub"></p>
                        </c:when>
                    </c:choose>
                </form>
            </div><!--end row-->
        </div><!--end container-->
    </div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>


    <script>
        $(function(){
            $('.check').append('<input type="checkbox">');
            $('#sub').append('<input type="submit" value="権限付与">');
        });
    </script>




</body>
</html>
