<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>DM</title>
			<!-- Latest compiled and minified CSS -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

			<!-- Optional theme -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
			<link href="/TeraNavi/css/dm.css" rel="stylesheet" type="text/css">
			
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<!-- Latest compiled and minified JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="container">
		 <div id="dm_room">
			<div class="container-fluid">
				<div class="wrapper">
					<!-- 自分 -->
					<c:forEach var="dm" items="${result.dm}">
						<c:choose>
							<c:when test="${empty dm.messageBody}">
							</c:when>
							<c:when test="${sessionScope.loginUser.id eq dm.fromUserId}">
								<div class="row" style="position: relative; margin-bottom:15px;">
									<div class="col-md-6 col-md-offset-2 content col-xs-7">
										<p>
												<c:out value="${dm.messageBody}"/><br>
											</p>
										<p class="Mydate" style="text-align: right;"><c:out value="${dm.date}"/></p>
									</div>
									<div class="col-md-2 col-xs-5">

										<a class="text-muted pull-right" href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">
											<img class="accountImg img-thumbnail"style="width:70px; height:70px;" src="${sessionScope.loginUser.iconPath}">
											<p class="Myusername"><c:out value="${sessionScope.loginUser.userName}"/></p>
										</a>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="row" style="margin-bottom:15px;">
									<div class="col-md-2 col-md-offset-2 col-xs-5">
										<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${dm.fromUserId}">
											<img class="accountImg img-thumbnail" style="width:70px; height:70px;" src="${dm.fromIconPath}">
											<p class="username"><c:out value="${dm.fromUserName}"/></p>
										</a>
									</div>
									<div class="col-md-6 col-xs-7 other_content">
										<p>
												<c:out value="${dm.messageBody}"/><br>
										</p>
										<p style="text-align: right;"><c:out value="${dm.date}"/></p>
									</div>

								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div id="forms">
			<div class="col-md-6 col-md-offset-2 col-xs-12">
				<textarea id="dmBody" name="messageBody" style="width:100%;"></textarea>
			</div>
			<input type="hidden" name="userId" id="myId" value="${sessionScope.loginUser.id}">
			<input type="hidden" name="receiveUserId" value="${result.partnerId}">
			<div class="hidden-xs" id="submit_button" >
				<button id="dmsend" type="button" name="button" style="margin-right:140%;width:25%;">送信</button>
			</div>
			<div class="visible-xs col-xs-12">
				<br>
				<button id="mobileDmWrite" class="btn btn-default btn-block">送信</button>
			</div>
		</div>

    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
	<script src="/TeraNavi/js/dm.js"></script>
</body>
</html>
