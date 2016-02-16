<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ブログの設定</title>
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
                     <a href="/TeraNavi/front/mypage">マイページ</a>
                   </li>
                   <li>
                     <a href="/TeraNavi/articlepost">記事を書く</a>
                   </li>
                   <li>
                     <a href="/TeraNavi/front/showArticleList?userId=${sessionScope.loginUser.id}&flg=2">下書き一覧</a>
                   </li>
                   <li class="active">
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


                <div calss="col-md-8">

                       <h1>ブログ設定画面</h1>
                       <form action="front/blogSetting" method="post">
                           タイトル <input type="text" name="title"><br>
                           ヘッダ画像 <input id="head" type="text" name="headerPath"ondrop="onDrop1(event)" ondragover="onDragOver(event)"><br>
            			   説明文 <input type="text" name="explanation"><br>
            			   <input type="hidden" name="status" value="0">
                           <input type="submit" value="登録">
                       </form>

               </div>

           </div><!--end row-->
       </div><!--end container-->
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
				dataType:'json'

			};

		});

		function onDrop1(event){
			var files = event.dataTransfer.files;


			for(var i = 0;i < files.length;i++){
				var f = files[i];
				var formData = new FormData();
				formData.append("file",f);
				ajaxSettings.data = formData;
				ajaxSettings.success = function(data){
					var text = $("#head").val();
					$("#head").val(text+data.result);
				}
				ajax = $.ajax(ajaxSettings);
			}

			event.preventDefault();
		}

		function onDrop2(event){
			var files = event.dataTransfer.files;


			for(var i = 0;i < files.length;i++){
				var f = files[i];
				var formData = new FormData();
				formData.append("file",f);
				ajaxSettings.data = formData;
				ajaxSettings.success = function(data){
					var text = $("#head").val();
					$("#head").val(text+"<br>"+data.result);
				}
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
