/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var ajaxSettings;
var ajax;
$(function(){
	ajaxSettings = {
		type:'post',
		url:'/TeraNavi/front/compost',
		dataType:'json',
		data:null
		
	};
	
});

$(document).on("click","#commentSubmit",function(){
	sendComment();
});

function sendComment(){
	ajaxSettings.data = {
		ajax:"true",
		articleId:$("#primaryArticleId").val(),
		body:$("#commentBody").val()
	};
	
	ajaxSettings.success = function(data){
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
								<img src="'+userIcon+'" class="img-responsive"><a href="#"><p class="text-center">'+userName+'</p></a>\n\
							</div>\n\
							<div class="col-md-7"><p>'+cDate+'</p><p>'+body+'</p>\n\
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

	ajax = $.ajax(ajaxSettings);
	
}