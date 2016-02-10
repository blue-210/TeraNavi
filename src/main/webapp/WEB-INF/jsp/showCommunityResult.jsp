<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>コミュ詳細</title>
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

    <div class="container">
       <div class="row">
           <h1>コミュ詳細</h1>
            <form action="commSetting" method="post">
                <p id="commid" style="display:none">${result.id}</p>
                <p id="userId" style="display:none">${sessionScope.loginUser.id}</p>
                <p id="createId" style="display:none">${result.createUserId}</p>
                <p class="bun"> コミュニティ名:<div id="name">${result.name}</div></p>
                <p class="bun"> 説明文 <div id="profile">${result.profile}</div></p>
                <p class="bun">  コミュニティアイコン<div id="iconPath"><img src='${result.iconPath}'></div></p>
                <p class="bun">  ヘッダ画像 <div id="headerPath"> <img src='${result.headerPath}'></div></p>
                <p class="bun"><button id="dd" style="display:none">編集</button></p>

                <p id="sub"></p>
            </form>
            <h5>コミュニティのmember</h5>
            <table class="table table-striped">
               <thead>
                   <c:forEach var="member" items="${result.members}">
                       <tr>
                         <th>
                           <c:out value="${member.iconPath}" /><br>
                           <c:out value="${member.userName}"/><br>
                        </th>
                       </tr>
                   </c:forEach>
                </thead>
               </tbody>
           </table>
		   <p onclick="document.memberForm.submit();">
			   メンバーの一覧を取得
		   </p>
		   <form name="memberForm" action="/TeraNavi/front/showMemberList" method="post">
			   <input type="hidden" name="commId" value="${result.id}">
		   </form>
           <h5>トピックリスト</h5>
           <table class="table table-striped">

               <thead>
                   <tr>
                       <th>
                           <p>作成したトピック</p>
                       </th>
                   </tr>
              <tbody>

                  <form action="showchat" method="post">
                  <c:forEach var="topics" items="${result.topics}">
                      <tr>
                        <td><c:out value="${topics.name}" /><br></td>
                          <td><c:out value="${topics.updateDate}"/><br></td>
                          <td><c:out value="${topics.topicCreater}"/><br></td>

                              <td><input type="hidden" name="topicId" value="${topics.topicId}">
                                  <input type="submit" value="詳細"></td>
                      </tr>
                  </c:forEach>
              </form>
              </tbody>
          </table>
          <form action="showTopic" method="post" name="showForm">
				<input type="hidden" name="communityId" value="${result.id}">
                <input type="submit" value="more">
		</form>



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
            $('#iconPath').html('アイコン画像：<input type="text" name="iconPath" value="'+iconPath+'">');
            $('#headerPath').html('ヘッダ画像<input type="text" name="headerPath" value="'+headerPath+'">');
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
