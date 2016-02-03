<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <title>TeraNavi TOP</title>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul class="lead nav nav-justified nav-tabs">
              <li class="active">
                <a href="#top" data-toggle="tab" class="text-warning" >TOP</a>
              </li>
              <li>
                <a href="#blog" data-toggle="tab" class="text-warning" >ブログ</a>
              </li>
              <li>
                <a href="#community" data-toggle="tab" class="text-warning" >コミュニティ</a>
              </li>
              <li>
                <a href="#tag" data-toggle="tab" class="text-warning" >タグ</a>
              </li>
              <li>
                <a href="#mypage" data-toggle="tab" class="text-warning" >マイページ</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <h1 class="text-warning">新着記事</h1>
        <div class="row well">
          <div class="col-md-2">
            <br>
            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
            <a href=""><h3 class="text-center text-muted">ユーザ名</h3></a>
          </div>
          <div class="col-md-8">
            <a href=""><h2 class="text-muted">記事タイトル</h2></a>
            <p>記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文
              記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文
              記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事</p>
            <div class="text-right">
              <a class="btn btn-warning">続きを読む</a>
            </div>
          </div>
          <div class="col-md-2">
            <br>
            <br>
            <p>投稿日時 2016年2月1日</p>
          <br>
            <p>コメント数 2</p>
          </div>
        </div>
        <div class="row well">
          <div class="col-md-2">
            <br>
            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
            <a href=""><h3 class="text-center text-muted">ユーザ名</h3></a>
          </div>
          <div class="col-md-8">
            <a href=""><h2 class="text-muted">記事タイトル</h2></a>
            <p>記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文
              記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文
              記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事</p>
            <div class="text-right">
              <a class="btn btn-warning">続きを読む</a>
            </div>
          </div>
          <div class="col-md-2">
            <br>
            <br>
            <p>投稿日時 2016年2月1日</p>
            <br>
            <p>コメント数 2</p>
          </div>
        </div>
        <div class="row well">
          <div class="col-md-2">
            <br>
            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" class="img-responsive">
            <a href=""><h3 class="text-center text-muted">ユーザ名</h3></a>
          </div>
          <div class="col-md-8">
            <a href=""><h2 class="text-muted">記事タイトル</h2></a>
            <p>記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文
              記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文 記事の本文記事の本文記事の本文記事の本文記事の本文
              記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事の本文記事</p>
            <div class="text-right">
              <a class="btn btn-warning">続きを読む</a>
            </div>
          </div>
          <div class="col-md-2">
            <br>
            <br>
            <p>投稿日時 2016年2月1日</p>
            <br>
            <p>コメント数 2</p>
          </div>
        </div>

    </div>
    </div>
    <br><br>
    <a href="login">ログイン画面</a><br><br>
    <a href="mypage">マイページ</a><br><br>
    <a href="#" onclick="document.comForm.submit();">コミュニティ一覧</a>
    <form action="/TeraNavi/front/commList" method="post" name="comForm">
        <input type="hidden" name="intention" value="list">
    </form>

    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

</body>
</html>
