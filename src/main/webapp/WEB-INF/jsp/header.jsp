<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav id="header" class="navbar navbar-default" role="navigation">
   <div class="container">
      <div class="navbar-header">
         <a href="/TeraNavi/front/top" class="navbar-brand">TeraNavi</a>
      </div><!--end navbar-header-->

      <ul class="nav navbar-nav navbar-right list-inline">
         <li><a href="sign">新規登録</a><li>
         <li><a data-toggle="modal" href="#div-modal">ログイン</a><li>
      </ul>

          <div id="div-modal" class="modal fade">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h1 class="text-center">ログイン</h1>
                      </div>
                      <div class="modal-body">
                          <form action="/TeraNavi/front/login" method="post">
                              <div class="form-group">
                                  <label class="control-label" for="exampleInputId">ログインID</label>
                                  <input class="form-control" name="loginId" type="text">
                              </div>
                              <div class="form-group">
                                  <label class="control-label" for="exampleInputPass">パスワード</label>
                                  <input class="form-control" name="password" type="password">
                              </div>
                              <button type="submit" class="btn btn-default pull-right">送信する</button>
                          </form>
                          <a href="/TeraNavi/reset">パスワードを忘れた方はこちら</a>
                      </div>
                      <div class="modal-footer"></div>
                  </div><!--end moal-content-->
              </div><!--end modal-dialog-->
        </div><!--end modal-->
   </div>
</nav><!--end container-->
