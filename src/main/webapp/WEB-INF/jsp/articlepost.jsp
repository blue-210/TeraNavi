<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>

    <meta charset="UTF-8">

    <title>記事を書く</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="/TeraNavi/js/wysiwyger.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/TeraNavi/js/fileup.js"></script>
    <script src="/TeraNavi/js/ckeditor/ckeditor.js"></script>
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
                    <jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
                    <script>
                      $("#articlePostTab").attr("class","active");
                    </script>
                </div>


                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div calss="col-md-8">

                    <form action="/TeraNavi/front/articlepost" method="post" id="articleForm" role="form">
                        <div class="form-group">
                            <div class="input-group col-md-8">
                                <label class="control-label">タイトル</label>
                                <input type="text" name="title" class="form-control" id="inputTitle" value="${result.article.title}">
                            </div>
                            <br>
                            <div class="input-group col-md-8">
                                <label class="control-label">内容</label>
                                <textarea class="ckeditor" id="inputBody" name="body">${result.article.articleBody}</textarea>
                            </div>
                        </div>

                    </form>
                    <br>

                    <div="row">
                        <div class="col-md-4 col-md-offset-2">
                            <button type="button" class="btn btn-default pull-right" id="btn_preview">プレビュー</button>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-default pull-right" id="btn_draft">下書き保存</button>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-warning pull-right" id="btn_post">投稿</button>
                        </div>
                    </div>

                    <form action="/TeraNavi/front/draftArticle" method="post" id="draftForm">
                        <input type="hidden" name="title" value="" id="draftTitle">
                        <input type="hidden" name="body" value="" id="draftBody">
                    <form>

                    <br>
                    <h1>記事投稿ページ</h1>
                    <form action="/TeraNavi/front/articlepost" method="post">
                        タイトル <input type="text" name="title"><br>
                        内容 <textarea id="tbody" name="body" rows="4" cols="40" ondrop="onDrop(event)" ondragover="onDragOver(event)"></textarea><br>
                        <input type="submit" value="投稿">
                    </form>

                    <h1>下書き</h1>
                    <form action="/TeraNavi/front/draftArticle" method="post">
                        タイトル <input type="text" name="title"><br>
                        内容 <textarea id="tbody" name="body" rows="4" cols="40" ondrop="onDrop(event)" ondragover="onDragOver(event)"></textarea><br>
                        <input type="submit" value="投稿">
                    </form>

                </div><!-- end col-8コンテンツ -->

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

            $("#btn_post").on("click",function(){
                $('<input />').attr('type', 'hidden')
                .attr('name', "body")
                .attr('value', $("#inputBody").html())
                .appendTo('#articleForm');
                $('#articleForm').submit();
            });

            $("#btn_draft").on("click",function(){
                $("#draftTitle").attr('value', $(':text[name="inputTitle"]').val())
                $("#draftBody").attr('value', $("#inputBody").html())
                $('#draftForm').submit();
            });

            $("#btn_preview").on("click",function(){
                alert($(':text[name="inputTitle"]').val());
            });

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
