	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<meta charset="UTF-8">
			<title>登録結果</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
			<script src="https://malsup.github.io/jquery.blockUI.js"></script>

			<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		</head>
		<body>

			<script>
				$.blockUI({
					fadeIn: 500,
					timeout: 1000,
					onBlock: function () {
						location.href = "/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}";
					}
				});


			</script>
		</body>
	</html>
