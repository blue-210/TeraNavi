<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">	</head>
		<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="/TeraNavi/css/chat.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="container-fluid">
			<div class="wrapper">
	            <div class="row">
					<div class="col-md-6">

					</div>
					<div class="col-md-1"></div>
					<div class="col-md-5">
			            <div class="box">
			            	<p id="content">君は実に馬鹿だなぁ馬鹿だなぁ君は実に馬鹿だなぁ</p>
					     </div>
					     <div id="account">
					     	<img src="/TeraNavi/img/account.jpg">
					     </div>
			        </div>
			        <div class="container-fluid">
						<div class="row">
							<div class="col-md-5">
								<div class="other_box">
					            	<p id="other_content">君は実に馬鹿だなぁ君は実に馬鹿だなぁ君は実に馬鹿だなぁ君は実に馬鹿だなぁ君は実に馬鹿だなぁ</p>
							     </div>
							     <div id="other_account">
							     	<img src="/TeraNavi/img/account.jpg">
							     </div>
							</div>
							<div class="col-md-1"></div>
							<div class="col-md-6"></div>
						</div>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-0"></div>
								<div class="col-md-11">
									<div id="dm_footer">
										<form action="#" method="post">
											<input type="text" name="content" size="100%"/>
										</form>
									</div>
								</div>
								<div class="col-md-1"><button type="submit">送信</button></div>
							</div>
						</div>
					</div>
		        </div>
			</div>
		</div>
	</body>
</html>
