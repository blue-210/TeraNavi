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
       <form action="commSetting" method="post" id="setting" >
           <header>
              <span id="headerPath"> <p class="bun"><img src='${result.headerPath}' id="headimg"></p></span>
              <span id="iconPath"> <p class="bun"><img class="pull-left" src='${result.iconPath}'width="200px" height="200px" id="icon"></p></span>
              <p class="bun"><span id="name" class="col-md-8 text-center">${result.name}</span>
               <p class="bun"> <button class="col-md-2 text-center" id="dd" style="display:none">編集</button></p>
               <div id="changeName"></div>
               <div id="changeProfile"></div>
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

                           <p class="bun"><span id="profile">${result.profile}</span></p>
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
           <!--モーダルウインドウの中身-->
           <div class="fade modal text-justify" id="communitySetting-modal">
               <div class="modal-dialog">
                 <div class="modal-content">
                   <div class="modal-header">
                     <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
                       <span aria-hidden="true">×</span>
                     </button>
                     <h4 class="modal-title">コミュニティ編集確認</h4>
                    </div>

                   <div class="modal-body">
                       <div class="col-xs-1"></div>
                       <div class="col-xs-10">
                           <h2>コミュニティ名</h2><h5 id="modalName"></h5>
                           <h2>説明文</h2><h5 id="modalProfile"></h5>
                           <h2>ヘッダー画像</h2><img src="http://pingendo.github.io/pingendo-bootstrap/assets/user_placeholder.png"
                           class="img-rounded" width="200" height="150" id="commHeader">
                             <h2>アイコン画像</h2><img src="http://pingendo.github.io/pingendo-bootstrap/assets/user_placeholder.png"
                             class="center-block img-circle img-responsive" width="150" height="150" id="commIcon">
                           <p></p>
                       </div>
                   </div>

                   <div class="modal-footer">
                       <button type="submit" class="btn btn-block btn-primary" form="setting">設定する</button>
                       <button type="button" class="btn btn-block btn-primary" data-dismiss="modal">キャンセル</button>
                   </div>
                 </div>
               </div>
            </div>
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    <script>
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
                var id=$('#commid');
                var userid=$('#userId');
                var name=$('#name');
                var profile=$('#profile').text();
                var iconPath="${result.iconPath}";
                var headerPath="${result.headerPath}";
                var del='0';
                var target='communitySettingResult';
                $('.bun').remove();
                $("#changeName").html('コミュニティ名：<input type="text" class="form-control" name="commName" value="'+name.text()+'" id="commName"><br>');
                $("#changeProfile").html('紹介文：<textarea class="form-control" id="profile" rows="4" name="commProfile">'+profile+'</textarea>');
                $("#headerPath").html('ヘッダ画像 <div class="col-md-12 text-left"><img id="preHeader" src="'+headerPath+'" width="50px" height="50px"</div><input type="file" value="ファイル選択" id="headerFile" onchange="fileUpHeader();"><br>');
                $("#headerPath").append('<input id="commHeaderPath" type="hidden" name="headerPath"><br>');
                $("#iconPath").html('アイコン画像：<div class="col-md-12 text-left"><img id="preIcon" src="'+iconPath+'" width="50px" height="50px"><br>');
                $("#iconPath").append('<input type="file" value="ファイル選択" id="iconFile" onchange="fileUpIcon();"><input id="icon" type="hidden" name="iconPath"><br>');

                console.log(id);
                console.log(del);
                $('#userId').html('<input type="hidden" name="userId" value="'+userid.text()+'">');
                $('#commid').html('<input type="hidden" name="commId" value="'+id.text()+'">');
                $('#commid').append('<input type="hidden" name="deleteFlag" value="'+del+'">');
                $('#commid').append('<input type="hidden" name="target" value="'+target+'">');
                $('#commid').append('<input type="hidden" name="nowIconPath" value="'+iconPath+'">');
                $('#commid').append('<input type="hidden" name="nowHeaderPath" value="'+headerPath+'">');
                $('#sub').html('<button class="btn btn-info" type="button" id="commSubmit" data-toggle="modal">確認</button>');
            });
        });


        //画像のアップロード関係
        function fileUpIcon(){
			var files = document.getElementById("iconFile").files;

			for(var i = 0;i < files.length;i++){
				console.log("for");
				var f = files[i];
				var formData = new FormData();
				formData.append("file",f);
				ajaxSettings.data = formData;
				ajaxSettings.url = "/TeraNavi/upload";
				ajaxSettings.success = function(data){
					$("#icon").val(data.result);
					$("#preIcon").attr("src",data.result);
				}

 				ajax = $.ajax(ajaxSettings);
			}

		}

		function fileUpHeader(){
			var files = document.getElementById("headerFile").files;

			for(var i = 0;i < files.length;i++){
				console.log("for");
				var f = files[i];
				var formData = new FormData();
				formData.append("file",f);
				ajaxSettings.data = formData;
				ajaxSettings.url = "/TeraNavi/upload/header";
				ajaxSettings.success = function(data){
					$("#commHeaderPath").val(data.result);
					$("#preHeader").attr("src",data.result);
				}

 				ajax = $.ajax(ajaxSettings);
			}
		}

        $(document).on('click',"#commSubmit",function(){
            $("#modalName").empty();
            $("#modalProfile").empty();
            $("#commHeader").empty();
            $("#commIcon").empty();

            $("#modalName").append($("#commName").val());
            $("#modalProfile").append($("#profile").val());
            $("#commHeader").attr("src",$("#commHeaderPath").val());
            $("#commIcon").attr("src",$("#icon").val());

            $("#communitySetting-modal").modal("show");
        });

    </script>
</body>
</html>
