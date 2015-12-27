<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>新規登録</title>
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
           <h1>新規登録テストページ</h1>
           <form action="/signup" method="post">
               ログインID <input type="text" name="loginId"><br>
               パスワード <input type="text" name="password"><br>
               ユーザ名 <input type="text" name="userName"><br>
               ふりがな <input type="text" name="nameKana"><br>
               性別 <input type="text" name="sex"><br>
               性別の表示非表示 ・表示<input type="radio" name="sexVisibeFrag" value="0" checked="true"> ・非表示<input type="radio" name="sexVisibleFlag" value="1"><br>
               生年月日 <input type="date" name="birthDate"><br>
               MAilAddress <input type="text" name="mailAddress"><br>
               秘密の質問 <select name="quepstionId">
                   <option value="1">質問1</option>
                   <option value="2">質問2</option>
               </select><br>
               秘密の質問の答え <input type="text" name="quepstionAnswer"><br>
               <input type="submit" value="登録">

           </form>
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
