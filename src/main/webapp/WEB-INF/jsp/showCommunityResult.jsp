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
            $('.bun').remove();
            $('#name').html('コミュニティ名：<input type="text" name="commName" value="'+name+'">');
            $('#profile').html('紹介文：<input type="text" name="profile" value="'+profile+'">');
            $('#iconPath').html('アイコン画像：<input type="text" name="iconPath" value="'+iconPath+'">');
            $('#headerPath').html('ヘッダ画像<input type="text" name="headerPath" value="'+headerPath+'">');
            console.log(id);
            console.log(del);
            $('#userId').html('<input type="hidden" name="userId" value="'+userid+'">');
            $('#commid').html('<input type="hidden" name="communityId" value="'+id+'">');
            $('#commid').append('<input type="hidden" name="deleteFlag" value="'+del+'">');
            $('#sub').html('<input type="submit" value="変更">');
        });
    });
    </script>


</body>
</html>
