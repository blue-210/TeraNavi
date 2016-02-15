<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>コミュニティ詳細</title>
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
       <form action="commSetting" method="post">
           <header>
               <p class="bun"><span id="headerPath"><img src='${result.headerPath}' id="headimg"></span></p>
               <p class="bun"><span id="iconPath"><img class="pull-left" src='${result.iconPath}'width="200px" height="200px" id="icon"></span></p>
               <p class="bun"><span id="name" class="col-md-8 text-center">${result.name}</span>
               <p class="bun"><button class="col-md-2 text-center" id="dd" style="display:none">編集</button></p>
               <p id="sub"></p>
           </header>

           <div class="section">
               <div class="container">
                   <div class="row">
                       <div class="col-xs-10">
                           <h1 class="text-primary">コミュニティ紹介文</h1>
                           <p id="commid" style="display:none">${result.id}</p>
                           <p id="userId" style="display:none">${sessionScope.loginUser.id}</p>
                           <p id="createId" style="display:none">${result.createUserId}</p>

                           <p class="bun"><span id="profile">${result.profile}</p></span>
                       </div>
                   </div>
               </div>
           </div>
       </form>

       <div class="section">
           <div class="container">
               <div class="row">
                   <div class="col-xs-10 col-xs-offset-1">
                       <h1 class="text-center text-primary">メンバー</h1>
                   </div>
               </div>

               <c:forEach var="member" items="${result.members}">
                   <div class="col-md-3">
                       <img src="${member.iconPath}" class="center-block img-circle img-responsive">
                       <h3 class="text-center"><c:out value="${member.userName}" /> </h3>
                   </div>
               </c:forEach>
           </div>
       </div>

       <p onclick="document.memberForm.submit();">
           メンバーの一覧を取得
       </p>
       <form name="memberForm" action="/TeraNavi/front/showMemberList" method="post">
           <input type="hidden" name="commId" value="${result.id}">
       </form>
       <div class="container">
           <div class="row">
               <div class="col-xs-10 col-xs-offset-1">
                   <c:forEach var="item" items="${result.topics}">
                       <div class="row" id="topiclist">
                               <div class="col-md-3">
                               <img src="${item.userIconPath}" id="topicIcon">
                                   <p>
                                       <c:out value="${item.createUserName}" />
                                   </p>
                           </div>
                           <div class="col-md-7">
                               <h4 id="title" class="text-left">
                                   <a href="showchat?topicId=${item.topicId}"><c:out value="${item.name}" /></a>
                               </h4>
                           </div>
                           <div class="col-md-2">
                               <p id="date">
                                   <c:out value="${item.updateDate}" />
                               </p>
                           </div>
                       </div>
                   </c:forEach>
                   <a href="/TeraNavi/front/showTopic?communityId=${result.id}">
                       <h2 class="text-muted">トピックリスト</h2>
                   </a>
              </div>
           </div>
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    <script>
    $(document).ready(function(){
        var flag = $("#userId").text() == $("#createId").text();
        if(flag){
            $("#dd").removeAttr("style")
        }

        $("#dd").click(function(){
            var id=$('#commid').text();
            var userid=$('#userId').text();
            var name=$('#name').text();
            var profile=$('#profile').text();
            var iconPath=$('#iconPath').text();
            var headerPath=$('#headerPath').text();
            var del='0';
            var target='communitySettingResult'
            $('.bun').remove();
            $('#name').html('コミュニティ名：<input type="text" name="commName" value="'+name+'">');
            $('#profile').html('紹介文：<input type="text" name="commProfile" value="'+profile+'">');
            $('#iconPath').html('アイコン画像：<input type="file" name="iconPath" value="'+iconPath+'">');
            $('#headerPath').html('ヘッダ画像<input type="file" name="headerPath" value="'+headerPath+'">');
            console.log(id);
            console.log(del);
            $('#userId').html('<input type="hidden" name="userId" value="'+userid+'">');
            $('#commid').html('<input type="hidden" name="commId" value="'+id+'">');
            $('#commid').append('<input type="hidden" name="deleteFlag" value="'+del+'">');
            $('#commid').append('<input type="hidden" name="target" value="'+target+'">');
            $('#sub').html('<input type="submit" value="変更">');
        });
    });
        var ajaxSettings;
        var ajax;
        $(function(){

            ajaxSettings = {
                type:'post',
                url:'/TeraNavi/upload',
                processData:false,
                contentType:false,
                cache:false,
                dataType:'json',
            }

            var flag = $("#userId").text() == $("#createId").text();
            if(flag){
                $("#dd").removeAttr("style")
            }

            $("#dd").click(function(){
                var id=$('#commid').text();
                var userid=$('#userId').text();
                var name=$('#name').text();
                var profile=$('#profile').text();
                var iconPath=$('#iconPath').text();
                var headerPath=$('#headerPath').text();
                var del='0';
                var target='communitySettingResult'
                $('.bun').remove();
                $('#name').html('コミュニティ名：<input type="text" name="commName" value="'+name+'">');
                $('#profile').html('紹介文：<input type="text" name="commProfile" value="'+profile+'">');
                $('#iconPath').html('アイコン画像：<input id="iconPhoto" ondrop="onDrop2(event)" ondragover="onDragOver(event)" type="text" name="iconPath" value="'+iconPath+'">');
                $('#headerPath').html('ヘッダ画像<input id="headPhoto" ondrop="onDrop1(event)" ondragover="onDragOver(event)" type="text" name="headerPath" value="'+headerPath+'">');
                console.log(id);
                console.log(del);
                $('#userId').html('<input type="hidden" name="userId" value="'+userid+'">');
                $('#commid').html('<input type="hidden" name="commId" value="'+id+'">');
                $('#commid').append('<input type="hidden" name="deleteFlag" value="'+del+'">');
                $('#commid').append('<input type="hidden" name="target" value="'+target+'">');
                $('#sub').html('<input type="submit" value="変更">');
            });
        });

        function onDrop1(event){
            var files = event.dataTransfer.files;

            for(var i = 0;i < files.length;i++){
                var f = files[i];
                var formData = new FormData();
                formData.append("file",f);
                ajaxSettings.data = formData;
                ajaxSettings.success = function(data){
                    var text = "";
                    $("#headPhoto").val(text+data.result);
                }
                ajax = $.ajax(ajaxSettings);
            }
            event.preventDefault();
        }

        function onDrop2(event){
            var files = event.dataTransfer.files;

            for(var i = 0;i < files.length;i++){
                var f = files[i];
                var formData = new FormData();
                formData.append("file",f);
                ajaxSettings.data = formData;
                ajaxSettings.success = function(data){
                    var text = "";
                    $("#iconPhoto").val(text+data.result);
                }
                ajax = $.ajax(ajaxSettings);
            }

            event.preventDefault();
        }

        function onDragOver(event){
            event.preventDefault();
        }
    </script>
</body>
</html>
