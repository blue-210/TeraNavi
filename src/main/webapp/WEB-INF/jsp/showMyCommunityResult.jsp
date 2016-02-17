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
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>


	<input type="hidden" id="target" value="${result.target}">
    <div class="container">
        <div class="row">
            <table class="table table-striped">
               <thead>
                   <tr>
                       <th class="deletable"></th>
                       <th>コミュニティ名</th>
                       <th>紹介文</th>
                       <th>メンバー数</th>
                   </tr>
               </thead>
               <tbody>
                   <h1>作成したコミュニティa</h1>
                   <c:forEach var="comm" items="${result.list}">
                       <tr>
                           <td class="deletable">
                               <form action="showcomm" method="post" name="showForm">
                                    <input type="hidden" name="commId" value="${comm.id}">
                                    <input type="submit" id="showCom" value="詳細へ"></input>
                                </form>
                           </td>
                           <td>
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
                           </td>
                           <td> <c:out value="${comm.name}" /> </td>
                           <td> <c:out value="${comm.profile}"/> </td>
                           <td> <c:out value="${comm.countMember}"/> </td>
                       </tr>
                   </c:forEach>
                   
                    <h1>参加しているコミュニティ</h1>
                        <c:forEach var="comm2" items="${result.list}">
                            <tr>
                            <c:if test="${comm.adminFlag ne 1}">
                                <td class="deletable">
                                    <form action="showcomm" method="post" name="showForm">
                                         <input type="hidden" name="commId" value="${comm.id}">
                                         <input type="submit" id="showCom" value="詳細へ"></input>
                                     </form>
                                </td>
                                <td> <c:out value="${comm2.name}" /> </td>
                                <td> <c:out value="${comm2.profile}"/> </td>
                                <td> <c:out value="${comm2.countMember}"/> </td>
                            </c:if>
                        </tr>
                    </c:forEach>
               </tbody>
           </table>
       </div><!--end row-->
    </div><!--end container-->
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
