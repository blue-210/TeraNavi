/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var ajaxSettings2;
var ajax2;

var ajaxSettings3;
var ajax3;

$(function(){

	ajaxSettings2 = {
		type:'post',
		url:'/TeraNavi/front/compost',
		dataType:'json',
		data:null

	};
	
	ajaxSettings3 = {
//		コメントを定期的に読み込むための設定
		type:'post',
		url:'/TeraNavi/front/commentRead',
		dataType:'json',
		data:{
			ajax:'true',
			articleId:$("#primaryArticleId").val()
		},
		success:function(data){
			var cDiv = $("#commentPostDiv");
			
	//		コメント数の更新
			$("#commentCount").text(data.length);
			cDiv.empty();
			
			for(var i in data){
				var userIcon = data[i].iconPath;
				var userName = data[i].userName;
				var cDate = data[i].commentDate;
				var body = data[i].commentBody;
				var userId = data[i].userId;



				cDiv.append('<div class="row">\n\
								<div class="col-md-1 col-md-offset-2">\n\
									<a href="/TeraNavi/front/mypage?paramUserId="'+userId+'"><img src="'+userIcon+'" class="img-thumbnail" style="width:50px;height:50px;"><p class="">'+userName+'</p></a>\n\
								</div>\n\
								<div class="col-md-7"><p>'+cDate+'</p><pre>'+body+'</pre>\n\
									<a href="#" class="dropdown pull-right dropdown-toggle" data-toggle="dropdown"><i class="-o -square fa fa-ellipsis-h fa-fw fa-lg text-muted"></i></a>\n\
									<ul class="dropdown-menu dropdown-menu-right">\n\
										<li><a onclick="commentCaution(\''+userId+'\')">このコメントを通報する</a></li>\n\
										<li><a onclick="commentUserCaution(\''+userId+'\')">このユーザを通報する</a></li>\n\
									</ul>\n\
								</div>\n\
							</div>');
				cDiv.append('<div class="row"><div class="col-md-8 col-md-offset-2"><hr></div></div>');
			}	
		}
	};
	
	setInterval(function(){
		ajax3 = $.ajax(ajaxSettings3);
	},2000);
	

});

$(document).on("click","#commentSubmit",function(){
	sendComment();
});

function sendComment(){
	var body = $("#commentBody").val();
	if(body.length>0){
		ajaxSettings2.data = {
			ajax:"true",
			articleId:$("#primaryArticleId").val(),
			body:body
		};

		ajaxSettings2.success = function(data){
			var cDiv = $("#commentPostDiv");
			console.log(data.length);
	//		 　コメント数の更新
			$("#commentCount").text(data.length);
			cDiv.empty();
			$("#commentBody").val("");
			for(var i in data){
				var userIcon = data[i].iconPath;
				var userName = data[i].userName;
				var cDate = data[i].commentDate;
				var body = data[i].commentBody;
				var userId = data[i].userId;



				cDiv.append('<div class="row">\n\
								<div class="col-md-1 col-md-offset-2">\n\
									<a href="/TeraNavi/front/mypage?paramUserId="'+userId+'"><img src="'+userIcon+'" class="img-thumbnail" style="width:50px;height:50px;"><p class="">'+userName+'</p></a>\n\
								</div>\n\
								<div class="col-md-7"><p>'+cDate+'</p><pre>'+body+'</pre>\n\
									<a href="#" class="dropdown pull-right dropdown-toggle" data-toggle="dropdown"><i class="-o -square fa fa-ellipsis-h fa-fw fa-lg text-muted"></i></a>\n\
									<ul class="dropdown-menu dropdown-menu-right">\n\
										<li><a onclick="commentCaution(\''+userId+'\')">このコメントを通報する</a></li>\n\
										<li><a onclick="commentUserCaution(\''+userId+'\')">このユーザを通報する</a></li>\n\
									</ul>\n\
								</div>\n\
							</div>');
				cDiv.append('<div class="row"><div class="col-md-8 col-md-offset-2"><hr></div></div>');
			}
		};

		ajax2 = $.ajax(ajaxSettings2);

	}else{
		$("#commentBody").attr("placeholder","入力内容が足りません");
	}


}
