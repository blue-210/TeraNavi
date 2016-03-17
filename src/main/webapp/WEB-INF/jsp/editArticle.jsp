<!DOCTYPE html>
<html lang="ja">
	<head>

		<meta charset="UTF-8">

		<title>記事の編集</title>

		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="/TeraNavi/js/bootstrap.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
		<script src="/TeraNavi/js/ckeditor/ckeditor.js"></script>
		<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
	</head>
	<body>
		<%-- ヘッダー部分のHTMLを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/header.jsp"/>

		<%-- トップのナビゲーションを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

		<%
			String token = ttc.util.CsrfUtil.getToken();
			session.setAttribute("token",token);
		%>
		
		<input type="hidden" id="tokenInput" value="<%=token %>">
		
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
							<button class="btn btn-danger dropdown-toggle" type="button" data-toggle="dropdown">記事を書く<span class="caret"></span></button>
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
											<a href="/TeraNavi/front/showBlog?targetURL=blogSetting">ブログ設定</a>
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
					<div calss="col-md-8">

						<form action="/TeraNavi/front/editArticle" method="post" id="articleForm" role="form">
							<div class="form-group">
								<div class="input-group col-md-8">
									<label class="control-label">タイトル</label>
									<input type="text" name="title" class="form-control" id="inputTitle" value="${result.article.title}">
								</div>
								<br>
								<div class="input-group col-md-8">
									<label class="control-label">内容</label>
									<textarea class="ckeditor" id="inputBody" name="body">${result.article.articleBody}</textarea>
								</div>
								<div class="col-md-2 col-md-offset-2">
									<a class="btn btn-default btn-block" id="btn_addTag">タグ追加</a>
								</div>
								<a id="addImage" style="cursor:pointer"><i class="fa fa-2x fa-fw fa-image text-muted pull-left"></i></a>
								<input type="file" id="inputImage" class="hidden">
							</div>
							<input type="hidden" name="articleId" value="${result.article.articleId}" id="targetArticleId">
						</form>
						<br>

						<div class="row">
							<div class="col-md-4 col-md-offset-2 col-xs-4">
								<button type="button" class="btn btn-default pull-right" id="btn_preview">プレビュー</button>
							</div>
							<div class="col-md-2 col-xs-4">
								<button type="button" class="btn btn-default pull-right" id="btn_draft">下書き保存</button>
							</div>
							<div class="col-md-2 col-xs-4">
								<button type="button" class="btn btn-lg btn-warning pull-right" id="btn_post">投稿</button>
							</div>
						</div>

					</div><!-- end col-8コンテンツ -->

				</div><!--end row-->
			</div><!--end container-->
		</div><!--end section-->
		<jsp:include page="/WEB-INF/jsp/footer.jsp"/>

		<!-- タグ選択モーダル -->
		<div class="fade modal text-justify" id="addTagModal">
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
		<div class="fade modal text-justify" id="previewModal">
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
		<div class="fade modal text-justify" id="editArticleModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close pull-right" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
            　<h4 class="modal-title text-center">確認</h4>
					</div>
					<div class="modal-body" id="editArticleModalBody">
					</div>
					<div class="modal-footer" id="editArticleModalFooter">
						<button type="submit" class="btn btn-block btn-warning" id="btn_modalEditArticle" data-dismiss="modal">投稿</button>
						<button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 結果モーダル -->
		<div class="modal fade" id="editArticleResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">閉じる</span></button>
						<h4 class="modal-title text-center" id="editArticleResultModalLabel">記事の編集結果</h4>
					</div>
					<div class="modal-body">
						<p id="editArticleResultMessage" class="text-center">記事の編集結果を投稿しました</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

		<script>
//			var ajaxSettings;
//			var ajax;
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
						ajax: 'true',
						articleId: $("#targetArticleId").val()
					}
				})
						//    成功時の処理
						.done(function (data) {
							//タグ選択モーダルにタグ一覧を入れ込む
							var atmBody = $("#addTagModalBody");
							for (var i in data) {
								var tagId = data[i].tag.id;
								var tagName = data[i].tag.name;
								var status = data[i].status;

								if (status == 'true') {
									atmBody.append(
											'<label class="checkbox-inline">\n\
							   <input type="checkbox" checked="true" name="chTag" value="' + tagId + '">\n\
								   ' + tagName + '\n\
						   </label>'
											);
								} else {
									atmBody.append(
											'<label class="checkbox-inline">\n\
								   <input type="checkbox" name="chTag" value="' + tagId + '">\n\
									   ' + tagName + '\n\
							   </label>'
											);

								}


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

						};

						ajax = $.ajax(ajaxSettings);
					}
				}



				//タグ選択モーダルを出す処理---------------------------------------------
				$("#btn_addTag").on("click", function () {
					$("#addTagModal").modal();
				});

//				ajaxSettings = {
//					type: 'post',
//					url: 'upload',
//					processData: false,
//					contentType: false,
//					cache: false,
//					dataType: 'json',
//					success: function (data) {
//						console.log("success");
//						var text = $("#tbody").val();
//						$("#tbody").val(text + "<br>" + data.result);
//					}
//				};

				$("#btn_post").on("click", function () {
					var eamBody = $("#editArticleModalBody");
					var title = $("#inputTitle").val();
					var body = CKEDITOR.instances.inputBody.getData();
					$("#editArticleModalBody").empty();
					eamBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
					eamBody.append('<hr><p>この内容でよろしいですか？<p>');
					$("#editArticleModal").modal();
				});

				$("#btn_modalEditArticle").on("click", function () {

					var checks = [];
					$("[name='chTag']:checked").each(function () {
						checks.push(this.value);
					});

					$.ajax({
						// urlで飛ばしたいコマンドを指定してあげる
						url: '/TeraNavi/front/editArticle',
						type: 'POST',
						//   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
						dataType: 'json',
						//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
						data: {
							//   キー:バリューで書く。バリューには変数も使えます。
							articleId: $("#targetArticleId").val(),
							status: "0",
							title: $("#inputTitle").val(),
							body: CKEDITOR.instances.inputBody.getData(),
							tag: checks,
							ajax: 'true',
							token:$("#tokenInput").val()
						}
					})
							//    成功時の処理
							.done(function (data) {
								$("#editArticleResultModal").modal();
							})
							//    失敗時の処理
							.fail(function () {
								$("#editArticleResultMessage").text("記事の編集結果を投稿できませんでした");
								$("#editArticleResultModal").modal();
							});
				});

				$("#btn_draft").on("click", function () {
					$.ajax({
						// urlで飛ばしたいコマンドを指定してあげる
						url: '/TeraNavi/front/editArticle',
						type: 'POST',
						//   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
						dataType: 'json',
						//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
						data: {
							//   キー:バリューで書く。バリューには変数も使えます。
							articleId: $("#targetArticleId").val(),
							status: "1",
							title: $("#inputTitle").val(),
							body: CKEDITOR.instances.inputBody.getData(),
							ajax: 'true',
							token:$("#tokenInput").val()
						}
					})
							//    成功時の処理
							.done(function (data) {
								$("#editArticleResultMessage").text("記事の編集結果を下書き保存しました");
								$("#editArticleResultModal").modal();
							})
							//    失敗時の処理
							.fail(function () {
								$("#editArticleResultMessage").text("記事の編集結果を下書き保存できませんでした");
								$("#editArticleResultModal").modal();
							});
				});

				$("#btn_preview").on("click", function () {
					var apmBody = $("#previewModalBody");
					var title = $("#inputTitle").val();
					var body = CKEDITOR.instances.inputBody.getData();
					$("#previewModalBody").empty();
					apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
					$("#previewModal").modal();
				});

			});

//			function onDrop(event) {
//				var files = event.dataTransfer.files;
//
//
//				for (var i = 0; i < files.length; i++) {
//
//					var f = files[i];
//					var formData = new FormData();
//					formData.append("file", f);
//					ajaxSettings.data = formData;
//					ajax = $.ajax(ajaxSettings);
//				}
//
//				event.preventDefault();
//			}

//			function onDragOver(event) {
//				event.preventDefault();
//			}
			

		</script>
	</body>
</html>
