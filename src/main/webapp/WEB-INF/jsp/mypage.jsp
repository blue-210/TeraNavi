
<!DOCTYPE html>
<html lang="ja">
	<head>

		<meta charset="UTF-8">

		<title>マイページ</title>

		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="/TeraNavi/js/bootstrap.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/TeraNavi/css/navbar.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/TeraNavi/css/mypage.css" type="text/css">
		<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
	</head>
	<body>
		<%-- ヘッダー部分のHTMLを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/header.jsp"/>

		<%-- トップのナビゲーションを読み込み --%>
		<div class="section hidden-xs">
			<div class="container">
				<div class="row">
					<div class="col-xs-10 col-xs-offset-1">
						<ul class="lead nav nav-justified nav-tabs">
							<li>
								<a href="/TeraNavi/front/top" class="text-warning">TOP</a>
							</li>
							<li>
								<a href="/TeraNavi/front/top#blog" class="text-warning">ブログ</a>
							</li>
							<li>
								<a href="/TeraNavi/front/top#community" class="text-warning">コミュニティ</a>
							</li>
							<li>
								<a href="/TeraNavi/front/top#tag" class="text-warning">タグ</a>
							</li>
							<c:choose>
								<c:when test="${sessionScope.loginUser.id eq result.user.id}">
									<li class="active">
										<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
									</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>

			</div>
		</div>

		<div class="visible-xs">
			<nav class="nav nav-horizontal">
				<div class="mask">
					<ul class="list">
						<li><a href="/TeraNavi/front/top">Top</a></li>
						<li><a href="/TeraNavi/front/top#blog">ブログ</a></li>
						<li><a href="/TeraNavi/front/top#community">コミュニティ</a></li>
						<li><a href="/TeraNavi/front/top#tag">タグ</a></li>
							<c:choose>
								<c:when test="${sessionScope.loginUser.id eq result.user.id}">
								<li class="active">
									<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</nav>
		</div>
		<div class="section">
			<div class="container">
				<div class="row">

					<c:choose>
						<c:when test="${sessionScope.loginUser.id eq result.user.id}">


							<!-- 2列をサイドメニューに割り当て -->
							<div class="col-md-2 hidden-xs">
								<jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
							</div>

							<div class="container visible-xs">
								<div class="dropdown">
									<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">マイページ<span class="caret"></span></button>
									<ul class="dropdown-menu">
										<c:choose>
											<c:when test="${sessionScope.loginUser.blogStatus eq 1}">
												<li>
													<a href="/TeraNavi/articlepost">記事を書く</a>
												</li>
												<li>
													<a href="/TeraNavi/front/showDraftArticleList?writeUserId=${sessionScope.loginUser.id}">下書き一覧</a>
												</li>
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
<!--										<li>
											<a href="/TeraNavi/front/showDmList">DM</a>
										</li>-->
										<br><br>
										<li>
											<a href="/TeraNavi/withdraw">退会</a>
										</li>
									</ul>
								</div>
							</div>
							<script>
								$("#mypageTab").attr("class", "active");
							</script>

							<!-- 残り8列はコンテンツ表示部分として使う -->
							<div class="col-md-8 col-xs-12">
						</c:when>
						<c:otherwise>

								<div class="col-md-8 col-xs-12 col-md-offset-2">

						</c:otherwise>
					</c:choose>

							<div class="row visible-xs">
								<h3 style="margin-left:20px;">${result.user.userName}</h3>
							</div>
							<div class="row">
								<div class="col-md-12 col-xs-12">
									<img src="${result.user.headerPath}" style="width:100%; height:200px" class="hidden-xs">
									<img src="${result.user.headerPath}" style="width:100%; height:150px" class="visible-xs">
								</div>
							</div>

							<!--アイコン画像の表示を画面サイズに合わせて切り替える記述-->
							<div class="row hidden-xs">
								<div class="col-md-12">
									<img src="${result.user.iconPath}" class="img-thumbnail" style="width:130px; height:130px; position:relative; bottom:100px; margin-left:20px">
									<h3 style="position:relative; margin-top:-100px; margin-left:20px;">${result.user.userName}</h3>
								</div>
							</div>

							<img src="${result.user.iconPath}" class="img-thumbnail visible-xs" style="width:100px; height:100px; position:relative; bottom:100px; margin-left:10px">

							<div class="row">
								<div class="col-md-12 col-xs-12">

									<p style="position:relative;" class="well">${result.user.profile}</p>
									<c:if test="${sessionScope.loginUser.id eq result.user.id}">
										<a href="/TeraNavi/userSetting" class="btn btn-default pull-right">ユーザ情報編集</a>
									</c:if>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-12">
									<h1 class="text-warning">投稿した記事</h1>
									<table class="table table-striped">
										<tbody>
											<c:forEach var="article" items="${result.article}">
												<tr>
													<td>
														<a href="/TeraNavi/front/showArticle?articleId=${article.articleId}"><p class="text-muted">${article.title}</p></a>
													</td>
													<td>${article.createdDate}</td>
												</tr>
												<tr>
												</c:forEach>
										</tbody>
									</table>
									<c:choose>
										<c:when test="${fn:length(result.article)  > 0}">
											<c:choose>
												<c:when test="${sessionScope.loginUser.id eq result.user.id}">
													<a href="/TeraNavi/front/showArticleList?writeUserId=${result.user.id}&scope=-1" id="btn-articleList" class="btn btn-warning pull-right"
														data-toggle="popover" title="記事の編集、削除はこちらから">
														投稿記事の一覧
													</a>
												</c:when>
												<c:otherwise>
													<a href="/TeraNavi/front/showArticleList?writeUserId=${result.user.id}&scope=-1" class="btn btn-warning pull-right">
														投稿記事の一覧
													</a>
												</c:otherwise>
											</c:choose>

										</c:when>
										<c:otherwise>
											<p class="text-center">まだ記事が投稿されていません</p>
										</c:otherwise>
									</c:choose>
									<br>

									<hr>

									<br>
									<h1 class="text-warning">参加中のコミュニティ</h1>
									<table class="table table-striped">
										<tbody>
											<c:forEach var="community" items="${result.community}">
												<tr id="tableRow${community.id}">
													<td>
														<img src="${community.iconPath}" class="img-thumbnail" style="width:50px;height:50px;">
													</td>
													<td><a href="/TeraNavi/front/showcomm?commId=${community.id}"><p class="text-muted">${community.name}</p></td>
													<td>
														<c:choose>
															<c:when test="${sessionScope.loginUser.id eq result.user.id}">
																<button type="button" class="btn btn-danger btn_withDraw" value="${community.id}">退会</button>
															</c:when>
														</c:choose>
													</td>
												</tr>

											</c:forEach>

										</tbody>
									</table>
									<c:choose>
										<c:when test="${fn:length(result.community) > 0}">
											<a href="/TeraNavi/front/commmy?myCommunityList=true&targetUserId=${result.user.id}" class="btn btn-warning pull-right">参加中のコミュニティ一覧</a>　
										</c:when>
										<c:otherwise>
											<p class="text-center">まだコミュニティに参加していません</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>

							<!--<div class="col-sm-3 col-xs-6">
								<a href="/TeraNavi/dmsend">DMの送信</a><br><br>
							</div>-->

						</div>


					</div><!--end row-->
				</div><!--end container-->
			</div><!--end section-->
			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
	<script>
		$(function() {
		  $('#btn_articleList').popover({
		    trigger: 'hover', // click,hover,focus,manualを選択出来る
		  });
		});
	</script>

	<!-- 退会確認モーダル -->
	<div class="fade modal text-justify" id="withDrawModal">
		<div class="modal-dialog">
		  <div class="modal-content">
			<div class="modal-header">
			  <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">×</span>
			  </button>
			　<h4 class="modal-title text-center">確認</h4>
			 </div>
			<div class="modal-body">
				<p class="text-center">本当に退会しますか？</p>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-block btn-danger" id="btn_modalWithDraw" data-dismiss="modal">退会</button>
				<button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
			</div>
		  </div>
		</div>
	 </div>

	 <!-- 結果モーダル -->
	  <div class="modal fade" id="withDrawResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		  <div class="modal-content">
			<div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">閉じる</span></button>
			  <h4 class="modal-title text-center" id="withDrawResultModalLabel">退会結果</h4>
			</div>
			<div class="modal-body">
			  <p id="withDrawResultMessage" class="text-center">退会しました。</p>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
			</div>
		  </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	  </div><!-- /.modal -->

	  <%-- 退会処理のjs --%>
	<script>

		$(function(){

			var withDrawId;

			$(".btn_withDraw").on("click",function(){
				withDrawId = $(this).val();
				$("#withDrawModal").modal();
			});

			$("#btn_modalWithDraw").on("click",function(){

				$.ajax({
				  url: '/TeraNavi/front/withDrawComm',
				  type:'POST',
				  dataType: 'json',
				  data:{
					commId:withDrawId,
					ajax:'true'
				  }
			   })
				   .done(function(data) {
					   $("#withDrawResultModal").modal();
					   console.log("#tableRow"+withDrawId);
						$("#tableRow" + withDrawId).hide();
				   })
				   .fail(function() {
					   $("#withDrawResultMessage").text("退会できませんでした。もういちどお試しください。");
					   $("#withDrawResultModal").modal();
				   });
			});
		});

	</script>

	</body>

</html>
