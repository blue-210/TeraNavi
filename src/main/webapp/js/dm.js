/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
    $("#dmsend").on("click",function(){
        $.ajax({
            url : "/TeraNavi/front/dmsend",
            type : "POST",
            dataType : "JSON",
            data : {
                ajax : 'true',
                receiveUserId : $("input[name=receiveUserId]").val(),
                messageBody : $("textarea[name=messageBody]").val()
            }
        })
		
        .done(function(data){
            $("textarea").val("");
            $(".wrapper").empty();
            // JSON形式で返ってきたものから中身を取り出して表示するサンプル
            for(var i in data){
                var userId = data[i].fromUserId;
                var userName = data[i].fromUserName;
                var iconPath = data[i].fromIconPath;
                var body = data[i].messageBody;
                var date = data[i].date;

                var myId = $("#myId").val();
				console.log(myId);
				
                if(userId==myId){
                    console.log(i + " " + userId + " "+ body);

                    $(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-6 col-md-offset-2 content col-xs-7\"><p>" + body + "</p><p class=\"Mydate\" style=\"text-align:right;\">" + date + "</p></div><div class=\"col-md-2 col-xs-5\"><a class=\"text-muted pull-right\"><img style=\"width:70pxpx; height:70pxpx;\" class=\"accountImg img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"Myusername\">" + userName + "</p></a></div></div>");
                }else{
                    console.log(i + " " + userId + " " + body);
                    $(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-2 col-md-offset-2 col-xs-5\"><a class=\"text-muted\"><img style=\"width:70px; height:70px;\" class=\"accountImg img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"username\">" + userName + "</p></a></div><div class=\"col-md-6 other_content col-xs-7\"><p>" + body + "</p><p style=\"text-align:right;\">" + date + "<p></div></div>"
                    );
                }
            }
        })
        .fail(function(data){
            console.log(data);
        });
    });

	$("#mobileDmSendd").on("click",function(){
		 $.ajax({
            url : "/TeraNavi/front/dmsend",
            type : "POST",
            dataType : "JSON",
            data : {
                ajax : 'true',
                receiveUserId : $("input[name=receiveUserId]").val(),
                messageBody : $("textarea[name=messageBody]").val()
            }
        })
        .done(function(data){
            $("textarea").val("");
            $(".wrapper").empty();
            // JSON形式で返ってきたものから中身を取り出して表示するサンプル
            for(var i in data){
                var userId = data[i].fromUserId;
                var userName = data[i].fromUserName;
                var iconPath = data[i].fromIconPath;
                var body = data[i].messageBody;
                var date = data[i].date;

                var user_id = $("input[name=userId]").val();
                if(userId ==user_id){
                    console.log(i + " " + userId + " "+ body+user_id);

                    $(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-6 col-md-offset-2 content col-xs-7\"><p>" + body + "</p><p class=\"Mydate\" style=\"text-align:right;\">" + date + "</p></div><div class=\"col-md-1 col-xs-5\"><img style=\"width:55px;height:55px;\" class=\"accountImg img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"Myusername\">" + userName + "</p></div></div>");
                }else{
                    console.log(i + " " + userId + " " + body+user_id);
                    $(".wrapper").append("<div class=\"row\" style=\"margin-bottom: 15px;\"><div class=\"col-md-1 col-md-offset-2 col-xs-5\"><img class=\"accountImg style=\"width:55px;height:55px;\" img-thumbnail\" src=\"" + iconPath + "\"/><p class=\"username\">" + userName + "</p></div><div class=\"col-md-6 other_content col-xs-7\"><p>" + body + "</p><p style=\"text-align:right;\">" + date + "<p></div></div>"
                    );
                }
            }
        })
        .fail(function(data){
            console.log(data);
        });
	});
});
