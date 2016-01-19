<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>

    <meta charset="UTF-8">

    <title>マイページ</title>
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
           <h1>マイページ</h1><br><br>

		   ${sessionScope.loginUser.headerPath}<h1>${sessionScope.loginUser.userName} さんのマイページです</h1>

		   ${sessionScope.loginUser.iconPath}

		   <h2>自己紹介文</h2>
		   <textarea>${sessionScope.loginUser.profile}</textarea>

		   <a href="userSetting">プロフィールを編集</a>

           <div class="col-sm-3 col-xs-6">
               <a href="articlepost">記事を投稿</a><br><br>
               <a href="後でいれｔ">下書き</a><br><br>
               <a href="blogSetting">ブログ設定</a><br><br>
               <a href="後でいれｔ">コミュニティの管理</a><br><br>
               <a href="後でいれｔ">コメント管理</a><br><br>
               <a href="後でいれｔ">DM</a><br><br>
               <a href="後でいれｔ">大会</a><br><br>
           </div>
           <div class="col-sm-3 col-xs-6">
               <a href="openBlog">ブログ開設</a><br><br>
               <a href="blogSetting">ブログ設定</a><br><br>
               <a href="createcomm">コミュニティの作成</a><br><br>
           </div>



       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
