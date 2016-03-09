<%@ page
	contentType="text/html ; charset=UTF-8"
	pageEncoding="UTF-8"
	%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<title>検索結果</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="/TeraNavi/css/search.css" rel="stylesheet" type="text/css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<h2 class="page-title">ユーザの検索結果</h2>

			<br>
			<div class="section">
				<div class="container">
					<c:forEach var="item" items="${result}">
						<div class="row">
							<div class="col-md-10 col-md-offset-1 col-xs-11">
								<img src="${item.iconPath}" class="hidden-xs" style="width:140px;height:140px;">
								<img src="${item.iconPath}" class="visible-xs"style="width:140px;height:140px;">
								<div class="prof">
									<div class="hidden-xs">
										<a href="/TeraNavi/front/mypage?paramUserId=${item.id}" class="text-muted">
											<h2>${item.userName}</h2>
											<h3>${item.nameKana}</h3>
										</a>

									</div>

									<div class="visible-xs">
										<a href="/TeraNavi/front/mypage?paramUserId=${item.id}" class="text-muted">
											<h3 class="mobile-user-name">${item.userName}</h3>
										</a>
									</div>

									<p>${item.profile}</p>

									<%-- <div class="hidden-xs">
										<form action="dmsend" method="post">
											<div class="form-inline">
												<label class="control-label">DMの本文</label>
												<input class="form-control" type="text" name="messageBody">
												<input type="hidden" name="receiveUserId" value="${item.id}">
												<button type="submit" class="btn btn-default">DM送信</button>
											</div>
										</form>

									</div> --%>

								</div>
							</div>

							<%-- <div class="col-xs-12">
								<div class="visible-xs mobile-dm-form">
									<form action="dmsend" method="post">
										<div class="form-inline">
											<label class="control-label">DMの本文</label>
											<input class="form-control" type="text" name="messageBody">
											<input type="hidden" name="receiveUserId" value="${item.id}">
											<button type="submit" class="btn btn-default btn-block mobile-btn">DM送信</button>
										</div>
									</form>

								</div>
							</div> --%>

						</div><br><br>

					</c:forEach>

					<div class="row">
						<div class="col-md-10 col-md-offset-1 col-xs-12">
							<h3 class="text-center">検索結果は以上です</h3>
						</div>
						<div class="col-md-1 col-xs-0">
							
						</div>
					</div>

				</div>
			</div>

			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>



		</body>
	</html>
