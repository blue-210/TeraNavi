	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<meta charset="UTF-8">
			<title>コミュニティ詳細</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
			<script type="text/javascript" src="/TeraNavi/js/community.js"></script>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>
			<form action="commSetting" method="post" id="setting" >
				<div class="hidden-xs">
					<img src="${result.headerPath}" id="headimg">
					<label for="headerFile" id="headerPath">
						<input type="file" id="headerFile" style="display:none">
					</label>
				</div>

				<div class="visible-xs">
					<img src="${result.headerPath}" id="mobileHead">
				</div>

				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-13 hidden-xs">
							<p>
								<span id="name" class="col-md-12 text-center" style="position:relative;margin-top:-200px;background-color:rgba(255,255,255,0.7);font-size: 60px;">${result.name}</span>
							</p>
						</div>
						<div class="visible-xs col-xs-11">
							<p> <span id="mobileCommName" class="col-xs-12 text-center">${result.name}</span>
							</p>
						</div>
						<div class="col-md-4"></div>
					</div>
					<div class="row">
						<div class="col-md-12 hidden-xs">
							<img id="icon" src="${result.iconPath}" class="img-thumbnail" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px;"></img>
                            <label for="iconFile" id="iconPath">
								<input type="file" id="iconFile" style="display:none">
                            </label>
						</div>
						<div class="col-xs-12 visible-xs">
							<img id="mobileCommIcon" src="${result.iconPath}" class="img-thumbnail"></img>
						</div>
					</div>

					<%-- ログインの判定 --%>
					<c:if test="${not empty sessionScope.loginUser.id}">
						<c:choose>
							<c:when test="${sessionScope.loginUser.id eq result.createUserId}">
								<button type="button" id="edit" class="btn btn-warning btn-lg">編集</button>
							</c:when>
							<c:otherwise>

								<c:set var="flag" value="false"/>
								<%-- sessionにある参加しているコミュニティのリストを使って比較 --%>
								<c:forEach var="co" items="${sessionScope.myCommunities}">
									<c:choose>
										<%-- co.idは自分が参加しているコミュ、community.idは比較対象となるコミュ --%>
										<c:when test="${co.id eq result.id}">
											<%-- 参加していればtrueに --%>
											<c:set var="flag" value="true"/>
										</c:when>
									</c:choose>
								</c:forEach>
								<%-- 参加していない場合ボタンを表示 --%>
								<c:choose>
									<c:when test="${flag eq 'false'}">
										<button type="button" class="btn btn-warning communityBtn" id="joinButton" value="${result.id}">参加する</button>
									</c:when>
									<%-- 参加している場合 --%>
									<c:otherwise>
										<button type="button" class="btn btn-warning communityBtn" id="joinButton" disabled>参加中</button>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:if>

					<div class="section">
						<div class="container">
							<div class="row hidden-xs">
								<div class="col-md-10">
									<h1 class="text-primary">コミュニティ紹介文</h1>
									<p id="commid" style="display:none">${result.id}</p>
									<p id="userId" style="display:none">${sessionScope.loginUser.id}</p>
									<p id="createId" style="display:none">${result.createUserId}</p>
									<p class="bun"><span id="profile"><pre>${result.profile}</pre></span></p>
									<p id="sub"></p>
								</div>
							</div>
							<div class="row visible-xs" id="mobileCommProfile">
								<div class="col-xs-10">
									<h2 class="text-primary">コミュニティ紹介文</h2>
									<p class="mobileText"><span id="profile"><pre>${result.profile}</pre></span></p>
									<p id="sub"></p>
								</div>
							</div>
						</div>
					</div>
			</form>

			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-xs-6 col-md-offset-1">
							<h1 class="text-center text-primary">メンバー</h1>
						</div>
						<div class="col-md-1"></div>
					</div>

					<div class="row hidden-xs">
						<c:forEach var="member" items="${result.members}">
							<div class="col-md-3">
								<a href="/TeraNavi/front/mypage?paramUserId=${member.id}">
									<img src="${member.iconPath}" class="center-block img-circle" style="width:200px;height:200px;">
								</a>
								<a href="/TeraNavi/front/mypage?paramUserId=${member.id}">
									<h3 class="text-center"><c:out value="${member.userName}" /></h3>
								</a>
							</div>
						</c:forEach>
					</div>

					<div class="row visible-xs">
						<table class="table table-striped">
							<tbody>
								<c:forEach var="member" items="${result.members}">
								<div class="col-md-3">
									<tr>
										<td>
											<a href="/TeraNavi/front/mypage?paramUserId=${member.id}">
												<img src="${member.iconPath}" class="center-block img-circle" id="mobileMemberIcon">
											</a>
										</td>
										<td>
											<a href="/TeraNavi/front/mypage?paramUserId=${member.id}">
												<h3 class="text-center"><c:out value="${member.userName}" /> </h3>
											</a>
										</td>
									</tr>
								</div>
							</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="col-md-10 col-md-offset-1 col-xs-12">
						<div class="col-md-10 col-xs-0"></div>
						<div class="col-md-2 hidden-xs">
						</div>
						<div class="col-xs-12 visible-xs">
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-10 col-md-offset-1 hidden-xs">
					<div class="col-md-10"></div>
					<div class="col-md-2">
						<button type="button" class="btn btn-warning" onclick="document.memberForm.submit();">メンバーの一覧をみる</button>
					</div>
				</div>

				<div class="col-xs-12 col-md-offset-1 visible-xs">

					<div class="col-xs-12">
						<button type="button" class="btn btn-warning btn-block" onclick="document.memberForm.submit();">メンバーの一覧をみる</button>
					</div>
				</div>
			</div>


			<div class="section">

					<div class="col-md-10 hidden-xs col-md-offset-1">
						<h1 class="text-center text-primary" style="margin-bottom:10px;">トピック</h1>
					</div>

					<div class="col-xs-10 visible-xs">
						<h1 class="text-primary" style="margin-bottom:10px;">トピック</h1>
					</div>


					<div class="col-md-1"></div>

					<div class="row">
						<form name="memberForm" action="/TeraNavi/front/showMemberList" method="post">
							<input type="hidden" name="commId" value="${result.id}">
						</form>

						<div class="col-md-10 col-md-offset-1 hidden-xs">
							<c:forEach var="item" items="${result.topics}" varStatus="i">
								<c:if test="${i.count <= 5}">
									<div class="row col-md-10 col-md-offset-1 well">
										<div class="col-md-2">
											<img class="img-thumbnail" src="${item.userIconPath}" id="topicIcon">
											<p>
												<c:out value="${item.createUserName}" />
											</p>
										</div>

										<div class="col-md-7">
											<a href="showchat?topicId=${item.topicId}&communityId=${result.id}">
												<h2 class="text-muted">${item.name}</h2>
											</a>
										</div>

										<div class="col-md-3">
											<p id="date">
												<c:out value="${item.updateDate}" />
											</p>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>

						<div class="col-xs-12 visible-xs">
							<table class="table table-striped">
								<tbody>
									<c:forEach var="item" items="${result.topics}" varStatus="i">
										<c:if test="${i.count <= 5}">
											<tr>
												<td>
													<img class="img-thumbnail" src="${item.userIconPath}" id="mobileTopicIcon">
													<p id="mobileCreateUser">
														<c:out value="${item.createUserName}" />
													</p>
												</td>
												<td>
													<a href="showchat?topicId=${item.topicId}&communityId=${result.id}">
														<h3 id="mobileTopicName" class="text-muted">${item.name}</h3>
													</a>
													<br>
													<p id="mobileCreateDate">
														<c:out value="${item.updateDate}" />
													</p>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
					<div class="row">
						<div class="col-md-10 col-md-offset-1 hidden-xs">
							<div class="col-md-10"></div>
							<div class="col-md-2">
								<a class="btn btn-warning" href="/TeraNavi/front/showTopic?communityId=${result.id}">トピック一覧</a>
							</div>
						</div>

						<div class="col-xs-12 col-md-offset-1 visible-xs">
							<div class="col-xs-12">
								<a class="btn btn-warning btn-block" href="/TeraNavi/front/showTopic?communityId=${result.id}">トピック一覧</a>
							</div>
						</div>
					</div>

			</div>
		</div><!--end container-->
		<!--モーダルウインドウの中身-->
		<div class="fade modal text-justify" id="communitySetting-modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">コミュニティ編集確認</h4>
					</div>

					<div class="modal-body">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<h2>コミュニティ名</h2>
								<h5 id="modalName"></h5>
								<h2>説明文</h2>
								<h5 id="modalProfile"></h5>
								<h2>ヘッダー画像</h2>
								<img src="" class="img-rounded" width="450" height="150" id="commHeader">
									<h2>アイコン画像</h2>
									<img src="" class="img-thumbnail" width="110" height="150" id="commIcon">
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-warning" form="setting">設定する</button>
								<button type="button" class="btn btn-warning" data-dismiss="modal">キャンセル</button>
							</div>
						</div>
					</div>
				</div>

		<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

		<!-- 確認モーダル -->
		<div class="fade modal text-justify" id="partiCommModal">
			<div class="modal-dialog">
			  <div class="modal-content">
				<div class="modal-header">
				  <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				  </button>
				　<h4 class="modal-title text-center">確認</h4>
				 </div>
				<div class="modal-body">
					<p id="joinResultMessage" class="text-center">参加中...</p>
				</div>
				<div class="modal-footer"></div>
			  </div>
			</div>
		 </div>
	</body>
</html>
