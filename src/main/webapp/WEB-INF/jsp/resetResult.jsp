<%@ page
	contentType="text/html ; charset=UTF-8"
	pageEncoding="UTF-8"
	%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<meta charset="UTF-8">
			<title>変更結果</title>
			<meta name="viewport" content="width=device-width, initial-s<cale=1">
			<!-- Latest compiled and minified CSS -->
			<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

			<!-- Optional theme -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

			<!-- Latest compiled and minified JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<div class="container">
				<div class="row">
					<div class="hidden-xs">
						<h1>${result.userbean.userName}さんのパスワードを変更しました</h1>

						<p>
							新しいパスワードは[ ${result.userbean.password} ]です
						</p>
					</div>
					<div class="visible-xs">
						<h3>${result.userbean.userName}さんのパスワードを変更しました</h3>

						<h4>
							新しいパスワードは[ ${result.userbean.password} ]です
						</h4>
					</div>

				</div><!--end row-->
			</div><!--end container-->
			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
		</body>
	</html>
