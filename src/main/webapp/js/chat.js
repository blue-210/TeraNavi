$(function () {
	setInterval(function () {
		$.ajax({
			url: "/TeraNavi/front/showchat",
			type: "POST",
			dataType: "JSON",
			data: {
				ajax: 'true',
				topicId: $("input[name=topicId]").val()
			}
		})
				.done(function (data) {

					$(".wrapper").empty();
					// JSON形式で返ってきたものから中身を取り出して表示するサンプル
					for (var i in data.chat) {
						var userId = data.chat[i].userId;
						var userName = data.chat[i].userName;
						var iconPath = data.chat[i].iconPath;
						var body = data.chat[i].body;
						var date = data.chat[i].date;

						var user_id = $("input[name=userId]").val();
						if (userId == user_id) {
							

							$(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-6 col-md-offset-2 content col-xs-7\"><p>" + body + "</p><p class=\"Mydate\" style=\"text-align:right;\">" + date + "</p></div><div class=\"col-md-1 col-xs-5\"><img style=\"width:55px; height:55px;\" class=\"accountImg img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"Myusername\">" + userName + "</p></div></div>");
						} else {
							
							$(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-1 col-md-offset-2 col-xs-5\"><img style=\"width:55px; height:55px;\" class=\"accountImg img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"username\">" + userName + "</p></div><div class=\"col-md-6 other_content col-xs-7\"><p>" + body + "</p><p style=\"text-align:right;\">" + date + "<p></div></div>"
									);
						}
					}
				})
				.fail(function (data) {
					console.log(data);
				});
	}, 2000);

	$("#chatwrite").on("click", function () {
		$.ajax({
			url: "/TeraNavi/front/writechat",
			type: "POST",
			dataType: "JSON",
			data: {
				ajax: 'true',
				topicId: $("input[name=topicId]").val(),
				chatBody: $("textarea[name=chatBody]").val(),
				userId: $("input[name=userId]").val(),
				token:$("#tokenInput").val()
			}
		})
				.done(function (data) {
					$("textarea").val("");
					$(".wrapper").empty();
					// JSON形式で返ってきたものから中身を取り出して表示するサンプル
					for (var i in data) {
						var userId = data[i].userId;
						var userName = data[i].userName;
						var iconPath = data[i].iconPath;
						var body = data[i].body;
						var date = data[i].date;

						var user_id = $("input[name=userId]").val();
						if (userId == user_id) {
							

							$(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-6 col-md-offset-2 content col-xs-7\"><p>" + body + "</p><p class=\"Mydate\" style=\"text-align:right;\">" + date + "</p></div><div class=\"col-md-1 col-xs-5\"><img style=\"width:55px; height:55px;\" class=\"accountImg img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"Myusername\">" + userName + "</p></div></div>");
						} else {
							
							$(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-1 col-md-offset-2 col-xs-5\"><img style=\"width:55px; height:55px;\" class=\"accountImg img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"username\">" + userName + "</p></div><div class=\"col-md-6 other_content col-xs-7\"><p>" + body + "</p><p style=\"text-align:right;\">" + date + "<p></div></div>"
									);
						}
					}
				})
				.fail(function (data) {
					console.log(data);
				});
	});

	$("#mobileChatWrite").on("click", function () {
		$.ajax({
			url: "/TeraNavi/front/writechat",
			type: "POST",
			dataType: "JSON",
			data: {
				ajax: 'true',
				topicId: $("input[name=topicId]").val(),
				chatBody: $("textarea[name=chatBody]").val(),
				userId: $("input[name=userId]").val()
			}
		})
				.done(function (data) {
					$("textarea").val("");
					$(".wrapper").empty();
					// JSON形式で返ってきたものから中身を取り出して表示するサンプル
					for (var i in data) {
						var userId = data[i].userId;
						var userName = data[i].userName;
						var iconPath = data[i].iconPath;
						var body = data[i].body;
						var date = data[i].date;

						var user_id = $("input[name=userId]").val();
						if (userId == user_id) {
							

							$(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-6 col-md-offset-2 content col-xs-7\"><p>" + body + "</p><p class=\"Mydate\" style=\"text-align:right;\">" + date + "</p></div><div class=\"col-md-1 col-xs-5\"><img style=\"width:55px;height:55px;\" class=\"accountImg img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"Myusername\">" + userName + "</p></div></div>");
						} else {
							
							$(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-1 col-md-offset-2 col-xs-5\"><img class=\"accountImg style=\"width:55px;height:55px;\" img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"username\">" + userName + "</p></div><div class=\"col-md-6 other_content col-xs-7\"><p>" + body + "</p><p style=\"text-align:right;\">" + date + "<p></div></div>"
									);
						}
					}
				})
				.fail(function (data) {
					console.log(data);
				});
	});




//	var ajaxSettingsFile;
//	var ajaxFile;
//
//	ajaxSettingsFile = {
//		type: 'post',
//		url: '/TeraNavi/upload', 
//				processData: false,
//		contentType: false,
//		cache: false,
//		dataType: 'json',
//		success: function (data) {
//
//			var text = $("#chatbody").val();
//			$("#chatbody").val(text + "<br>" + data.result);
//		}
//	};
//
//
//
//	function fileDrop(event) {
//		var files2 = event.dataTransfer.files;
//		console.log(files2);
//
//		for (var i = 0; i < files2.length; i++) {
//
//			var f = files2[i];
//			var formData = new FormData();
//			formData.append("file", f);
//			ajaxSettingsFile.data = formData;
//			ajaxFile = $.ajax(ajaxSettingsFile);
//		}
//
//		event.preventDefault();
//	}
//
//	function fileDragOver(event) {
//		event.preventDefault();
//	}
//	
//	$("#chatBody").on("dragover",function(event){
//		fileDragOver(event);
//	});
//	
//	$("#chatBody").on("drop",function(event){
//		fileDrop(event);
//	});
//	
});
