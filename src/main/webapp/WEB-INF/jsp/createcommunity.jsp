
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>コミュニティ作成</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>


	<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">

</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="container">
       <div class="row">
           <h1>コミュニティ作成ページ</h1>
           <form action="front/createcomm" method="post">
                コミュニティ名<input type="text" name="commName"><br>
               説明文 <input type="text" name="commProfile"><br>
                コミュニティアイコン<input type="file" name="body" onchange="onDrop(event)"><br>
                <input class="tbody" type="hidden" name="commIcon">
               ヘッダ画像 <input type="file" name="date" onchange="onDrop(event)"><br>
               <input class="tbody" type="hidden" name="commHeader">
                   <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
               <input type="submit" value="登録">
           </form>
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
	<script>
		var ajaxSettings;
		var ajax;
		$(function(){

			ajaxSettings = {
				type:'post',
				url:'upload',
				processData:false,
				contentType:false,
				cache:false,
				dataType:'json',
				success:function(data){
					console.log("success");
					var text = $(".tbody").val();
					$(".tbody").val(text+"<br>"+data.result);
				}
			}

		});

		function onDrop(event){
			var files = event.dataTransfer.files;

			console.log("オンドロップ");

			for(var i = 0;i < files.length;i++){
				console.log("for");
				var f = files[i];
				var formData = new FormData();
				formData.append("file",f);
				ajaxSettings.data = formData;
				ajax = $.ajax(ajaxSettings);
			}

			event.preventDefault();
		}

		function onDragOver(event){
			event.preventDefault();
		}


	</script>
</body>
</html>
