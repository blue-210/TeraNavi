$(function(){
    $("#chatwrite").on("click",function(){
        $.ajax({
            url : "/TeraNavi/front/writechat",
            type : "POST",
            dataType : "JSON",
            data : {
                ajax : 'true',
                topicId : $("input[name=topicId]").val(),
                chatBody : $("textarea[name=chatBody]").val(),
                userId : $("input[name=userId]").val()
            }
        })
        .done(function(data){
            $("textarea").val("");
            $(".col-md-5").empty();
            // JSON形式で返ってきたものから中身を取り出して表示するサンプル
            for(var i in data){
                var userId = data[i].userId;
                var userName = data[i].userName;
                var iconPath = data[i].iconPath;
                var body = data[i].body;
                var date = data[i].date;

                if(userId == $("input[name=userId]").val()){
                    $(".wrapper").append("<div class=\"row\"><div class=\"col-md-6\"></div><div class=\"col-md-1\"></div><div class=\"col-md-5\"><div class=\"box\"><p class=\"content\">" + userName + body + date + "</p></div><img class=\"account\" src=\"" + iconPath + "\"/></div></div>"
                    );
                }else{
                    $(".wrapper").append("<div class=\"row\"><div class=\"col-md-5\"><div class=\"other_box\"><p class=\"other_content\">" + userName + body + date + "</p></div><img class=\"other_account\" src=\"" + iconPath + "\"/></div><div class=\"col-md-5\"></div><div class=\"col-md-1\"></div></div>"
                    );
                }
            }
        })
        .fail(function(data){
            console.log(data);
        });
    });
});
