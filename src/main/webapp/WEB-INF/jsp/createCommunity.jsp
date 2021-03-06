
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>コミュニティ作成</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
		<link rel="stylesheet" href="/TeraNavi/css/style.css" type="text/css"/>
		<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
	</head>
	<body>
		<%-- ヘッダー部分のHTMLを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/header.jsp"/>


		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<%-- コミュニティ作成と編集で分岐 --%>
						<%-- resultが空なら作成、空でなければ編集 --%>
						<c:choose>
							<c:when test="${empty result}">
								<form role="form" action="/TeraNavi/front/createcomm" method="post" id="commForm">
									<div class="form-group">
										<label class="control-label" for="name">コミュニティ名</label>
										<input class="form-control" id="name" name="commName" placeholder="例:情報処理科2年のコミュニティ">
									</div>

									<div class="row" id="validateCommunityName" style="display: none;">
										<p class="col-md-12 col-xs-12 bg-warning text-danger help-message">コミュニティは必須入力です</p>
									</div>

									<div class="form-group">
										<label class="control-label" for="profile">紹介文</label>
										<textarea class="form-control" id="profile" rows="4" name="commProfile" placeholder="例:情報処理科2年が入ることを推奨します"></textarea>
									</div>アイコン
									<div class="col-md-12 text-left">
										<img id="preIcon" class="hidden-xs" src="" width="150px" height="150px">
										<img id="preIconMobile" class="visible-xs" src="" width="60px" height="60px">
									</div>
									<div class="col-md-12">
										<input type='file' value="ファイル選択" id='iconFile' onchange="fileUpIcon();">
									</div>
									<input id="icon" type="hidden" name="commIcon">
									<br>
									<br>ヘッダ画像
									<br>
									<div class="col-md-12 text-left hidden-xs">
										<img id="preHeader" src="" width="450px" height="150px">
									</div>
									<div class="col-xs-12 text-left visible-xs">
										<img id="preHeaderMobile" src="" width="260px" height="100px">
									</div>
									<div class="col-md-12">
										<input type='file' value="ファイル選択" id='headerFile' onchange="fileUpHeader();"><br>

									</div>
									<br>
									<br>
									<input id="commHeaderPath" type="hidden" name="commHeader">

									<input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
									<div class="text-center col-xs-12 col-md-12">
										<button type="button" class="btn btn-warning hidden-xs" id="csubmit">コミュニティを作成</button>
										<button type="button" class="btn btn-warning visible-xs btn-block" id="csubmitMobile">コミュニティを作成</button>


										<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">クリックするとモーダルウィンドウが開きます。</button> -->
										<!--モーダルがあったところ-->
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<form role="form" action="/TeraNavi/front/commSetting" method="post" id="commForm">
									<div class="form-group">
										<label class="control-label" for="name">コミュニティ名</label>
										<input class="form-control" id="name" name="commName" placeholder="例:情報処理科2年のコミュニティ" value="${result.name}">
									</div>

									<div class="row" id="validateCommunityName" style="display: none;">
										<p class="col-md-12 col-xs-12 bg-warning text-danger help-message">コミュニティは必須入力です</p>
									</div>

									<div class="form-group">
										<label class="control-label" for="profile">紹介文</label>
										<textarea class="form-control" id="profile" rows="4" name="commProfile" placeholder="例:情報処理科2年が入ることを推奨します" value="${result.profile}"></textarea>
									</div>アイコン
									<div class="col-md-12 text-left">
										<img id="preIcon" class="hidden-xs" src="${result.iconPath}" width="150px" height="150px">
										<img id="preIconMobile" class="visible-xs" src="${result.iconPath}" width="60px" height="60px">
									</div>
									<div class="col-md-12">
										<input type='file' value="ファイル選択" id='iconFile' onchange="fileUpIcon();">
									</div>
									<input id="icon" type="hidden" name="iconPath" value="${result.iconPath}">
									<br>
									<br>ヘッダ画像
									<br>
									<div class="col-md-12 text-left hidden-xs">
										<img id="preHeader" src="${result.headerPath}" width="450px" height="150px">
									</div>
									<div class="col-xs-12 text-left visible-xs">
										<img id="preHeaderMobile" src="${result.headerPath}" width="260px" height="100px">
									</div>
									<div class="col-md-12">
										<input type='file' value="ファイル選択" id='headerFile' onchange="fileUpHeader();"><br>
									</div>
									<br>
									<br>
									<input id="commHeaderPath" type="hidden" name="headerPath" value="${result.headerPath}">
									<input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
									<input type="hidden" name="commId" value="${result.id}">
									<input type="hidden" name="deleteFlag" value="0">
									<input type="hidden" name="target" value="communitySettingResult">
									<div class="text-center col-xs-12 col-md-12">
										<button type="button" class="btn btn-warning hidden-xs" id="csubmit">コミュニティを編集</button>
										<button type="button" class="btn btn-warning visible-xs btn-block" id="csubmitMobile">コミュニティを編集</button>
									</div>
								</form>
							</c:otherwise>
						</c:choose>

						<!-- モーダルウィンドウの中身 -->
						<div class="fade modal text-justify hidden-xs" id="myModal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h4 class="modal-title">確認画面</h4>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-xs-1"></div>
											<div class="col-xs-10">
												<h2>コミュニティ名</h2>
												<h5 id="mTitle"></h5>
												<h2>コミュニティ紹介文</h2>
												<h5 id="mProfile"></h5>
												<h2>アイコン画像</h2>
												<img src="" class="img-thumbnail" width="110" height="110" id="mIcon">
												<h2>ヘッダー画像</h2>
												<img src="" class="img-rounded" width="480" height="150" id="mHeader">
											</div>
											<div class="col-md-1"></div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-block btn-warning" form="commForm">OK</button>
										<button type="submit" class="btn btn-block btn-warning" data-dismiss="modal">閉じる</button>
									</div>
								</div>
							</div>
						</div>
						<!-- モーダル閉じるやつだよ -->
					</div>
				</div>
			</div>
		</div>

		<div class="fade modal text-justify modal-xs" id="myModalMobile">
			<div class="modal-dialog">
                <div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">確認画面</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-10">
								<h2>コミュニティ名</h2>
								<h5 id="mTitleMobile"></h5>
							</div>

							<div class="col-xs-10">
								<h2>コミュニティ紹介文</h2>
								<h5 id="mProfileMobile"></h5>

							</div>
							<div class="col-xs-10">
								<h2>アイコン画像</h2>
								<img src="" class="img-thumbnail" width="110" height="110" id="mIconMobile">
							</div>

							<div class="col-xs-10">
								<h2>ヘッダー画像</h2>
								<img src="" class="img-rounded" width="240" height="80" id="mHeaderMobile">

							</div>

							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-block btn-warning" form="commForm">OK</button>
						<button type="submit" class="btn btn-block btn-warning" data-dismiss="modal">閉じる</button>
					</div>
                </div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
		<script>
			var ajaxSettings;
			var ajax;

			$(document).on("blur", "#name", function () {
				if ($("#name").val().length <= 0) {

					$("#validateCommunityName").css("display", "");
				} else {
					$("#validateCommunityName").css("display", "none");
				}
			});

			$(function () {

				ajaxSettings = {
					type: 'post',
					url: '/TeraNavi/upload',
					processData: false,
					contentType: false,
					cache: false,
					dataType: 'json'
				}

				$("#csubmit").on("click", function () {

					if ($("#name").val().length <= 0) {

						$("#validateCommunityName").css("display", "");
						alert("正しく入力されていない項目があります");
					} else {
						$("#mTitle").empty();
						$("#mProfile").empty();


						$("#mHeader").attr("src", $("#commHeaderPath").val());
						$("#mTitle").append($("#name").val());
						$("#mProfile").append($("#profile").val());
						$("#mIcon").attr("src", $("#icon").val());

//						確認モーダルを開く処理
						$("#myModal").modal("show");
					}



				});

				$("#csubmitMobile").on("click", function () {

					if ($("#name").val().length <= 0) {

						$("#validateCommunityName").css("display", "");
						alert("正しく入力されていない項目があります");
					} else {
						$("#mTitleMobile").empty();
						$("#mProfileMobile").empty();


						$("#mHeaderMobile").attr("src", $("#commHeaderPath").val());
						$("#mTitleMobile").append($("#name").val());
						$("#mProfileMobile").append($("#profile").val());
						$("#mIconMobile").attr("src", $("#icon").val());

						$("#myModalMobile").modal("show");
					}




				});


			});

			function fileUpIcon() {
				var files = document.getElementById("iconFile").files;

				for (var i = 0; i < files.length; i++) {
					console.log("for");
					var f = files[i];
					var formData = new FormData();
					formData.append("file", f);
					ajaxSettings.data = formData;
					ajaxSettings.url = "/TeraNavi/upload";
					ajaxSettings.success = function (data) {
						$("#icon").val(data.result);
						$("#preIcon").attr("src", data.result);
						$("#preIconMobile").attr("src", data.result);
					}

					ajax = $.ajax(ajaxSettings);
				}

			}

			function fileUpHeader() {
				var files = document.getElementById("headerFile").files;

				for (var i = 0; i < files.length; i++) {
					console.log("for");
					var f = files[i];
					var formData = new FormData();
					formData.append("file", f);
					ajaxSettings.data = formData;
					ajaxSettings.url = "/TeraNavi/upload/header";
					ajaxSettings.success = function (data) {
						$("#commHeaderPath").val(data.result);
						$("#preHeader").attr("src", data.result);
						$("#preHeaderMobile").attr("src", data.result);
					}

					ajax = $.ajax(ajaxSettings);
				}
			}



		</script>
	</body>
</html>
