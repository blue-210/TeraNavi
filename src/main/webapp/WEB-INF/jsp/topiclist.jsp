<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>トピックリスト</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/fileup.js"></script>

    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">




</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>
    <form action="commSetting" method="post" id="setting" >

    <img src="${result.headerPath}" id="headimg">
    <label for="headerFile" id="headerPath">
            <input type="file" id="headerFile" style="display:none">
    </label>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-5">
                <p> <span id="name" class="col-md-12 text-center" style="position:relative;margin-top:-200px;margin-left:20px;background-color:rgba(255,255,255,0.7);font-size: 60px;">${result.name}</span>
                </p>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <img id="icon" src="${result.iconPath}" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px;"></img>
            </div>
        </div>
        <div class="section">
            <div class="container-fluid">
                <div class="row">
                    <form name="memberForm" action="/TeraNavi/front/showMemberList" method="post">
                        <input type="hidden" name="commId" value="${result.id}">
                    </form>
                    <div class="col-xs-1"></div>
                    <div class="col-xs-10">
                        <c:forEach var="item" items="${result.topics}">
                            <div class="row col-md-10 col-md-offset-1 well">
                                <div class="col-md-2">
                                    <img src="${item.userIconPath}" id="topicIcon">
                                    <p>
                                        <c:out value="${item.createUserName}" />
                                    </p>
                                </div>

                                <div class="col-md-7">
                                    <a href="showchat?topicId=${item.topicId}&communityId=${result.id}">
                                        <h2 class="text-muted">${item.name}</h2>
                                    </a>
                                </div>

                                <div class="col-md-2">
                                   <p id="date">
                                       <c:out value="${item.updateDate}" />
                                   </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10"></div>
                    <div class="col-md-2">
                        <a class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                            新しいトピックを作成
                        </a>
                        <!-- モーダルウィンドウの中身 -->
                        <div class="fade modal text-justify" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                            <h4 class="modal-title">新規トピック作成</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-10">
                                                    <h1>新しいトピック名</h1>
                                                    <form id="newtopic" action="/TeraNavi/front/createtopic" method="post">
                                                        <input type="text" size="50" name="topic_name">
                                                        <input type="hidden" name="communityId" value="${result.id}">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-default" form="newtopic" type="submit">作成する</button>
                                    </div>
                                </div>
                            </div>
                        </div><%-- modal-end--%>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
