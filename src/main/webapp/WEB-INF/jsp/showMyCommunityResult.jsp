<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>コミュニティ管理</title>
    <!-- Latest compiled and minified CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="/TeraNavi/js/bootstrap.js"></script>
        <script type="text/javascript" src="/TeraNavi/js/community.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">
        <jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
        <style>
            .modal-open {
                overflow: auto;
            }
            .modal-close {
                overflow: auto;
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

                <div class="col-md-2 hidden-xs">
                    <jsp:include page="/WEB-INF/jsp/mypagenav.jsp"/>
                    <script>
                      $("#commMgrTab").attr("class","active");
                    </script>
                </div>
                <!--モバイル用のドロップダウンメニュー-->
                <div class="container visible-xs">
                    <div class="dropdown">
                        <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">コミュニティ管理<span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li id="mypageTab">
                                <a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a>
                            </li>
                            <li>
                                <a href="/TeraNavi/articlepost">記事を書く</a>
                            </li>
                            <li>
                                <a href="/TeraNavi/front/showArticleList?writeUserId=${sessionScope.loginUser.id}">投稿記事一覧</a>
                            </li>
                            <li>
                                <a href="/TeraNavi/front/showDraftArticleList">下書き一覧</a>
                            </li>
                            <c:choose>
                                <c:when test="${sessionScope.loginUser.blogStatus eq 1}">
                                    <li>
                                        <a href="/TeraNavi/front/showBlog?edit=true&bloguserId=${sessionScope.loginUser.id}">ブログ設定</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="/TeraNavi/blogSetting">ブログ開設</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
							<li>
                                <a href="/TeraNavi/front/showDmList">DM</a>
                            </li>
                            <br><br>
                            <li>
                                <a href="/TeraNavi/withdraw">退会</a>
                            </li>


                        </ul>
                    </div>
                    <a class="btn btn-warning btn-block visible-xs" href="/TeraNavi/createcomm" role="button" style="margin-top: 60px">コミュニティ作成</a>
                </div>

                <!-- 残り8列はコンテンツ表示部分として使う -->
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1 col-xs-12">
        			        <a class="btn btn-warning btn-lg hidden-xs" href="/TeraNavi/createcomm" role="button" style="margin-left: 80%;">コミュニティ作成</a>
                        </div>
            		</div>

                    <h1 class="text-warning">作成したコミュニティ</h1>
                    <table class="table table-striped">
                        <tbody>
                            <c:forEach var="community" items="${result.list}">
                                <c:if test="${community.adminFlag eq 1}">
                                    <tr id="tableRow${community.id}">
                                        <td class="col-md-1 col-xs-1">
                                            <img src="${community.iconPath}" class="img-thumbnail" style="width:50px;height:50px;">
                                        </td>
                                        <td class="col-md-7 col-xs-7"><a href="/TeraNavi/front/showcomm?commId=${community.id}"><p class="text-muted">${community.name}</p></td>
                                        <td class="col-md-1 col-xs-1">
                                            <c:if test="${sessionScope.loginUser.id eq result.user.id}">
                                                <a class="btn btn-default" href="/TeraNavi/front/showcomm?commId=${community.id}&edit=true">編集</button>
                                            </c:if>
                                        </td>
                                        <td class="col-md-1 col-xs-1">
                                            <c:if test="${sessionScope.loginUser.id eq result.user.id}">
                                                <div class="edit">
                                                    <button type="button" class="btn btn-danger deleteConfirm" value="${community.id}">削除</button>
                                                </div>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:set var="commAdminFlag" value="false"/>
                    <c:forEach var="comm" items="${result.list}">
                        <c:choose>
                            <c:when test="${comm.adminFlag eq 1}">
                                <c:set var="commAdminFlag" value="true"/>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${commAdminFlag eq false}">
                        <p class="text-center">まだコミュニティを作成していません</p>
                    </c:if>

                    <hr>

                    <h1 class="text-warning">参加中のコミュニティ</h1>
                    <table class="table table-striped">
                        <tbody>
                            <c:forEach var="community2" items="${result.list}">
                                <c:if test="${community2.adminFlag ne 1}">
                                    <tr id="tableRow${community2.id}">
                                        <td>
                                            <img src="${community2.iconPath}" class="img-thumbnail" style="width:50px;height:50px;">
                                        </td>
                                        <td><a href="/TeraNavi/front/showcomm?commId=${community2.id}"><p class="text-muted">${community2.name}</p></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${sessionScope.loginUser.id eq result.user.id}">
                                                    <button type="button" class="btn btn-danger btn_withDraw" value="${community2.id}">退会</button>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${fn:length(result.list) <= 0}">
                        <p class="text-center">まだコミュニティに参加していません</p>
                    </c:if>
                </div>
            </div>
        </div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    	<!-- 退会確認モーダル -->
    	<div class="fade modal text-justify" id="withDrawModal">
    		<div class="modal-dialog">
    		  <div class="modal-content">
    			<div class="modal-header">
    			  <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
    				<span aria-hidden="true">×</span>
    			  </button>
    			　<h4 class="modal-title text-center">確認</h4>
    			 </div>
    			<div class="modal-body">
    				<p class="text-center">本当に退会しますか？</p>
    			</div>
    			<div class="modal-footer">
    				<button type="submit" class="btn btn-block btn-danger" id="btn_modalWithDraw" data-dismiss="modal">退会</button>
    				<button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
    			</div>
    		  </div>
    		</div>
    	 </div>

    	 <!-- 退会結果モーダル -->
    	  <div class="modal fade" id="withDrawResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
    		  <div class="modal-content">
    			<div class="modal-header">
    			  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">閉じる</span></button>
    			  <h4 class="modal-title text-center" id="withDrawResultModalLabel">退会結果</h4>
    			</div>
    			<div class="modal-body">
    			  <p id="withDrawResultMessage" class="text-center">退会しました。</p>
    			</div>
    			<div class="modal-footer">
    			  <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
    			</div>
    		  </div><!-- /.modal-content -->
    		</div><!-- /.modal-dialog -->
    	  </div><!-- /.modal -->

          <!-- コミュ削除確認モーダル -->
          <div class="fade modal text-justify" id="deleteCommModal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">×</span>
                    </button>
                  　<h4 class="modal-title text-center">確認</h4>
                   </div>
                  <div class="modal-body">
                      <p class="text-center">本当に削除しますか？</p>
                  </div>
                  <div class="modal-footer">
                      <button type="submit" class="btn btn-block btn-danger" id="btn_delete" data-dismiss="modal">削除</button>
                      <button type="button" class="btn btn-block btn-default" data-dismiss="modal">キャンセル</button>
                  </div>
                </div>
              </div>
           </div>

           <!-- コミュ削除結果モーダル -->
            <div class="modal fade" id="deleteResultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">閉じる</span></button>
                  </div>
                  <div class="modal-body">
                    <p id="deleteResultMessage" class="text-center">削除しました。</p>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </body>
</html>
