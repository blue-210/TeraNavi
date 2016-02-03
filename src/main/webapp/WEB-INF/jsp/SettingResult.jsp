<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>登録結果</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="container">
       <div class="row">
		   <img src="${sessionScope.loginUser.headerPath}" alt="" />

		  <img src="${sessionScope.loginUser.iconPath}" alt="" />


		   <h1>${sessionScope.loginUser.userName}さんの設定を変更したよ</h1>

           <h2>
               あなたの登録アドレスは「${sessionScope.loginUser.mailAddress}」です
           </h2>

		   <h2>自己紹介文</h2>
		   <textarea>${sessionScope.loginUser.profile}</textarea>



		   <a href="/TeraNavi/mypage"><h3>マイページはこちら</h3></a>

       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
