<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ブログ作成結果</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>

</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>
    <%-- トップのナビゲーションを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

    <div class="section">
    <div class="container">
       <div class="row">
           <!-- 2列をサイドメニューに割り当て -->
           <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked well">
              <li>
                <a href="/TeraNavi/front/mypage">マイページ</a>
              </li>
              <li>
                <a href="/TeraNavi/articlepost">記事を書く</a>
              </li>
              <li>
                <a href="/TeraNavi/front/showArticleList?userId=${sessionScope.loginUser.id}&flg=2">下書き一覧</a>
              </li>
              <c:choose>
                  <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                      <li class="active">
                          <a href="#blogsetting">ブログ設定</a>
                      </li>
                  </c:when>
                  <c:otherwise>
                      <li class="active">
                          <a href="#blogsetting">ブログ開設</a>
                      </li>
                  </c:otherwise>
              </c:choose>
              <li>
                <a href="#communitymanage">コミュニティ管理</a>
              </li>
              <li>
                <a href="#directmessage">DM</a>
              </li>
              <br><br><br><br>
              <li>
                <a href="/TeraNavi/wirhdraw">退会</a>
              </li>
            </ul>
            </div>
               <h1>${sessionScope.loginUser.userName}さんのブログが作成されました</h1>

               <h1>${result.title}</h1>

    		   <img src="${result.headerPath}" alt="" />

    		   <p>
    		   	説明文 : ${result.explanation}
    		   </p>

               <h1>はじめての記事を投稿しちゃおう。</h1>

    		   <a href="../articlepost">記事投稿しますね</a>
    		   <a href="logout" style="font-size:18px;">ログアウトしますよ</a>

            </div>

        </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
</body>
</html>
