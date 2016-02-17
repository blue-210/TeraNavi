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
                     <a href="/TeraNavi/front/showDraftArticleList?writeUserId=${sessionScope.loginUser.id}">下書き一覧</a>
                   </li>
                   <c:choose>
                       <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                           <li class="active">
                               <a href="#blogsetting">ブログ設定</a>
                           </li>
                       </c:when>
                       <c:otherwise>
                           <li class="active">
                               <a href="#blogsetting">ブログ開設</a>
                           </li>
                       </c:otherwise>
                   </c:choose>
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
                    <c:choose>
                        <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                            <h1>ブログ設定</h1>
                            <form id="blogSetting" action="front/blogSetting" method="post">
                                <input id="status" type="hidden" name="status" value="1">
                        </c:when>
                        <c:otherwise>
                            <h1>ブログ開設</h1>
                            <form id="blogCreate" action="front/blogCreate" method="post">
                                <input id="status" type="hidden" name="status" value="0">
                        </c:otherwise>
                    </c:choose>


                           <div class="col-xs-1"></div>
                           <div class="col-xs-4">
                               タイトル<input type="text" name="title" class="form-control" id="bodyTitle"><br>
                               説明文<textarea rows="3" class="form-control" name="explanation" id="bodyExplanation"></textarea><br>
                               <div class="col-md-12 text-left">
                                 <img id="preHeader" src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                 width="50px" height="50px">
                               </div>
                               ヘッダー画像<input type='file' value="ファイル選択" id='blogHeaderFile' onchange="fileUpHeader();">
                               <input type="hidden" name="headerPath" id="headerPathHidden">
                               <div class="col-xs-3"></div>
                                <button class="btn btn-info" type="button" id="blogSubmit" data-toggle="modal">確認</button>
                            </div>
                       </form>
                   </div>
                   <!-- モーダルウィンドウの中身 -->
                   <div class="fade modal text-justify" id="blog-modal">
                       <div class="modal-dialog">
                         <div class="modal-content">
                           <div class="modal-header">
                             <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
                               <span aria-hidden="true">×</span>
                             </button>
                             <c:choose>
                                 <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                                     <h4 class="modal-title">ブログ設定</h4>
                                 </c:when>
                                 <c:otherwise>
                                     <h4 class="modal-title">ブログ開設</h4>
                                 </c:otherwise>
                             </c:choose>
                            </div>

                           <div class="modal-body">
                               <div class="col-xs-1"></div>
                               <div class="col-xs-10">
                                   <h2>タイトル</h2><h5 id="title"></h5>
                                   <h2>説明文</h2><h5 id="explanation"></h5>
                                   <h2>ヘッダー画像</h2><img src="http://pingendo.github.io/pingendo-bootstrap/assets/user_placeholder.png"
                                   class="img-rounded" width="200" height="150" id="blogHeader">
                                   <p></p>
                               </div>
                           </div>

                           <div class="modal-footer">
                               <c:choose>
                                   <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                                       <button type="submit" class="btn btn-block btn-primary" form="blogSetting">設定する</button>
                                   </c:when>
                                   <c:otherwise>
                                       <button type="submit" class="btn btn-block btn-primary" form="blogCreate">開設する</button>
                                   </c:otherwise>
                               </c:choose>


                               <button type="button" class="btn btn-block btn-primary" data-dismiss="modal">キャンセル</button>
                           </div>
                         </div>
                       </div>
                    </div>

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



        // 画像アップロード関連
        function fileUpHeader(){
			var files = document.getElementById("blogHeaderFile").files;

			for(var i = 0;i < files.length;i++){
				console.log("for");
				var f = files[i];
				var formData = new FormData();
				formData.append("file",f);
				ajaxSettings.data = formData;
				ajaxSettings.url = "/TeraNavi/upload/header";
				ajaxSettings.success = function(data){
					$("#headerPathHidden").val(data.result);
					$("#preHeader").attr("src",data.result);
				}

 				ajax = $.ajax(ajaxSettings);
			}
		}

        $("#blogSubmit").on("click", function() {
            $("#title").empty();
            $("#explanation").empty();
            $("#blogHeader").empty();


            $("#title").append($("#bodyTitle").val());
            $("#explanation").append($("#bodyExplanation").val());
            $("#blogHeader").attr("src",$("#headerPathHidden").val());

            $("#blog-modal").modal("show");
        });



 -->

	</script>

</body>
</html>
