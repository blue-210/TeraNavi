<nav id="footer" class="navbar navbar-default" role="navigation">
   <footer class="footer container-fluid">
      <div class="container">
         <ul class="nav nav-pills nav-stacked list-inline">
            <li><h2>TeraNaviについて</h2></li>
            <li><a href="/TeraNavi/showRule">利用規約</a></li>
            <li><a data-toggle="modal" href="#contact-modal">お問い合わせ</a></li>
            <li><a href="">よくある質問</a></li>
         </ul>
         <ul class="nav nav-pills nav-stacked text-center">
             <li><h2>運営元について</h2></li>
             <li><a href="http://www.tera-house.ac.jp/">学校法人 小山学園</a></li>
             <li><a href="">プライバシーポリシー</a></li>
         </ul>
         <p class="text-center text-muted"><small></small></p>

		<div id="contact-modal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h1 class="text-center">お問い合わせ</h1>
					</div>
					<div id="contactM" class="modal-body">
						<form action="/TeraNavi/front/sendContact" method="post">
							<div class="form-group">
								<label class="control-label" for="exampleInputName">お名前</label>
								<input class="form-control" id="contactName" name="name" type="text">
							</div>
							<div class="form-group">
								<label class="control-label" for="exampleInputTitle">件名</label>
								<input class="form-control" id="contactTitle" name="title" type="text">
							</div>
							<div class="form-group">
								<label class="control-label">メールアドレス</label>
								<input class="form-control" id="contactAddress" type="email" name="address">
							</div>
							<div class="form-group">
								<label class="control-label">カテゴリ</label>
								<select class="form-control" id="contactCategory" name="category">
								  <option>サイトについて</option>
								  <option>その他</option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">本文</label>
								<textarea class="form-control" id="contactBody" name="body"></textarea>
							</div>
							<button type="button" id="contactBtn" class="btn btn-default pull-right">送信する</button>
						</form>

					</div>
					<div class="modal-footer"></div>
				</div><!--end moal-content-->
			</div><!--end modal-dialog-->
		</div><!--end modal-->
	</footer><!--end footer-->
	<script src='/TeraNavi/js/ContactSend.js'></script>
