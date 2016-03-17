<html lang="ja">
	<head>
		<title>パスワードリセット</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-s<cale=1">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/TeraNavi/css/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/TeraNavi/js/footerFixed.js"></script>
		<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
	</head>
	<body>
		<%-- ヘッダー部分のHTMLを読み込み --%>
		<jsp:include page="/WEB-INF/jsp/header.jsp"/>

		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4" style="margin-top:50px">
					<h1 class="text-center">パスワードリセット</h1>
					<form action="front/resetAuthenticate" method="post">
						<input type="hidden" name="token" value="<%=token %>">
						<div class="form-group">
							<label class="control-label">ログインID</label>
							<input class="form-control" name="loginId" type="text">
						</div>
						<div class="form-group">
							<label class="control-label" for="exampleInputQuestion">秘密の質問</label>
							<input type="hidden" name="token" value="<%=token %>">
							<select class="form-control"  name="questionNo">
								<option value="1" selected="true">あなたの出身地は？</option>
								<option value="2">母親の旧姓は？</option>
								<option value="3">好きな動物は？</option>
								<option value="4">学生時代に所属していた部活動は？</option>
								<option value="5">初めて飼ったペットの名前は？</option>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">回答</label>
							<input class="form-control" type="text" name="questionAnswer">
						</div>

						<button type="submit" class="btn btn-default pull-right">パスワードリセット</button>
					</form>
				</div>
			</div><!--end row-->
		</div><!--end container-->
		<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
	</body>
</html>
