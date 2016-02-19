<link href="/TeraNavi/css/header.css" rel="stylesheet" type="text/css">
<script src="/TeraNavi/js/search.js"></script>

<nav class="navbar navbar-default navbar-fixed-top" id="header_bar">
	<div class="container-fluid">
		<div class="navbar-header" >
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarEexample3">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="/TeraNavi/front/top" class="navbar-brand"><img src="/TeraNavi/img/TeraNavi_logo.png" style="width:100px; margin-top:-25px;"></a>
		</div>
		<select id="target">
			<option value="usearch" selected>ユーザ</option>
			<option value="commList">コミュニティ</option>
			<option value="keywordsearch">ブログ</option>
		</select>
		<form method="post" action="/TeraNavi/front/usearch" id="sform" role="search">
			<input type="text"  name="keyword" class="form-control">
			<input type="hidden" name="intention" value="search">
			<span class="input-group-btn">
				<button type="submit" class="btn btn-default"><i class='fa fa-search'></i></button>
			</span>
		</form>
		<i class="fa fa-bell-o" id="bell_logo"></i>
		<ul class="nav pull-right">
			<c:choose>
				<c:when test="${not empty sessionScope.loginUser}">
					<li class="dropdown">
						<a href="#" id="username" class="dropdown-toggle" data-toggle="dropdown">
							<img id="account_img" src="${sessionScope.loginUser.iconPath}">
							<span>${sessionScope.loginUser.userName}さん<b class="caret"></b></span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/TeraNavi/front/mypage">マイページ</a></li>
							<li><a href="/TeraNavi/front/logout">ログアウト</a></li>
						</ul>
					</li>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right list-inline">
						<li><a href="/TeraNavi/sign">新規登録</a><li>
						<li><a data-toggle="modal" href="#loginmodal">ログイン</a><li>
					</ul>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>
<div id="loginmodal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h1 class="text-center">ログイン</h1>
			</div>
			<div class="modal-body">
				<form action="/TeraNavi/front/login" method="post">
					<div class="form-group">
						<label class="control-label" for="exampleInputId">ログインID</label>
						<input class="form-control" name="loginId" type="text">
					</div>
					<div class="form-group">
						<label class="control-label" for="exampleInputPass">パスワード</label>
						<input class="form-control" name="password" type="password">
					</div>
					<button type="submit" class="btn btn-default pull-right">送信する</button>
				</form>
				<a href="/TeraNavi/reset">パスワードを忘れた方はこちら</a>
			</div>
			<div class="modal-footer"></div>
		</div><!--end moal-content-->
	</div><!--end modal-dialog-->
</div><!--end modal-->
