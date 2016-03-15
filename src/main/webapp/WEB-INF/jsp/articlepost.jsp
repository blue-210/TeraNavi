<!DOCTYPE html>
	<html lang="ja">
		<head>

			<meta charset="UTF-8">

			<title>記事を書く</title>

			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="/TeraNavi/js/wysiwyger.js"></script>
			<script type="text/javascript" src="/TeraNavi/js/bootstrap.js"></script>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
			<script src="/TeraNavi/js/ckeditor/ckeditor.js"></script>
			<link rel="stylesheet" href="/TeraNavi/css/articlePost.css">
			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>

			<style>
				.modal-open {
					overflow: auto;
				}
				.modal-close {
					overflow: auto;
				}
			</style>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<%-- トップのナビゲーションを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

			<div class="section">
				<div class="container">
					<div class="row">

						<!-- 2列をサイドメニューに割り当て -->
						<div class="col-md-2 hidden-xs">
							<jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
							<script>
								$("#articlePostTab").attr("class", "active");
							</script>
						</div>

						<!--モバイル用のドロップダウンメニュー-->
						<div class="container visible-xs">
							<div class="dropdown">
								<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">記事を書く<span class="caret"></span></button>
								<ul class="dropdown-menu">
									<li id="mypageTab">
										<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a>
									</li>
									<c:choose>
										<c:when test="${sessionScope.loginUser.blogStatus eq 1}">

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
										<a href="/TeraNavi/front/commmy?groupBy=group+By+community_members_list.fk_community_id+&where=community_members_list.fk_user_id%3D+%3F+and+communities.community_delete_flag+%3D0+and+community_members_list.community_withdrawal_flag+%3D0&target=create">コミュニティ管理</a>
									</li>
									<!--									<li>
																			<a href="/TeraNavi/front/showDmList">DM</a>
																		</li>-->
									<br><br>
									<li>
										<a href="/TeraNavi/withdraw">退会</a>
									</li>


								</ul>
							</div>
						</div>



						<!-- 残り8列はコンテンツ表示部分として使う -->
						<div class="col-md-8 col-xs-offset-1">

							<div class="row">
								<form action="/TeraNavi/front/articlepost" method="post" id="articleForm" role="form">
									<div class="form-group">
										<label class="control-label">タイトル</label>
										<input type="text" name="title" class="form-control" id="inputTitle" style="width: 92%;">


										<!--入力チェックのメッセージ用のdiv-->
										<div class="row" id="validateTitle" style="display: none;">
											<p class="col-md-12 col-xs-12 bg-warning text-danger help-message">タイトルは必須入力です</p>
										</div>

										<br>
										<label class="control-label">内容</label>

											<textarea class="ckeditor" id="inputBody" name="body"></textarea>

										<div class="col-md-3 pull-left" >
											<a class="btn btn-default btn-block" id="btn_addTag">タグ追加</a>
										</div>
										<a id="addImage" style="cursor:pointer" class="hidden-xs"><i class="fa fa-3x fa-fw fa-image text-muted pull-left"></i></a>
										<a id="mobileAddImage" style="cursor:pointer" class="visible-xs"><i class="fa fa-3x fa-fw fa-image text-muted pull-left"></i></a>
										<input type="file" id="inputImage" class="hidden">
									</div>
								</form>
							</div>

							<div class="row" id="validateMessage" style="display: none;">
								<p class="col-md-12 col-xs-12 bg-warning text-danger help-message">入力内容が正しくない項目があります</p>

							</div>

							<div class="row">
								<div class="col-md-4 col-md-offset-4 col-xs-4 hidden-xs">
									<button type="button" class="btn btn-default pull-right" id="btn_preview">プレビュー</button>
								</div>
								<div class="col-md-4 col-md-offset-4 col-xs-4 col-xs-offset-1 visible-xs">
									<button type="button" class="btn btn-default pull-right" id="mobile_btn_preview">プレビュー</button>
								</div>
								<div class="col-md-2 col-xs-4 hidden-xs">
									<button type="button" class="btn btn-default" id="btn_draft">下書き保存</button>
								</div>
								<div class="col-md-2 col-xs-4 col-xs-offset-1 visible-xs">
									<button type="button" class="btn btn-default pull-right" id="mobile_btn_draft">下書き保存</button>
								</div>
								<div class="col-md-2 col-xs-4 hidden-xs" style="margin-left: inherit;">
									<button type="button" class="btn btn-lg btn-warning" id="btn_post">投稿</button>
								</div>
							</div>
							<div class="col-xs-12 visible-xs" style="margin-top:10px;margin-left: -4%;">
								<button type="button" class="btn btn-block btn-warning" id="mobile_btn_post">投稿</button>
							</div>



						</div><!-- end col-8コンテンツ -->

					</div><!--end row-->
				</div><!--end container-->
			</div><!--end section-->
			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

			<!-- タグ選択モーダル -->
			<div class="fade modal text-justify modals" id="addTagModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
             <h4 class="modal-title text-center">タグ追加</h4>
						</div>
						<div class="modal-body" id="addTagModalBody">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-block btn-default" data-dismiss="modal">確定</button>
						</div>
					</div>
				</div>
			</div>

			<!-- プレビューモーダル -->
			<div class="fade modal text-justify modals" id="previewModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
             　<h4 class="modal-title text-center">プレビュー</h4>
						</div>
						<div class="modal-body" id="previewModalBody">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-block btn-default" data-dismiss="modal">閉じる</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 確認モーダル -->
			<div class="fade modal text-justify modals" id="articlePostModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
							<h4 class="modal-title text-center">確認</h4>
						</div>
						<div class="modal-body" id="articlePostModalBody">
						</div>
						<div class="modal-footer" id="articlePostModalFooter">
							<button type="submit" class="btn btn-block btn-warning hidden-xs" id="btn_modalArticlePost" data-dismiss="modal">投稿</button>
							<button type="submit" class="btn btn-block btn-warning visible-xs" id="mobile_btn_modalArticlePost" data-dismiss="modal">投稿</button>
							<button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 結果モーダル -->
			<div class="modal fade modals" id="articlePostResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">閉じる</span></button>
							<h4 class="modal-title text-center" id="articlePostResultModalLabel">記事の投稿結果</h4>
						</div>
						<div class="modal-body">
							<p id="articlePostResultMessage" class="text-center">記事の投稿が完了しました</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->



			<script>
				var ajaxSettings;
				var ajax;
				$(function () {

					ajaxSettings = {
						type: 'post',
						url: 'upload',
						processData: false,
						contentType: false,
						cache: false,
						dataType: 'json'

					};

				});

				$(function () {

					//タグ一覧を取得する処理-----------------------------------------------------------
					$.ajax({
						// urlで飛ばしたいコマンドを指定してあげる
						url: '/TeraNavi/front/getTagList',
						type: 'POST',
						dataType: 'json',
						//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
						data: {
							//   キー:バリューで書く。バリューには変数も使えます。
							ajax: 'true'
						}
					})
							//    成功時の処理
							.done(function (data) {
								//タグ選択モーダルにタグ一覧を入れ込む
								var atmBody = $("#addTagModalBody")
								for (var i in data) {
									var tagId = data[i].id;
									var tagName = data[i].name;
									atmBody.append(
											'<label class="checkbox-inline">\n\
									<input type="checkbox" name="chTag" value="' + tagId + '">\n\
										' + tagName + '\n\
								</label>'
											);
								}
							})
							//    失敗時の処理
							.fail(function () {

							});

					//画像追加-------------------------------------------------------------

					$("#addImage").on("click", function () {
						$("#inputImage").click();
					});

					$(document).on("change", "#inputImage", function () {
						var file = this.files[0];
						// ブラウザごとの違いをフォローする
						window.URL = window.URL || window.webkitURL;

						// Blob URLの作成
						src = window.URL.createObjectURL(file);
						$("#headimg").attr("src", src);
						uploadImage();
					});

					function uploadImage() {
						var files = document.getElementById("inputImage").files;

						for (var i = 0; i < files.length; i++) {
							var f = files[i];
							var formData = new FormData();
							formData.append("file", f);
							ajaxSettings.data = formData;
							ajaxSettings.url = "/TeraNavi/upload/article";
							ajaxSettings.success = function (data) {
								var imageTag = "<img src=\"" + data.result + "\" / style=\"width:100%;\">";
								var currentText = CKEDITOR.instances.inputBody.getData();
								CKEDITOR.instances.inputBody.setData(currentText + "" + imageTag);
								console.log(imageTag);
								console.log(currentText);
								console.log(CKEDITOR.instances.inputBody.getData());
							}

							ajax = $.ajax(ajaxSettings);
						}
					}


					//モバイル版の画像追加-------------------------------------------------------------

					$("#mobileAddImage").on("click", function () {
						$("#inputImage").click();
					});

					$(document).on("change", "#inputImage", function () {
						var file = this.files[0];
						// ブラウザごとの違いをフォローする
						window.URL = window.URL || window.webkitURL;

						// Blob URLの作成
						src = window.URL.createObjectURL(file);
						$("#headimg").attr("src", src);
						uploadMobileImage();
					});

					function uploadMobileImage() {
						var files = document.getElementById("inputImage").files;

						for (var i = 0; i < files.length; i++) {
							var f = files[i];
							var formData = new FormData();
							formData.append("file", f);
							ajaxSettings.data = formData;
							ajaxSettings.url = "/TeraNavi/upload/article";
							ajaxSettings.success = function (data) {
								var imageTag = "<img src=\"" + data.result + "\" / style=\"width:100%;\">";
								var currentText = $("#inputBody").val();
								$("#inputBody").val(currentText + "" + imageTag);
								console.log(imageTag);
								console.log(currentText);
								console.log($("#inputBody").val());
							}

							ajax = $.ajax(ajaxSettings);
						}
					}



					//タグ選択モーダルを出す処理---------------------------------------------
					$("#btn_addTag").on("click", function () {
						$("#addTagModal").modal();
					});

					//記事投稿の際の確認モーダルを出す処理---------------------------------------------
					$("#btn_post").on("click", function () {

						if ($("#inputTitle").val().length <= 0) {
							$("#validateMessage").css("display","");
							$("#validateTitle").css("display", "");
						} else {
							var apmBody = $("#articlePostModalBody");
							var title = $("#inputTitle").val();
							var body = CKEDITOR.instances.inputBody.getData();
							$("#articlePostModalBody").empty();
							apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
							apmBody.append('<hr><p>この内容でよろしいですか？<p>');
							$("#articlePostModal").modal();
						}


					});

					//モバイル版の確認画面の表示処理
					$("#mobile_btn_post").on("click", function () {

						if ($("#inputTitle").val().length <= 0) {
							$("#validateMessage").css("display","");
							$("#validateTitle").css("display", "");
						} else {
							var apmBody = $("#articlePostModalBody");
							var title = $("#inputTitle").val();
							var body = $("#inputBody").val();
							$("#articlePostModalBody").empty();
							apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
							apmBody.append('<hr><p>この内容でよろしいですか？<p>');
							$("#articlePostModal").modal();
						}


					});


					//記事を投稿する処理--------------------------------------------------------------
					$("#btn_modalArticlePost").on("click", function () {

						var checks = [];
						$("[name='chTag']:checked").each(function () {
							checks.push(this.value);
						});

						$.ajax({
							// urlで飛ばしたいコマンドを指定してあげる
							url: '/TeraNavi/front/articlepost',
							type: 'POST',
							dataType: 'json',
							//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
							data: {
								//   キー:バリューで書く。バリューには変数も使えます。
								title: $("#inputTitle").val(),
								body: CKEDITOR.instances.inputBody.getData(),
								tag: checks,
								ajax: 'true'
							}
						})
								//    成功時の処理
								.done(function (data) {
									$("#articlePostResultModal").modal();

									$("#inputTitle").val("");
									CKEDITOR.instances.inputBody.setData("");

									$("[name='chTag']:checked").prop("checked",false);

								})
								//    失敗時の処理
								.fail(function () {
									$("#articlePostResultMessage").text("記事を投稿できませんでした");
									$("#articlePostResultModal").modal();
								});
					});
					//モバイル版投稿処理-------------------------------------------------------------------
					$("#mobile_btn_modalArticlePost").on("click", function () {

						var checks = [];
						$("[name='chTag']:checked").each(function () {
							checks.push(this.value);
						});

						$.ajax({
							// urlで飛ばしたいコマンドを指定してあげる
							url: '/TeraNavi/front/articlepost',
							type: 'POST',
							dataType: 'json',
							//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
							data: {
								//   キー:バリューで書く。バリューには変数も使えます。
								title: $("#inputTitle").val(),
								body: $("#inputBody").val(),
								tag: checks,
								ajax: 'true'
							}
						})
								//    成功時の処理
								.done(function (data) {
									$("#articlePostResultModal").modal();

									$("#inputTitle").val("");
									$("#inputBody").val("");

									$("[name='chTag']:checked").prop("checked",false);

								})
								//    失敗時の処理
								.fail(function () {
									$("#articlePostResultMessage").text("記事を投稿できませんでした");
									$("#articlePostResultModal").modal();
								});
					});


					//下書き保存する処理--------------------------------------------------------------
					$("#btn_draft").on("click", function () {

						if ($("#inputTitle").val().length <= 0) {
							$("#validateTitle").css("display", "");
							$("#validateMessage").css("display","");
						} else {
							var checks = [];
							$("[name='chTag']:checked").each(function () {
								checks.push(this.value);
							});

							$.ajax({
								// urlで飛ばしたいコマンドを指定してあげる
								url: '/TeraNavi/front/draftArticle',
								type: 'POST',
								//   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
								dataType: 'json',
								//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
								data: {
									//   キー:バリューで書く。バリューには変数も使えます。
									title: $("#inputTitle").val(),
									body: CKEDITOR.instances.inputBody.getData(),
									tag: checks,
									ajax: 'true'
								}
							})
									//    成功時の処理
									.done(function (data) {
										$("#articlePostResultModalLabel").text("記事の下書き保存結果");
										$("#articlePostResultMessage").text("記事の下書き保存が完了しました");
										$("#articlePostResultModal").modal();

										$("#inputTitle").val("");
										CKEDITOR.instances.inputBody.setData("");

										$("[name='chTag']:checked").prop("checked",false);


									})
									//    失敗時の処理
									.fail(function () {
										$("#articlePostResultMessage").text("記事を下書き保存できませんでした");
										$("#articlePostResultModal").modal();
									});
						}



					});
					//モバイル版の下書き保存---------------------------------------------------------------------
					$("#mobile_btn_draft").on("click", function () {

						if ($("#inputTitle").val().length <= 0) {
							$("#validateTitle").css("display", "");
							$("#validateMessage").css("display","");
						} else {
							var checks = [];
							$("[name='chTag']:checked").each(function () {
								checks.push(this.value);
							});

							$.ajax({
								// urlで飛ばしたいコマンドを指定してあげる
								url: '/TeraNavi/front/draftArticle',
								type: 'POST',
								//   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
								dataType: 'json',
								//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
								data: {
									//   キー:バリューで書く。バリューには変数も使えます。
									title: $("#inputTitle").val(),
									body: $("#inputBody").val(),
									tag: checks,
									ajax: 'true'
								}
							})
									//    成功時の処理
									.done(function (data) {
										$("#articlePostResultModalLabel").text("記事の下書き保存結果");
										$("#articlePostResultMessage").text("記事の下書き保存が完了しました");
										$("#articlePostResultModal").modal();

										$("#inputTitle").val("");
										$("#inputBody").val("");

										$("[name='chTag']:checked").prop("checked",false);


									})
									//    失敗時の処理
									.fail(function () {
										$("#articlePostResultMessage").text("記事を下書き保存できませんでした");
										$("#articlePostResultModal").modal();
									});
						}



					});


					$("#btn_preview").on("click", function () {
						var apmBody = $("#previewModalBody");
						var title = $("#inputTitle").val();
						var body = CKEDITOR.instances.inputBody.getData();
						$("#previewModalBody").empty();
						apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
						$("#previewModal").modal();

					});
					//モバイル版プレビュー
					$("#mobile_btn_preview").on("click", function () {
						var apmBody = $("#previewModalBody");
						var title = $("#inputTitle").val();
						var body = $("#inputBody").val();
						$("#previewModalBody").empty();
						apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
						$("#previewModal").modal();

					});

					$(document).on("blur", "#inputTitle", function () {
						if ($("#inputTitle").val().length <= 0) {
							$("#validateTitle").css("display", "");
						} else {
							$("#validateTitle").css("display", "none");
							$("#validateMessage").css("display","none");
						}
					});

						//useragent（デバイスの情報）を取得
						var userAgent = window.navigator.userAgent.toLowerCase();

						//デバイスごとに挿入するタグを分岐
						if(userAgent.indexOf('iphone') != -1 || userAgent.indexOf('Android') != -1){
						//iphoneの場合に、#apAreaにpタグを挿入
						$('#inputBody').removeClass('ckeditor');
						$('#inputBody').addClass('form-control');
						$('#inputBody').css('height','210px');
						$('#inputBody').css('width','92%');

						}


						$("textarea").change( function() {
							var txtVal = $(this).val();
							text = txtVal.replace(/\r?\n/g, "<br />");
							$('#inputBody').val(text);
						});
					});




			</script>
		</body>
	</html>
