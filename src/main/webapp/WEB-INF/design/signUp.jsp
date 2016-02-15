<%@ page
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- saved from url=(0069)file:///C:/GitHub/TeraNavi/src/main/webapp/WEB-INF/design/signUp.html -->
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="utf-8">
	<title>新規登録</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="./signUp_files/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="./signUp_files/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
	<script src="./signUp_files/jquery.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="./signUp_files/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	<link href="./signUp_files/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="./signUp_files/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%-- ヘッダー部分のHTMLを読み込み --%>
	<jsp:include page="/WEB-INF/jsp/header.jsp"/>

	<div class="section">
		<div class="container">
			<div class="row">
				<h1>新規登録</h1>
				<form action="front/signup" method="post" class="text-center">
				<!-- ここから -->
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="pull-left control-label" for="name">お名前</label>
						<input type="text" name="userName" placeholder="田中太郎" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
				<!-- ここまででひとつのインプットを構成する -->
				</form>
			</div><!--end of row-->

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="furi">ふりがな</label>
						<input type="text" name="nameKana" placeholder="たなかたろう" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="sex">性別</label>
						男性<input type="radio" name="sex" value="m">
						女性<input type="radio" name="sex" value="f">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="birthday">生年月日</label>
						<input type="date" name="birthDate" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mail">メールアドレス</label>
						<input type="mail" name="mailAddress" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="mail">メールアドレス確認</label>
						<input type="mail" name="mailAddress" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="login">ログインID</label>
						<input type="text" name="loginId" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="pass">パスワード</label>
						<input type="password" name="password" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="pass">パスワード確認</label>
						<input type="password" name="password" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="question">秘密の質問</label>
						<select name="questionId" class="form-control">
							<option value="1">質問1</option>
							<option value="2">質問2</option>
						</select>
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="answer">回答</label>
						<input type="text" name="questionAnswer" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="key">登録キーを入力してください</label>
						<input type="signUpKey" class="form-control">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

			<input type="hidden" name="adminFlag" value="0">
            <button type="button" class="btn btn-primary" id="signsubmit" data-toggle="modal" data-target="#signup-modal">確認</button>
			</div>
		</form>

		<!-- モーダルウィンドウの中身 -->
        <div class="fade modal text-justify" id="signup-modal">
        	<div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
            	  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title">新規登録</h4>
                </div>

				<div class="modal-body">
					<div class="col-xs-1"></div>
                    <div class="col-xs-10">
                        <h2 id="sName"></h2>
                        <h2 id="sKana"></h2>
                        <h2 id="sSex"></h2>
                        <h2 id="sBirth"></h2>
                        <h2 id="sMail"></h2>
                        <h2 id="sId"></h2>
                        <h2 id="sPass"></h2>
                        <h2 id="sQuestion"></h2>
                        <h2 id="sAnswer"></h2>
                        <h2 id="sKey"></h2>
                        <p></p>
                    </div>
                </div>

				<div class="modal-footer">
                	<button type="submit" class="btn btn-block btn-primary" form="">登録</button>
                    <button type="submit" class="btn btn-block btn-primary" data-dismiss="modal">キャンセル</button>
                </div>
              </div>
            </div>
         </div>
          <!-- モーダル閉じるやつだよ -->
	  </div>

	  <jsp:include page="/WEB-INF/jsp/footer.jsp"/>
	  <script>
	  	$(#signsubmit).on("click", function() {
	  		$("sName").append($("#name").val());
	  		$("sKana").append($("#furi").val());
	  		$("sSex").append($("#sex").val());
	  		$("sBirth").append($("#birth").val());
	  		$("sMail").append($("#mail").val());
	  		$("sId").append($("#id").val());
	  		$("sPass").append($("#pass").val());
	  		$("sQuestion").append($("#question").val());
	  		$("sAnswer").append($("#answer").val());
	  		$("sKey").append($("#key").val());
	  	});
	  </script>
</body>
</html>
