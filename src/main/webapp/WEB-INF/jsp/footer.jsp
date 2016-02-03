<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

   <footer class="footer">
      <div class="container">
         <ul class="list-unstyled list-inline text-right">
            <li><a href="top">TOP</a></li>
            <li><a href="rule.jsp">注意事項</a></li>
            <li><a data-toggle="modal" href="#div-modal">お問い合わせ</a></li>
         </ul>
         <p class="text-center text-muted"><small></small></p>


        <div id="div-modal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h1>お問い合わせ</h1>
                    </div>
                    <div class="modal-body">
                        <form action="" method="post">
                            お名前  <input type="text" name=""><br>
                            件名   <input type="text" name=""><br>
                            E-mail  <input type="text" name=""><br>
                            カテゴリ  <input type=""><br>
                            本文  <textarea name="body" cols="40"></textarea><br>
                            <input type="submit" value="送信する">
                        </form>
                    </div>
                    <div class="modal-footer"></div>
                </div><!--end moal-content-->
            </div><!--end modal-dialog-->
      </div><!--end modal-->
   </footer><!--end footer-->
