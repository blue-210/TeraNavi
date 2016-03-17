<!DOCTYPE>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script type="text/javascript" src="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="https://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/TeraNavi/css/style.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/TeraNavi/css/navbar.css" type="text/css">
		<script type="text/javascript" src="/TeraNavi/js/footerFixed.js"></script>
		<script type="text/javascript" src="/TeraNavi/js/community.js"></script>
        <script type="text/javascript" src="/TeraNavi/js/topcommunity.js"></script>
		<jsp:include page="/WEB-INF/jsp/googleanalytics.jsp"/>
		<title>TeraNavi TOP</title>
	</head>
	<body>
        <%-- ヘッダー部分のHTMLを読み込み --%>
        <jsp:include page="/WEB-INF/jsp/header.jsp"/>

        <div class="section hidden-xs">
			<div class="container">
				<div class="row">
					<div class="col-xs-10 col-xs-offset-1">
						<ul class="lead nav nav-justified nav-tabs">
							<li>
								<a href="/TeraNavi/front/top" class="text-warning">TOP</a>
							</li>
							<li>
								<a href="/TeraNavi/front/topBlog" class="text-warning">ブログ</a>
							</li>
							<li class="active">
								<a href="/TeraNavi/front/topCommunity" class="text-warning">コミュニティ</a>
							</li>
							<li>
								<a href="/TeraNavi/front/topTag" class="text-warning">タグ</a>
							</li>
							<li>
								<a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}" class="text-warning">マイページ</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
        <div class="visible-xs xs-top-nav">
			<nav class="nav nav-horizontal">
				<div class="mask">
					<ul class="list">
						<li><a href="/TeraNavi/front/top">Top</a></li>
						<li><a href="/TeraNavi/front/topBlog">ブログ</a></li>
						<li><a href="/TeraNavi/front/topCommunity">コミュニティ</a></li>
						<li><a href="/TeraNavi/front/topTag">タグ</a></li>
						<li><a href="/TeraNavi/front/mypage?paramUserId=${sessionScope.loginUser.id}">マイページ</a></li>
					</ul>
				</div>
			</nav>
		</div>

            <div class="section">
                <div class="container">
            		<div class="row col-md-10 col-md-offset-1 col-xs-12">
            			<a class="btn btn-warning btn-lg hidden-xs" href="/TeraNavi/createcomm" role="button" style="margin-left: 80%;">コミュニティ作成</a>
            			<a class="btn btn-warning btn-block visible-xs" href="/TeraNavi/createcomm" role="button" style="margin-top: 60px">コミュニティ作成</a>
            			<h1 class="text-warning">人気コミュニティ</h1>
            		</div>
                    <div id="topcommunity">

                    </div>
            		<div class="row col-md-12 col-xs-12">
                        <c:forEach var="community" items="${result.popularCommunity}" varStatus="status">

            				<div class="row col-md-10 col-xs-10 col-xs-offset-1 well mobile-content-space">
            					<div class="col-md-2 col-xs-12">
            						<br>
            						<div class="hidden-xs">
            							<img src="${community.iconPath}" class="img-thumbnail" style="width:120px; height:120px;">
            						</div>
            						<div class="visible-xs">
            							<img src="${community.iconPath}" class="img-thumbnail" style="width:120px; height:120px;">
            						</div>
            					</div>
            					<div class="col-md-7 col-xs-12">
            						<div class="hidden-xs">
            							<a href="/TeraNavi/front/showcomm?commId=${community.id}">
            								<h3 class="text-center text-muted">${community.name}</h3>
            							</a>
            							<p class="text-center">${community.profile}</p>
            						</div>
            						<div class="visible-xs">
            							<a href="/TeraNavi/front/showcomm?commId=${community.id}">
                                            <h5 class="text-center text-muted mobile-community-title">${community.name}</h5>
                                        </a>
                                        <p class="text-center">${community.profile}</p>
            						</div>
            					</div>

            					<%-- ログインしている場合 --%>
            					<c:if test="${not empty sessionScope.loginUser.id}">
            						<c:choose>
            							<%-- どのコミュニティにも参加していない場合 --%>
            							<c:when test="${empty sessionScope.myCommunities}">
            								<div class="col-md-1 col-xs-12 text-center">
            									<button type="button" class="btn btn-warning communityBtn" value="${community.id}">参加する</button>
            								</div>
            							</c:when>
            							<c:otherwise>
            								<%-- あるコミュニティに参加しているかどうかの判定フラグ --%>
            								<c:set var="flag" value="false"/>
            								<%-- sessionにある参加しているコミュニティのリストを使って比較 --%>
            								<c:forEach var="co" items="${sessionScope.myCommunities}">
            									<c:choose>
            										<%-- co.idは自分が参加しているコミュ、community.idは比較対象となるコミュ --%>
            										<c:when test="${co.id eq community.id}">
            											<%-- 参加していればtrueに --%>
            											<c:set var="flag" value="true"/>
            										</c:when>
            									</c:choose>
            								</c:forEach>
            								<%-- 参加していない場合ボタンを表示 --%>
            								<c:choose>
            									<c:when test="${flag eq 'false'}">
            										<div class="col-md-1 col-xs-12 text-center">
            											<button type="button" class="btn btn-warning communityBtn" value="${community.id}">参加する</button>
            										</div>
            									</c:when>
            									<%-- 参加している場合 --%>
            									<c:otherwise>
            										<div class="col-md-1 col-xs-12 text-center">
            											<button  type="buton" class="btn btn-warning communityBtn" disabled>参加中</button>
            										</div>
            									</c:otherwise>
            								</c:choose>
            							</c:otherwise>
            						</c:choose>
            					</c:if>
            				</div>
            			</c:forEach>
            		</div><!--コミュニティ一件の領域おわり-->
            	</div>
            </div>



            <div class="section">
                <div class="container">
            		<div class="row col-md-10 col-md-offset-1 col-xs-12">
            			<h1 class="text-warning">新着コミュニティ</h1>
            		</div>
            		<div class="row col-md-12 col-xs-12">
                        <c:forEach var="community" items="${result.hotCommunity}" varStatus="status">

            				<div class="row col-md-10 col-xs-10 col-xs-offset-1 well mobile-content-space">
            					<div class="col-md-2 col-xs-12">
            						<br>
            						<div class="hidden-xs">
            							<img src="${community.iconPath}" class="img-thumbnail" style="width:120px; height:120px;">
            						</div>
            						<div class="visible-xs">
            							<img src="${community.iconPath}" class="img-thumbnail" style="width:120px; height:120px;">
            						</div>
            					</div>
            					<div class="col-md-7 col-xs-12">
            						<div class="hidden-xs">
            							<a href="/TeraNavi/front/showcomm?commId=${community.id}">
            								<h3 class="text-center text-muted">${community.name}</h3>
            							</a>
            							<p class="text-center">${community.profile}</p>

            						</div>
            						<div class="visible-xs">
            							<a href="/TeraNavi/front/showcomm?commId=${community.id}">
            								<h3 class="text-center text-muted">${community.name}</h3>
            							</a>
            							<p class="text-center">${community.profile}</p>
            						</div>
            					</div>

            					<%-- ログインしている場合 --%>
            					<c:if test="${not empty sessionScope.loginUser.id}">
            						<c:choose>
            							<%-- どのコミュニティにも参加していない場合 --%>
            							<c:when test="${empty sessionScope.myCommunities}">
            								<div class="col-md-1 text-center">
                                                <button type="button" class="btn btn-warning communityBtn" value="${community.id}">参加する</button>
            							    </div>
            							</c:when>
            							<c:otherwise>
            								<%-- あるコミュニティに参加しているかどうかの判定フラグ --%>
            								<c:set var="flag" value="false"/>
            								<%-- sessionにある参加しているコミュニティのリストを使って比較 --%>
            								<c:forEach var="co" items="${sessionScope.myCommunities}">
            									<c:choose>
            										<%-- co.idは自分が参加しているコミュ、community.idは比較対象となるコミュ --%>
            										<c:when test="${co.id eq community.id}">
            											<%-- 参加していればtrueに --%>
            											<c:set var="flag" value="true"/>
            										</c:when>
            									</c:choose>
            								</c:forEach>
            								<%-- 参加していない場合ボタンを表示 --%>
                                            <c:choose>
            									<c:when test="${flag eq 'false'}">
            										<div class="col-md-1 col-xs-12 text-center">
            											<button type="button" class="btn btn-warning communityBtn" value="${community.id}">参加する</button>
            										</div>
            									</c:when>
            									<%-- 参加している場合 --%>
            									<c:otherwise>
            										<div class="col-md-1 col-xs-12 text-center">
            											<button  type="buton" class="btn btn-warning communityBtn" disabled>参加中</button>
            										</div>
            									</c:otherwise>
            								</c:choose>
            							</c:otherwise>
            						</c:choose>
            					</c:if>
            				</div>
            			</c:forEach>
            		</div><!--コミュニティ一件の領域おわり-->
            	</div>
            </div>
            <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

    		<script>

    			$(document).ready(function () {

    			//記事本文のHTMLタグ除去-----------------------------------------------------
    				var size = $("#topArticlesSize").val();
    				for(var i=0; i<size; i++){
    					var str = $("#top"+i).text();
    					var body = str.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'');
    					$("#top"+i).text(body.substr(0,30));//30文字分かえす
    				}

    				size = $("#blogArticlesSize").val();
    				for(var i=0; i<size; i++){
    					var str = $("#blog"+i).text();
    					var body = str.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'');
    					$("#blog"+i).text(body.substr(0,30));//30文字分かえす
    				}

    				var tagArticleCount = $("#tagArticleCount").val();
    				console.log("tagArticleCount"+tagArticleCount);
    				for(var i=0; i<tagArticleCount; i++){
    					size = $("#tagArticlesSize"+i).val();
    					for(var j=0; j<size; j++){
    						var str = $("#"+i+"tag"+j).text();
    						var body = str.replace(/<("[^"]*"|'[^']*'|[^'">])*>/g,'');
    						$("#"+i+"tag"+j).text(body.substr(0,30));//30文字分かえす
    					}
    				}
    			//--------------------------------------------------------------------------


    				// #(ハッシュ)指定されたタブを表示する
    				var hashTabName = document.location.hash;
    				if (hashTabName) {
    					$('.nav-tabs a[href=' + hashTabName + ']').tab('show');

    					event.preventDefault();

    					// // 所定の位置までスクロールする
    					// var tabParent = $("#" + $('.nav-tabs a[href=' + hashTabName + ']').parents('div').attr('id'));
    					// $('html, body').stop().animate({
    					// 	scrollTop: 0
    					// }, 2000);
    				}

    			});
    		</script>

    		<!-- 確認モーダル -->
    		<div class="fade modal text-justify" id="partiCommModal">
    			<div class="modal-dialog">
    			  <div class="modal-content">
    				<div class="modal-header">
    				  <button type="button" class="close pull-right[]" data-dismiss="modal" aria-label="Close">
    					<span aria-hidden="true">×</span>
    				  </button>
    				　<h4 class="modal-title text-center">確認</h4>
    				 </div>
    				<div class="modal-body">
    					<p id="joinResultMessage" class="text-center">参加中...</p>
    				</div>
    				<div class="modal-footer"></div>
    			  </div>
    			</div>
    		 </div>
    	</body>
    </html>
