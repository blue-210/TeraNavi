<link href="/TeraNavi/css/header.css" rel="stylesheet" type="text/css">
<script src="/TeraNavi/js/search.js"></script>
<script src="/TeraNavi/JavaScriptServlet"></script>

<%
	String token = ttc.util.CsrfUtil.getToken();
	session.setAttribute("token",token);
%>


<div class="hidden-xs">
	<nav class="navbar navbar-default navbar-fixed-top" id="header_bar">
		<div class="container-fluid">
			<div class="navbar-header" >
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarEexample3">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="/TeraNavi/front/top" class="navbar-brand" id="TeraNavi"><img src="/TeraNavi/img/TeraNavi_logo.png" style="width:100px; margin-top:-25px;"></a>
			</div>
			<form method="post" action="/TeraNavi/front/usearch" class="md_sform" id="sform" role="search">
				<select id="target" class="md_target">
					<option value="usearch" selected>ユーザ</option>
					<option value="commList">コミュニティ</option>
					<option value="keywordsearch">ブログ</option>
				</select>
				<input type="text"  name="keyword" class="md_keyword" placeholder="このまま検索すると全件検索になります">
				<input type="hidden" name="intention" value="search">
				<span>
					<button type="submit" class="btn btn-default md_searchbutton" id="searchbutton"><i class='fa fa-search' id="searchicon"></i></button>
				</span>
			</form>
			<i class="fa fa-bell-o hidden-xs" id="bell_logo" style="display: none;"></i>
			<ul class="nav pull-right">
				<c:choose>
					<c:when test="${not empty sessionScope.loginUser}">
						<li class="dropdown">
							<a href="#" id="username" class="dropdown-toggle" data-toggle="dropdown">
								<img id="account_img" class="hidden-xs" src="${sessionScope.loginUser.iconPath}">
								<span>${sessionScope.loginUser.userName}さん<b class="caret"></b></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a></li>
								<li><a href="/TeraNavi/front/logout">ログアウト</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right list-inline">
							<li><a id="btn_sign" class="headermenu" onclick="showAgreeModal()" style="cursor:pointer;">新規登録</a><li>
							<li><a class="headermenu" data-toggle="modal" href="#loginmodal">ログイン</a><li>
						</ul>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>

</div>

<!-- 利用規約同意モーダル -->
<div class="fade modal text-justify" id="agreeModal">
	<div class="modal-dialog modal-lg">
	  <div class="modal-content">
		<div class="modal-header">
		  <button type="button" class="close pull-right" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">×</span>
		  </button>
		　<h4 class="modal-title text-center">確認</h4>
		 </div>
		<div class="modal-body">
			<p class="text-center">
				TeraNaviにアカウントを作成するには、<br><a href="/TeraNavi/showRule" target="_blank">利用規約</a>、
				および<a href="/TeraNavi/showPolicy" target="_blank">プライバシーポリシー</a>に同意する必要があります
			</p>
			<hr>
			<div class="row">
				<div class="col-md-12" style="width:100%; height:40%; overflow:auto;">
					<div id="ruleMainModal">
						<h1></h1>
						<p class='text-center'>申し訳ございません。正しく利用規約を読み込めませんでした</p>
						<p class='text-center'>ページを更新するか、上部のリンクから確認してください。</p>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12" style="width:100%; height:40%; overflow:auto;">
					<div id="policyMainModal">
						<h1></h1>
						<p class='text-center'>申し訳ございません。正しくプライバシーポリシーを読み込めませんでした</p>
						<p class='text-center'>ページを更新するか、上部のリンクから確認してください。</p>
					</div>
				</div>
			</div>
			<hr>
			<form name="Form1" method="post" action="#">
				<input type="radio" value="同意しない" id="radio-no" name="agreement" checked onClick="changeDisabled()"><label for="radio-no"> 同意しない</label><br>
				<input type="radio" value="同意する" id="radio-agree" name="agreement" onClick="changeDisabled()"><label for="radio-agree"> 同意する</label>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" onclick="location.href='/TeraNavi/sign'" class="btn btn-block btn-warning" id="btn_modalSign" data-dismiss="modal" disabled>新規登録</button>
			<button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
		</div>
	  </div>
	</div>
</div>

<script src="/TeraNavi/js/loadRuleModal.js"></script>
<script src="/TeraNavi/js/loadPolicyModal.js"></script>

<script>
	//モーダル出す
	function showAgreeModal(){
		$("#agreeModal").modal();
	}

	//同意するにチェックしたらボタンを有効化
	function changeDisabled() {
		if ( document.Form1["agreement"][1].checked ) {
			$("#btn_modalSign").prop("disabled",false);
		} else {
			$("#btn_modalSign").prop("disabled",true);
		}
	}
	window.onload = changeDisabled;
</script>

<div class="visible-xs">
	<div class="navbar navbar-default navbar-fixed-top xs-header-nav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="/TeraNavi/front/top" class="navbar-brand" id="TeraNavi"><img src="/TeraNavi/img/TeraNavi_logo.png" style="width:60px; margin-top:-10px;"></a>
				<button type="button" class="navbar-toggle navbar-left" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/TeraNavi/front/top">Top</a></li>
					<li><a data-toggle="modal" href="#searchFormModal">検索</a><li>
					<c:choose>
						<c:when test="${not empty sessionScope.loginUser}">
							<li><a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a></li>
							<li><a href="/TeraNavi/front/logout">Logout</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="headermenu" onclick="showAgreeModal()">新規登録</a><li>
							<li><a data-toggle="modal" href="#loginmodal">Login</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>

<!-- 横スクロールナビゲーション -->


<%-- 検索モーダル本体 --%>
	<div class="modal fade" id="searchFormModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
                <form action="/TeraNavi/front/usearch" method="POST" id="sFormMobile">
                  <div class="form-group">
						<select id="targetMobile">
							<option value="usearch" selected>ユーザ</option>
							<option value="commList">コミュニティ</option>
							<option value="keywordsearch">ブログ</option>
						</select>
					  <input type="text" class="form-group" name="keyword" placeholder="このまま検索すると全件検索になります">
					  <input type="hidden" name="intention" value="search">
                  </div>
                  <button type="submit" class="btn btn-default btn-block">検索</button>
                </form>
            </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</div>

	<div id="loginmodal" class="modal fade" style="z-index: 1100; width: 100%;">
		<div class="modal-dialog">
			<div class="modal-content col-xs-12 col-md-12">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h1 class="text-center">ログイン</h1>
				</div>
				<div class="modal-body">
					<form action="/TeraNavi/front/login" method="post">
						<input type="hidden" name="token" value="<%=token %>">
						<div class="form-group">
							<label class="control-label" for="exampleInputId">ログインID</label>
							<input class="form-control" required="" name="loginId" type="text">
						</div>
						<div class="form-group">
							<label class="control-label" for="exampleInputPass">パスワード</label>
							<input class="form-control" required="" name="password" type="password">
						</div>
						<button type="submit" class="btn btn-default pull-right">ログインする</button>
					</form>
					<a href="/TeraNavi/reset">パスワードを忘れた方はこちら</a>
				</div>
				<div class="modal-footer"></div>
			</div><!--end moal-content-->
		</div><!--end modal-dialog-->
	</div><!--end modal-->
