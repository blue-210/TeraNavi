<%@ page
	contentType="text/html ; charset=UTF-8"
	pageEncoding="UTF-8"
	%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!DOCTYPE html>
	<html lang="ja">
		<head>
			<meta charset="UTF-8">
			<title>よくある質問</title>
			<!-- Latest compiled and minified CSS -->
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
			<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
			<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" href="/TeraNavi/css/style.css" type="text/css">
			<link href="/TeraNavi/css/help.css" rel="stylesheet" type="text/css">


		</head>
		<body>
			<%-- ヘッダー部分のHTMLを読み込み --%>
			<jsp:include page="/WEB-INF/jsp/header.jsp"/>

			<h1 class="hidden-xs">テストデータです、本番環境への移行前に書き換えてください</h1>
			
			
			<div class="section hidden-xs">
				<div class="container">
					<div class="row">
						<div class="col-md-10">
							<h1>よくある質問</h1>
						</div>
					</div>
				</div>
			</div>

			<div class="visible-xs col-xs-10">
				<h2>よくある質問</h2>
			</div>

			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-xs-12">

							<div id="main">
								<div class="help-content">
									<!--よくある質問一件分のコンテンツ-->
									<div class="help-title">
										<!--タイトルを記述するタグ-->
										・Facebookではどんな名前が認められますか。
									</div>
									<p class="help-body">
										<!--本文を記述するタグ-->
										Facebookは、利用者同士が実名を使って交流するコミュニティです。<br>すべての利用者に、実生活で使用している名前での登録をお願いしています。これにより、誰もが快適な環境で交流することができます。これは、コミュニティの安全を維持するのに役立っています。<br><br>

										名前に次のものは使用できません。<br><br>

										記号、数字、不要な大文字、繰返し文字、句読点<br>
										複数の文字種<br>
										あらゆる種類の肩書き(職業上、宗教上など)<br>
										ミドルネームに代わる語句またはフレーズ<br>
										あらゆる種類の不快または露骨な語句<br>
										また、次の点にもご留意ください。<br><br>

										使用する名前は、実生活で友達があなたを呼ぶときに使用し、Facebookで認められる形式の身分証明書に記載されている名前である必要があります。<br>
										ニックネームは、実名のバリエーションである場合に限り認められます(ロバートのかわりにボブなど)。<br>
										アカウントに別の名前(旧姓、ニックネーム、事業で使用している名称など)を追加できます。<br>
										プロフィールは、個人としてのみ利用できます。公人、団体、企業等の場合はFacebookページをご利用ください。<br>
										他人や関連のない団体等を名乗ることは禁じられています。<br>
										アカウントに実名が表示されていない場合は、名前を変更してください。変更できない場合は、こちらをご覧ください。<br>
									</p>
									
								</div>

								<div class="help-content">
									<div class="help-title">・ログインできない古いアカウントを削除または再開するにはどうすればよいですか。</div>
									<p class="help-body">古いアカウントを報告する、または再開のサポートを得るには:<br><br>

										アカウントのプロフィールの右上にある  をクリックします。<br>
										[報告またはブロック]をクリックします。<br>
										[私の以前のプロフィールです]を選択し、オプションを選びます。<br>
										[不正アクセスされたアカウントの再開を依頼します]を選択すると、現在のアカウントから自動的にログアウトし、不正アクセスされたアカウントを再開する手順が示されます。<br>
										[このアカウントを閉鎖します]を選択すると、Facebookでプロフィールを調査して、あなたの古いアカウントであることが確認できたら、利用停止の処理を行います。<br>
										詳しくは、不正アクセスされたアカウントやFacebookへの報告をご覧ください。<br><br>

										注: [私の以前のプロフィールです]オプションは、問題のアカウントと友達としてつながっていない場合にのみ利用できます。古いアカウントと友達になっている場合は、先に友達から削除する必要があります。<br>
									</p>
									
								</div>
								

							</div>
						</div>
					</div>
				</div>
			</div>


			<jsp:include page="/WEB-INF/jsp/footer.jsp"/>


		</body>
	</html>
