
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<title>記事一覧表示</title>
		<!-- Latest compiled and minified CSS -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="/TeraNavi/js/bootstrap.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/TeraNavi/css/navbar.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/TeraNavi/css/mypage.css" type="text/css">
	</head>
	<body>

		<!--ログインしてる人にだけ見せる-->
		<%
			if(session.getAttribute("loginUser")==null){
				response.sendRedirect("/TeraNavi/login");
			}
		%>

		<%-- ヘッダー部分のHTMLを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/header.jsp"/>

		<jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

		<div class="main-content">
			<div class="container visible-xs">
				<div class="dropdown">
					<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">DM<span class="caret"></span></button>
					<ul class="dropdown-menu">
						<li id="mypageTab">
							<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a>
						</li>
						<li>
							<a href="/TeraNavi/articlepost">記事を書く</a>
						</li>
						<li>
							<a href="/TeraNavi/front/showArticleList?writeUserId=${sessionScope.loginUser.id}">投稿記事一覧</a>
						</li>
						<li>
							<a href="/TeraNavi/front/showDraftArticleList">下書き一覧</a>
						</li>
						<c:choose>
							<c:when test="${sessionScope.loginUser.blogStatus eq 1}">
								<li>
									<a href="/TeraNavi/front/showBlog?edit=true&bloguserId=${sessionScope.loginUser.id}">ブログ設定</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="/TeraNavi/blogSetting">ブログ開設</a>
								</li>
							</c:otherwise>
						</c:choose>
						<li>
							<a href="/TeraNavi/front/commmy">コミュニティ管理</a>
						</li>
						<br><br>
						<li>
							<a href="/TeraNavi/withdraw">退会</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="container hidden-xs">
				<!-- 2列をサイドメニューに割り当て -->
				<div class="col-md-2 hidden-xs">
					<jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
				</div>
				<c:choose>
					<c:when test="${empty result}">
						<div cllass="row">
							<div class="col-md-4 col-md-offset-4"><p class="text-center">まだDMが一件もありません</p></div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="row col-md-8 col-xs-12">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>ユーザ名</th>
										<th>最新内容</th>
										<th>最新投稿日時</th>
										<!-- <th class="deletable"></th> -->
									</tr>
								</thead>
								<tbody>


									<c:forEach var="dm" items="${result}">

										<tr onclick="location.href = '/TeraNavi/front/dmreceive?sendUserId=${dm.fromUserId}'">
											<td>${dm.fromUserName}</td>
											<td>${dm.messageBody}</td>
											<td>${dm.date}</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div><!--end row-->

					</c:otherwise>

				</c:choose>
			</div><!--end container-->


			<div class="visible-xs">
				<div class="container" style="width:90%;">
				<div class="row">
					<table class="table table-hover col-xs-10">
						<thead>
							<tr>
								<th class="col-xs-3">ユーザ名</th>
								<th class="col-xs-3">最新内容</th>
								<th class="col-xs-3">投稿日時</th>
								<!-- <th class="deletable"></th> -->
							</tr>
						</thead>
						<tbody>

							<c:forEach var="dm" items="${result}">

								<tr onclick="location.href = '/TeraNavi/front/dmreceive?sendUserId=${dm.fromUserId}'">
									<td class="col-xs-3">${dm.fromUserName}</td>
									<td class="col-xs-3">${dm.messageBody}</td>
									<td class="col-xs-3">${dm.date}</td>
								</tr>

							</c:forEach>

						</tbody>
					</table>
				</div><!--end row-->
			</div><!--end container-->
			</div>

		</div>

		<jsp:include page="/WEB-INF/jsp/footer.jsp"/>




	</body>
</html>
