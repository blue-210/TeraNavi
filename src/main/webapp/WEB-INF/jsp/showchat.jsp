<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>チャット</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
		<link href="/TeraNavi/css/chat.css" rel="stylesheet" type="text/css">
		<link href="/TeraNavi/css/comm.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		<script src="/TeraNavi/js/chat.js"></script>
		<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>

	</head>
	<body>
		<%-- ヘッダー部分のHTMLを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/header.jsp"/>


		<%
			String token = ttc.util.CsrfUtil.getToken();
			session.setAttribute("token",token);
		%>
		<input type="hidden" id="tokenInput" value="<%=token %>">

		<div class="hidden-xs">
			<img src="${result.community.headerPath}" id="headimg">
		</div>

		<div class="visible-xs">
			<img src="${result.community.headerPath}" id="mobileHead">
		</div>

		<div class="cotainer-fluid">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-12 hidden-xs">
					<p>
						<a href="/TeraNavi/front/showcomm?commId=${result.community.id}">
							<span id="name" class="col-md-12 text-center text-muted" style="position:relative;margin-top:-200px;background-color:rgba(255,255,255,0.7);font-size: 60px;">${result.community.name}
						</a>
						<br><span class="col-md-12 text-center" style="font-size: 40px;">${result.topic.name}</span></span>
					</p>
				</div>
				<div class="visible-xs col-xs-11">
					<p>
						<a href="/TeraNavi/front/showcomm?commId=${result.community.id}"> <span id="mobileCommName" class="col-xs-12 text-center text-muted">${result.community.name}</span>
							<br><span class="col-md-12 text-center">${result.topic.name}</span></span>
						</a>
					</p>
				</div>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-12 hidden-xs">
					<img id="icon" src="${result.community.iconPath}" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px;" class="img-thumbnail"></img>
				</div>
				<div class="col-xs-12 visible-xs">
					<img id="mobileCommIcon" class="img-thumbnail" src="${result.community.iconPath}"></img>
				</div>
			</div>
		</div>
		<%-- <h2 id="comunity_title">チャットルーム</p> --%>
	</div>
	<input type="hidden" name="topicId" value="${result.chat[0].fkTopicId}">
	<div id="chat_room">
		<div class="container-fluid">
			<div class="wrapper">
				<!-- 自分 -->
				<c:forEach var="ch" items="${result.chat}">
					<c:choose>
						<c:when test="${empty ch.body}">
						</c:when>
						<c:when test="${sessionScope.loginUser.id eq ch.userId}">
							<div class="row" style="position: relative; margin-bottom:15px;">
								<div class="col-md-6 col-md-offset-2 content col-xs-7">
									<p>
										${ch.body}<br>
									</p>
									<p class="Mydate" style="text-align: right;"><c:out value="${ch.date}"/></p>
								</div>
								<div class="col-md-1 col-xs-5">

									<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${ch.userId}">
										<img class="accountImg img-thumbnail"style="width:55px; height:55px;" src="${sessionScope.loginUser.iconPath}">
										<p class="Myusername"><c:out value="${ch.userName}"/></p>
									</a>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row" style="margin-bottom:15px;">
								<div class="col-md-1 col-md-offset-2 col-xs-5">
									<a class="text-muted" href="/TeraNavi/front/mypage?paramUserId=${ch.userId}">
										<img class="accountImg img-thumbnail" style="width:55px; height:55px;" src="${ch.iconPath}">
										<p class="username"><c:out value="${ch.userName}"/></p>
									</a>
								</div>
								<div class="col-md-6 col-xs-7 other_content">
									<p>
										${ch.body}"<br>
									</p>
									<p style="text-align: right;"><c:out value="${ch.date}"/></p>
								</div>

							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
	<c:if test="${not empty result.writeFlag}">

		<div id="forms">
			<div class="col-md-6 col-md-offset-2 col-xs-12">
				<textarea id="chatBodyArea" name="chatBody" style="width:100%;" ondragover="fileDragOver(event)" ondrop="fileDrop(event)"></textarea>
			</div>

			<input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
			<input type="hidden" name="communityId" value="${result.community.id}">
			<div class="hidden-xs" id="submit_button">
				<button id="chatwrite" class="btn btn-default" type="button" name="button" style="margin-right:140%;">送信</button>
			</div>
			<div class="visible-xs col-xs-12">
				<br>
				<button id="mobileChatWrite" class="btn btn-default btn-block">送信</button>
			</div>
		</div>

	</c:if>

	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>



	<script>
//		別ファイル化すると動きません、要注意
		var ajaxSettingsFile;
		var ajaxFile;

		ajaxSettingsFile = {
			type: 'post',
			url: '/TeraNavi/upload/article',
			processData: false,
			contentType: false,
			cache: false,
			dataType: 'json',
			success: function (data) {

				var text = $("#chatBodyArea").val();
				if(text.length>0){
					text+="<br>";
				}

				$("#chatBodyArea").val(text + "<img src='" + data.result+"' width='100%'>");
			}
		};



		function fileDrop(event) {
			var files2 = event.dataTransfer.files;
			console.log(files2);

			for (var i = 0; i < files2.length; i++) {

				var f = files2[i];
				var formData = new FormData();
				formData.append("file", f);
				ajaxSettingsFile.data = formData;
				ajaxFile = $.ajax(ajaxSettingsFile);
			}

			event.preventDefault();
		}

		function fileDragOver(event) {
			event.preventDefault();
		}



	</script>

</body>
</html>
