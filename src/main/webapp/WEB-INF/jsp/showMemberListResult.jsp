<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>コミュニティメンバー</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/fileup.js"></script>



</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

    <div class="container">
       <div class="row">
           <p><button id="dd">権限付与</button></p>
           <form action="commGra" method="post">
               <thead>

                   <c:forEach var="member" items="${result.members}">

                       <tr>
                         <th>

                           <c:out value="${member.iconPath}" /><br>
                           <c:out value="${member.userName}"/><br>
                           <input type="hidden" name="targetNo" value="${member.id}">
                               <input type="hidden" name="communityId" value="${result.value}">
                           <div class="check"></div>
                        </th>
                       </tr>
                   </c:forEach>
                </thead>
                <p id="sub"></p>
            </form>

               </tbody>
           </table>
       </div><!--end row-->
    </div><!--end container-->
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
    <script>
        $("#dd").click(function(){
            $('.check').append('<input type="checkbox">');
            $('#sub').append('<input type="submit" value="確定">');
        });
    </script>




</body>
</html>
