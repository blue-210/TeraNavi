/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).on("click","#cautionArticle",function(){
	$("#targetUrl").empty();
	$("#targetUrl").val(location.href);
	$("#moHead").text("記事の通報");
	$('#cautionModal').modal('show');
});

$(document).on("click","#cautionUser",function(){
	var target;
	$("#targetUrl").empty();
	target = "/TeraNavi/front/mypage?paramUserId="+$("#uiCaution").val();
	$("#targetUrl").val(target);
	$("#moHead").text("ユーザの通報");
	$('#cautionModal').modal('show');
});

function commentCaution(targetId){
	$("#uiCaution").val(targetId);
	$("#targetUrl").empty();
	$("#targetUrl").val(location.href);
	$("#moHead").text("コメントの通報");
	$('#cautionModal').modal('show');	
}

function commentUserCaution(targetId){
	$("#uiCaution").val(targetId);
	$("#targetUrl").empty();
	$("#targetUrl").val(location.href);
	$("#moHead").text("ユーザの通報");
	$('#cautionModal').modal('show');
}

var ajaxSettings;
var ajax;
$(function(){
	ajaxSettings = {
		type:'post',
		url:'/TeraNavi/front/caution',
		dataType:'json',
		data:null
		
	};
	
});

$(document).on("click","#cautionSubmit",function(){
	sendCaution();
});

function sendCaution(){
	var body = $("#moHead").text()+"\n"+$("#cautionBody").val();
	ajaxSettings.data = {
		ajax:"true",
		cautionUserId:$("#uiCaution").val(),
		url:$("#targetUrl").val(),
		cautionTitle:$("#cautionTitle").val(),
		cautionBody:body
	};
	
	ajaxSettings.success = function(data){
		
		var target = $("#cautionM");
		target.empty();
		target.append("<h2 style='text-align:center;'>通報しました</h2>");
	};

	ajax = $.ajax(ajaxSettings);
	
}