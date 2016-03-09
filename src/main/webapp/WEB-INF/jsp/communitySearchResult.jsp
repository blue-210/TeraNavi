<%@ page
	contentType="text/html ; charset=UTF-8"
	pageEncoding="UTF-8"
	import="ttc.bean.ArticleBean"
	%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>コミュニティ一覧</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" href="/TeraNavi/css/search.css" type="text/css">
			<link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<div class="section">
				<div class="container">
					<div class="row col-md-10 col-md-offset-1 hidden-xs">
						<h1 class="text-warning">コミュニティ一覧</h1>
					</div>

					<div class="row col-xs-10 visible-xs col-xs-offset-1 text-center mobile-community-title">
						<h3 class="text-warning">コミュニティ一覧</h3>
					</div>

					<c:forEach var="comm" items="${result}">
						<div class="row col-md-10 col-xs-10 col-xs-offset-1 col-md-offset-1 well">
							<div class="col-md-2 hidden-xs">
								<img src="${comm.iconPath}" id="topicIcon">
							</div>

							<div class="visible-xs col-xs-2">
								<img src="${comm.iconPath}" id="topicIcon" class="mobile-community-icon">
							</div>
							<!--
								<div class="col-md-2">
								<form action="showcomm" method="post" name="showForm">
									<input type="hidden" name="commId" value="${comm.id}"></input>
									<input type="submit" id="showCom" value="詳細へ"></input>
								</form>
							-->
							<div class="col-md-7 hidden-xs">
								<a href="/TeraNavi/front/showcomm?commId=${comm.id}">
									<h2 class="text-muted">${comm.name}</h2>
								</a>
								<p id="articleBody">${comm.profile}...</p>


							</div>

							<div class="col-xs-10 visible-xs">
								<a href="/TeraNavi/front/showcomm?commId=${comm.id}">
									<h3 class="text-muted mobile-community-name">${comm.name}</h2>
								</a>

							</div>
							<div class="col-xs-12 visible-xs mobile-community-profile">
								<p>${comm.profile}...</p>
							</div>

							<div class="text-right">
								<div class="hidden-xs">
									<a class="btn btn-warning" href="/TeraNavi/front/partiComm?commId=${comm.id}">
										参加する
									</a>

								</div>

								<div class="col-xs-12 visible-xs">
									<a class="btn btn-warning btn-block" href="/TeraNavi/front/partiComm?commId=${comm.id}">
										参加する
									</a>

								</div>
							</div>

							<div class="col-md-3 hidden-xs">
								<h4 id="title" class="text-left">
									メンバー数：<c:out value="${comm.countMember}" /></a>
								</h4>
							</div>
						</div>

					</c:forEach>
					<div class="row">
						<div class="col-md-10 col-md-offset-1 col-xs-12">
							<h3 class="text-center">検索結果は以上です</h3>
						</div>
						<div class="col-md-1 col-xs-0">

						</div>
					</div>

				</div>
			</div><!--end row-->
		</div><!--end container-->
		<jsp:include page="/WEB-INF/jsp/footer.jsp"/>


	</body>
</html>
