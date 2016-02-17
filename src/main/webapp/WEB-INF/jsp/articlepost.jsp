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

    <style>
        body {
        padding-top: 20px;
        }
        span.icon-button {
        padding-left: 38px;
        }
        span.dl-zip {
        background: transparent url(./images/zip-icon.png) 0px 50% no-repeat;
        }
        span.dl-targz {
        background: transparent url(./images/tar-gz-icon.png) 0px 50% no-repeat;
        }
        span.view-github {
        background: transparent url(./images/octocat-icon.png) 0px 50% no-repeat;
        }
        select.form-control {
        width: auto;
        display: inline;
        }
        .wysiwyg-editor {
        width: auto;
        height: 450px;
        border: 1px solid #ccc;
        overflow: scroll;
        border-radius: 4px;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: .5em;
        }
        div.enclose {
        padding: 5px;
        border: dashed 2px #000;
        border-radius: 4px;
        }
    </style>

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
                   <li class="active">
                     <a href="#">記事を書く</a>
                   </li>
                   <li>
                     <a href="/TeraNavi/front/showDraftArticleList?writeUserId=${sessionScope.loginUser.id}">下書き一覧</a>
                   </li>
                   <c:choose>
                       <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                           <li>
                               <a href="/TeraNavi/blogSetting">ブログ設定</a>
                           </li>
                       </c:when>
                       <c:otherwise>
                           <li class="active">
                               <a href="/TeraNavi/blogSetting">ブログ開設</a>
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
                     <a href="/TeraNavi/withdraw">退会</a>
                   </li>
                 </ul>
                </div>


                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div calss="col-md-8">

                    <form action="/TeraNavi/front/articlepost" method="post" id="articleForm" role="form">
                        <div class="form-group">
                            <div class="input-group">
                                <label class="control-label">タイトル</label>
                                <input type="text" name="title" class="form-control">
                            </div>
                        </div>
                        <!--<div class="form-group">
                            <input type="hidden" name="body" value="xxx" id="sendBody" class="form-control">
                        </div>-->
                    </form>
                    <br>

                    <label class="control-label">内容</label>
                    <div data-wg-role="editor">
                        <select class="form-control" data-wg-role="menu-group">
                          <option data-wg-role="menu-item" data-wg-command="unformat">標準</option>
                          <option data-wg-role="menu-item" data-wg-command="header1">見出し1</option>
                          <option data-wg-role="menu-item" data-wg-command="header2">見出し2</option>
                          <option data-wg-role="menu-item" data-wg-command="header3">見出し3</option>
                          <option data-wg-role="menu-item" data-wg-command="header4">見出し4</option>
                          <option data-wg-role="menu-item" data-wg-command="header5">見出し5</option>
                          <option data-wg-role="menu-item" data-wg-command="header6">見出し6</option>
                        </select>

                        <select class="form-control" data-wg-role="menu-group">
                          <option data-wg-role="menu-item" data-wg-command="fontSize" data-wg-value="6">フォントサイズ:大</option>
                          <option data-wg-role="menu-item" data-wg-command="fontSize" data-wg-value="3">フォントサイズ:中</option>
                          <option data-wg-role="menu-item" data-wg-command="fontSize" data-wg-value="1">フォントサイズ:小</option>
                        </select>

                        <select class="form-control" data-wg-role="menu-group">
                          <option data-wg-role="menu-item" data-wg-command="fontColor" data-wg-value="black" style="color:black;">A</option>
                          <option data-wg-role="menu-item" data-wg-command="fontColor" data-wg-value="red" style="color:red;">A</option>
                          <option data-wg-role="menu-item" data-wg-command="fontColor" data-wg-value="blue" style="color:blue;">A</option>
                          <option data-wg-role="menu-item" data-wg-command="fontColor" data-wg-value="yellow" style="color:yellow;">A</option>
                        </select>
                        <button type="button" class="btn btn-default" data-wg-role="menu-item" data-wg-command="bold">
                          <i class="fa fa-fw fa-lg fa-bold"></i>
                        </button>
                        <button type="button" class="btn btn-default" data-wg-role="menu-item" data-wg-command="underline">
                          <u>U</u>
                        </button>
                        <button type="button" class="btn btn-default" data-wg-role="menu-item" data-wg-command="ul">
                          <i class="fa fa-fw fa-lg fa-list-ul"></i>
                        </button>
                        <button type="button" class="btn btn-default" data-wg-role="menu-item" data-wg-command="blockquote">
                          引用
                        </button>
                        <!-- Button trigger link modal -->
                        <button class="btn btn-default" data-toggle="modal" data-target="#linkModal">
                          <i class="fa fa-fw fa-lg fa-link"></i>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="linkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">リンクの挿入</h4>
                              </div>
                              <div class="modal-body">
                                <input id="insert-url" class="form-control" type="text" value="" placeholder="URL"/>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal" data-wg-role="menu-item" data-wg-command="link" data-wg-input="insert-url">OK</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- Button trigger link modal -->
                        <button class="btn btn-default" data-toggle="modal" data-target="#imageModal">
                          <i class="fa fa-fw fa-lg fa-picture-o"></i>
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">画像の挿入</h4>
                              </div>
                              <div class="modal-body">
                                <input id="insert-image-url" class="form-control" type="text" value="" placeholder="Image URL"/>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal" data-wg-role="menu-item" data-wg-command="image" data-wg-input="insert-image-url">OK</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="wysiwyg-editor" data-wg-role="wysiwyg" id="inputBody">
                        </div><!-- end wysiwyg-editor -->
                    </div><!-- end editor -->

                    <button type="button" class="btn btn-warning pull-right" id="btn">投稿</button>


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

            $("#btn").on("click",function(){
                $('<input />').attr('type', 'hidden')
                .attr('name', "body")
                .attr('value', $("#inputBody").html())
                .appendTo('#articleForm');
                $('#articleForm').submit();
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
