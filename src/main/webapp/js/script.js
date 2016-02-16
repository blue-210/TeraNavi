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
            $("tbody").empty();
            // JSON形式で返ってきたものから中身を取り出して表示するサンプル
            for(var i in data){
                var userId = data[i].userId;
                var userName = data[i].userName;
                var iconPath = data[i].iconPath;
                var body = data[i].body;
                var date = data[i].date;

                console.log(i + " " + userId + " " + body);
                $("tbody")
                .append("<tr><td>" + userName + "</td><td>" + body + "</td><td>" + date + "</td></tr>");
            }
        })
        .fail(function(data){
            console.log(data);
        });
    });
});
