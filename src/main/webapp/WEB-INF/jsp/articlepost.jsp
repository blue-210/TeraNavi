<!DOCTYPE html>
	<html lang="ja">
		<head>

			<meta charset="UTF-8">

			<title>記事を書く</title>

			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="/TeraNavi/js/bootstrap.js"></script>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
			<%-- <script src="/TeraNavi/js/ckeditor/ckeditor.js"></script> --%>
			<script src="/TeraNavi/js/tinymce/tinymce.min.js"></script>
			<script src="/TeraNavi/js/articlepost.js"></script>
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
			<script>
				tinymce.init({
					language : "ja",
					mode : "specific_textareas",
					editor_selector: "articleEditor",
					plugins: [
						 "advlist autolink link image imagetools lists charmap print preview hr anchor pagebreak",
						 "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
						 "table contextmenu directionality emoticons paste textcolor responsivefilemanager code"
				   ],
				   toolbar1: "undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | styleselect",
				   toolbar2: "| link unlink anchor | jbimages | image media | forecolor backcolor  | print preview code ",
				   relative_urls: false ,

					 // external_filemanager_path:"./filemanager/",
					  filemanager_title:"jbimages" ,
					  external_plugins: { "jbimages" : "plugins/jbimages/plugin.min.js"}
				});
			</script>
		</head>
		<body>

			<!--ログインしてる人にだけ見せる-->
			<%
				if(session.getAttribute("loginUser")==null){
					response.sendRedirect("/TeraNavi/login");
				}
			%>

			<%
				String token = ttc.util.CsrfUtil.getToken();
				session.setAttribute("token",token);
			%>

			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<%-- トップのナビゲーションを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/topnav.jsp"/>

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
								<button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">記事を書く<span class="caret"></span></button>
								<ul class="dropdown-menu">
									<li id="mypageTab">
										<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a>
									</li>
									<c:choose>
										<c:when test="${sessionScope.loginUser.blogStatus eq 1}">
											<li>
												<a href="/TeraNavi/front/showArticleList?writeUserId=${sessionScope.loginUser.id}">投稿記事一覧</a>
											</li>
											<li>
												<a href="/TeraNavi/front/showDraftArticleList">下書き一覧</a>
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
									<li>
										<a href="/TeraNavi/front/showDmList">DM</a>
									</li>
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

										<textarea class="articleEditor" id="inputBody" name="body" rows="30"></textarea>

										<div class="col-md-3 pull-left" >
											<a class="btn btn-default btn-block" id="btn_addTag">タグ追加</a>
										</div>
										<a id="mobileAddImage" style="cursor:pointer" class="visible-xs"><i class="fa fa-3x fa-fw fa-image text-muted pull-left"></i></a>
										<input type="file" id="inputImage" class="hidden">
									</div>
								</form>
							</div>

							<div class="row" id="validateMessage" style="display: none;">
								<p class="col-md-12 col-xs-12 bg-warning text-danger help-message">記事内容が書かれてません</p>

							</div>

							<div class="row">
								<div class="col-md-4 col-md-offset-4 col-xs-4 hidden-xs">
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
		</body>
	</html>
