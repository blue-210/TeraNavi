<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
   import="ttc.bean.ArticleBean"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>作成したコミュニティ</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/TeraNavi/css/comm.css">

</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>


	<input type="hidden" id="target" value="${result.target}">

    <div class="container">
        <div class="row">
            <div class="col-xs-10 col-xs-offset-1">
                <h1>作成したコミュニティ</h1>
                <c:forEach var="comm" items="${result.list}">
                    <c:if test="${comm.adminFlag eq 1}">
                        <!--<div class="deletable">
                            <form action="showcomm" method="post" name="showForm">
                                <input type="hidden" name="commId" value="${comm.id}">
                                <input type="submit" id="showCom" value="詳細へ"></input>
                            </form>
                        -->
                        <div class="col-xs-1">
                            <img src="${comm.iconPath}" id="topicIcon">
                        </div>
                        <div class="col-md-4">
                            <h4 id="title" class="text-left">
                                <a href="showcomm?commId=${comm.id}"><c:out value="${comm.name}" /></a>
                            </h4>
                        </div>
                        <div class="col-md-5">
                            <h4 id="title" class="text-left">
                                <c:out value="${comm.profile}" /></a>
                            </h4>
                        </div>

                        <!--
                        <p><c:out value="${comm.name}" /><c:out value="${comm.profile}"/><c:out value="${comm.countMember}"/></p>
                    -->
                        <div class="col-md-2">
                            <div class="edit">
                                <form action="commSetting" method="post" name="showDel">
                                    <input type="hidden" name="commId" value="${comm.id}">
                                    <input type="hidden" name="commName" value="${comm.name}">
                                    <input type="hidden" name="commProfile" value="${comm.profile}">
                                    <input type="hidden" name="headerPath" value="${comm.headerPath}">
                                    <input type="hidden" name="deleteFlag" value="${comm.deleteFlag}">
                                    <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
                                    <input type="hidden" name="del" value="del">
                                    <input type="submit" id="showDel" value="削除"></input>
                                </form>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>

            <div class="col-xs-10 col-xs-offset-1">
                <h1>参加しているコミュニティ</h1>
                <c:forEach var="comm2" items="${result.list}">
                    <c:if test="${comm2.adminFlag ne 1}">
                        <!--<div class="deletable">
                            <form action="showcomm" method="post" name="showForm">
                                <input type="hidden" name="commId" value="${comm2.id}">
                                <input type="submit" id="showCom" value="詳細へ"></input>
                            </form>
                        </div>
                        -->
                        <div class="col-md-1">
                            <img src="${comm2.iconPath}" id="topicIcon">
                        </div>
                        <div class="col-md-4">
                            <h4 id="title" class="text-left">
                                <a href="showcomm?commId=${comm2.id}"><c:out value="${comm2.name}" /></a>
                            </h4>
                        </div>
                        <div class="col-md-5">
                            <h4 id="title" class="text-left">
                                <c:out value="${comm2.profile}" /></a>
                            </h4>
                        </div>
                        <div class="col-md-2">
                            <form action="/TeraNavi/front/withDrawComm" method="post" name="showDel">
                                <input type="hidden" name="commId" value="${comm.id}">
                                <input type="hidden" name="commName" value="${comm.name}">
                                <input type="hidden" name="target" value="community_withdrawal_flag=1">
                                <input type="submit" id="showDel" value="退会"></input>
                            </form>
                        </div>

                        <!--
                        <p><c:out value="${comm2.name}" /><c:out value="${comm2.profile}"/><c:out value="${comm2.countMember}"/></p>
                        -->
                    </c:if>
                </c:forEach>
            </div>
        </div><!--end container-->
    </div><!--end row-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

	<!--<script>
		$(function(){
			var target = $("#target").val();
			if(target == "comm"){
				$(".edit").css("display","none");
			}
		});
	</script>
-->
</body>
</html>
