	<!DOCTYPE html>
	<html lang="ja">
		<head>

			<meta charset="UTF-8">

			<title>マイページ</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<div class="section">
				<div class="container">
					<div class="row">
						<h1 class="text-center">ユーザ情報設定</h1><br>
						<form action="front/basic" method="post" id="setting">
							<div class="col-md-3 col-xs-0"></div>
							<div class="col-md-6 col-xs-12">
								<div class="form-group">
									名前 <input type="text" name="userName" value="${sessionScope.loginUser.userName}" class="form-control" id="name">
								</div>
							</div>
							<div class="col-md-3 col-xs-0"></div>
					</div>
					<div class="row">
						<div class="col-md-3 col-xs-0"></div>
						<div class="col-md-6 col-xs-12">
							<div class="form-group">
								ふりがな <input type="text" name="nameKana" value="${sessionScope.loginUser.nameKana}" class="form-control" id="nameKana">
							</div>
						</div>
						<div class="col-md-3 col-xs-0"></div>
					</div>
					<div class="row">
						<div class="col-md-3 col-xs-0"></div>
						<div class="col-md-6 col-xs-12">
							<div class="form-group">
								性別の表示非表示 ・表示<input type="radio" name="sexVisibleFlag" value="0" checked="true"> ・非表示<input type="radio" name="sexVisibleFlag" value="1">
							</div>
						</div>
						<div class="col-md-3 col-xs-0"></div>
					</div>
					<div class="row">
						<div class="col-md-3 col-xs-0"></div>
						<div class="col-md-6 col-xs-12">
							<div class="form-group">
								メールアドレス <input type="text" name="mailAddress" value="${sessionScope.loginUser.mailAddress}" class="form-control" id="address">
							</div>
						</div>
						<div class="col-md-3 col-xs-0"></div>
					</div>
					<div class="row">
						<div class="col-md-3 col-xs-0"></div>
						<div class="col-md-6 col-xs-12">
							<div class="form-group">
								自己紹介<textarea name="profile" class="form-control" rows="3" cols="40" id="profile">${sessionScope.loginUser.profile}</textarea>
							</div>
						</div>
						<div class="col-md-3 col-xs-0"></div>
					</div>
					<div class="row">
						<div class="col-md-3 col-xs-0"></div>
						<div class="col-md-6 col-xs-12">
							<div class="form-group">
								<div id="icon">
									ユーザアイコン <img id="usericon" src="${sessionScope.loginUser.iconPath}" width="150px" height="150px"></img>
									<input id="userIconPath" type="hidden" name="iconPath" value="${sessionScope.loginUser.iconPath}">
									<input type="file" id="iconFile">
								</div>
							</div>
						</div>
						<div class="col-md-3 col-xs-0"></div>
					</div>
					<div class="row">
						<div class="col-md-3 col-xs-0"></div>
						<div class="col-md-6 col-xs-12">
							<div class="form-group">
								<div id="head">
									ヘッダ画像<img src="${sessionScope.loginUser.headerPath}" width="80%" height="150px" id="headimg">
									<input type="file" id="headerFile">
									<input type="hidden" name="headerPath" id="headerPathHidden" value="${sessionScope.loginUser.headerPath}">
								</div>
							</div>
						</div>
						<div class="col-md-3 col-xs-0"></div>
					</div>



					<button class="btn btn-warning btn-lg" type="button" id="userSubmit" data-toggle="modal" style="margin-left:70%">確認</button>
					</form>



					<!--モーダルウインドウの中身-->
					<div class="fade modal text-justify" id="userSetting-modal" style="margin-top: 60px;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title">ユーザー情報確認</h4>
								</div>

								<div class="modal-body">
									<div class="row">
										<div class="col-md-8 col-md-offset-2"><img src="" class="img-rounded" width="100%" height="150" id="modalHeader"></div>
										<div class="col-md-2"></div>
									</div>

									<div class="row" >
										<div class="col-md-4 col-md-offset-2"><img src="" style="margin-top: -100px;" class="img-thumbnail" width="110" height="110" id="modalIcon"></div>
										<div class="col-md-6"></div>
									</div>


									<div class="row">
										<div class="col-md-4 col-md-offset-2 col-xs-4"><h2>名前</h2></div>
										<div class="col-md-4 col-xs-8"><h2>ふりがな</h2></div>
										<div class="col-md-2 col-xs-0"></div>

									</div>
									<div class="row">
										<div class="col-md-4 col-md-offset-2 col-xs-4"><h5 id="modalName"></h5></div>
										<div class="col-md-4 col-xs-8"><h5 id="modalHuri"></h5></div>
										<div class="col-md-2 col-xs-0"></div>
									</div>
									<div class="row">
										<div class="col-md-6 col-md-offset-2"><h2>メールアドレス</h2></div>
										<div class="col-md-4"></div>
									</div>
									<div class="row">
										<div class="col-md-6 col-md-offset-2"><h5 id="modalMail"></h5></div>
										<div class="col-md-4"></div>
									</div>

									<div class="row">
										<div class="col-md-6 col-md-offset-2"><h2>自己紹介</h2></div>
										<div class="col-md-4"></div>
									</div>
									<div class="row">
										<div class="col-md-6 col-md-offset-2"><h5 id="modalProfile"></h5></div>
										<div class="col-md-4"></div>
									</div>



								</div>
								<div class="modal-footer">
                                    <button type="submit" class="btn btn-warning" form="setting">設定する</button>
                                    <button type="button" class="btn btn-warning" data-dismiss="modal">キャンセル</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

			<script>
				var ajaxSettings;
				var ajax;
				$(function () {

					ajaxSettings = {
						type: 'post',
						url: '/TeraNavi/upload',
						processData: false,
						contentType: false,
						cache: false,
						dataType: 'json'
					}



				});

				$(document).on("change", "#headerFile", function () {
					var file = this.files[0];
					// ブラウザごとの違いをフォローする
					window.URL = window.URL || window.webkitURL;

					// Blob URLの作成
					src = window.URL.createObjectURL(file);
					$("#headimg").attr("src", src);
					fileUpHeader();
				});

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
							$("#headerPathHidden").val(data.result);
							$("#headerFile").attr("src", data.result);
						}

						ajax = $.ajax(ajaxSettings);
					}
				}
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
							$("#userIconPath").val(data.result);
							$("#usericon").attr("src", data.result);
						}

						ajax = $.ajax(ajaxSettings);
					}

				}

				$(document).on("change", "#iconFile", function () {
					var file = this.files[0];
					// ブラウザごとの違いをフォローする
					window.URL = window.URL || window.webkitURL;

					// Blob URLの作成
					src = window.URL.createObjectURL(file);

					fileUpIcon();
				});

				$(document).on('click', "#userSubmit", function () {
					$("#modalName").empty();
					$("#modalProfile").empty();
					$("#modalHeader").empty();
					$("#modalIcon").empty();
					$("#modalHuri").empty();

					$("#modalName").append($("#name").val());
					$("#modalProfile").append($("#profile").val());
					$("#modalHuri").append($("#nameKana").val());
					$("#modalMail").append($("#address").val());
					$("#modalHeader").attr("src", $("#headimg").attr("src"));
					$("#modalIcon").attr("src", $("#usericon").attr("src"));

					$("#userSetting-modal").modal("show");
				});





			</script>
		</body>
	</html>
