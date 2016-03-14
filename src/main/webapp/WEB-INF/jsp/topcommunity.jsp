<div class="section">
    <div class="container">
		<div class="row col-md-10 col-md-offset-1 col-xs-12">
			<a class="btn btn-warning btn-lg hidden-xs" href="/TeraNavi/createcomm" role="button" style="margin-left: 80%;">コミュニティ作成</a>
			<a class="btn btn-warning btn-block visible-xs" href="/TeraNavi/createcomm" role="button" style="margin-top: 60px">コミュニティ作成</a>
			<h1 class="text-warning">人気コミュニティ</h1>
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



<<div class="section">
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
