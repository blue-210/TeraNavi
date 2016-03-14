	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<meta charset="UTF-8">
			<title>コミュニティメンバー</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
            <script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
            <link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>

			<link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">
				<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<c:set var="flag" value="0" scope="page" />
			<c:forEach var="member" items="${result.members}">
				<c:if test="${member.id eq sessionScope.loginUser.id}">
					<c:choose>
						<c:when test="${member.communityAdminFlag eq 1}">
							<c:set var="flag" value="1" scope="page" />

						</c:when>
					</c:choose>
				</c:if>

			</c:forEach>
			<div class="hidden-xs">
				<img src="${result.community.headerPath}" id="headimg">
				<label for="headerFile" id="headerPath">
					<input type="file" id="headerFile" style="display:none">
				</label>

			</div>
			<div class="visible-xs">
				<img src="${result.community.headerPath}" id="mobileHead">
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-5 hidden-xs">
						<p><a href="/TeraNavi/front/showcomm?commId=${result.community.id}">
							 <span id="name" class="col-md-12 text-center text-muted" style="position:relative;margin-top:-200px;margin-left:20px;background-color:rgba(255,255,255,0.7);font-size: 60px;">${result.community.name}</span>
						</a></p>
					</div>
					<div class="col-xs-11 visible-xs">
						<p><a href="/TeraNavi/front/showcomm?commId=${result.community.id}">
							 <span id="mobileCommName" class="col-xs-12 text-center text-muted">${result.community.name}</span>
						</a></p>
					</div>
					<div class="col-md-4"></div>
				</div>
				<div class="row hidden-xs">
					<div class="col-md-12">
						<img id="icon" src="${result.community.iconPath}" style="width:130px; height:130px; position:relative; bottom:110px; margin-left:50px;"></img>
					</div>
				</div>
				<div class="row visible-xs">
					<div class="col-md-12">
						<img id="mobileCommIcon" src="${result.community.iconPath}"></img>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<form id="grant" action="commGra" method="post">
							<div class="container">
								<div class="row text-center">
									<div class="col-xs-12">
										<h1>コミュニティメンバー</h1>

										<div class="row hidden-xs">
											<c:forEach var="member" items="${result.members}">
												<div class="col-md-3">
													<a href="/TeraNavi/front/mypage?paramUserId=${member.id}">
														<img src="${member.iconPath}" class="center-block img-circle" style="width:200px;height:200px;">
														<h4>${member.userName}</h4>
													</a>
													<input type="hidden" name="targetUser" value="${member.id}">
													<input type="hidden" name="communityId" value="${result.value}">
													<c:choose>
														<c:when test="${pageScope.flag eq 1}">
															<div class="check"></div>
														</c:when>
													</c:choose>
												</div>
											</c:forEach>
										</div>


										<div class="row visible-xs">
											<table class="table table-striped">
												<tbody>
													<c:forEach var="member" items="${result.members}">
														<tr>
															<td>
																<a href="/TeraNavi/front/mypage?paramUserId=${member.id}">
																	<img id="mobileMemberIcon" src="${member.iconPath}" class="center-block img-circle" style="width:200px;height:200px;">
																</a>
															</td>
															<td>
																<a href="/TeraNavi/front/mypage?paramUserId=${member.id}">
																	<h3>${member.userName}</h4>
																</a>
															</td>
														</tr>

													</c:forEach>


												</tbody>

											</table>

										</div>
									</div>
								</div>
							</div>
							<c:choose>
								<c:when test="${pageScope.flag eq 1}">
									<p id="sub"></p>
								</c:when>
							</c:choose>
						</form>
					</div><!--end row-->
				</div><!--end container-->
			</div>
			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>


			<script>
				$(function () {
					$('.check').append('<input type="checkbox">');
					$('#sub').append('<button type="submit" class="btn btn-warning" form="grant">権限付与する</button>');
				});
			</script>




		</body>
	</html>
