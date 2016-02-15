<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>

    <meta charset="UTF-8">

    <title>マイページ</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>


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
                <div class="col-md-2">
                 <ul class="nav nav-pills nav-stacked well">
                   <li>
                     <a href="/TeraNavi/mypage">マイページ</a>
                   </li>
                   <li class="active">
                     <a href="/TeraNavi/articlepost">記事を書く</a>
                   </li>
                   <li>
                     <a href="/TeraNavi/front/showArticleList?userId=${sessionScope.loginUser.id}&flg=2">下書き一覧</a>
                   </li>
                   <li>
                     <a href="#blogsetting">ブログ設定</a>
                   </li>
                   <li>
                     <a href="#communitymanage">コミュニティ管理</a>
                   </li>
                   <li>
                     <a href="#directmessage">DM</a>
                   </li>
                   <br><br><br><br>
                   <li>
                     <a href="/TeraNavi/wirhdraw">退会</a>
                   </li>
                 </ul>
                </div>


                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div calss="col-md-8">
                    <h1>記事投稿ページ</h1>
                    <form action="front/articlepost" method="post">
                        タイトル <input type="text" name="title"><br>
                        内容 <textarea id="tbody" name="body" rows="4" cols="40" ondrop="onDrop(event)" ondragover="onDragOver(event)"></textarea><br>
                        <input type="submit" value="投稿">
                    </form>
                </div>


           </div><!--end row-->
        </div><!--end container-->
    </div><!--end section-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

	<script>
		<!-- var ajaxSettings;
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
					var text = $("#tbody").val();
					$("#tbody").val(text+"<br>"+data.result);
				}
			}

		});

		function onDrop(event){
			var files = event.dataTransfer.files;


			for(var i = 0;i < files.length;i++){

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
 -->

	</script>
</body>
</html>
