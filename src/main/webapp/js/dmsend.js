/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function dmSend(id){
	$.ajax({
            url : "/TeraNavi/front/dmsend",
            type : "POST",
            dataType : "JSON",
            data : {
                ajax : 'true',
                receiveUserId : $("#form"+id+" input[name=receiveUserId]").val(),
                messageBody : $("#form"+id+" textarea[name=messageBody]").val()
            }
        })
		
        .done(function(data){
			$("#form"+id+" textarea[name=messageBody]").val("");
            $("#dm-modal").modal();
        })
        .fail(function(data){
            console.log(data);
        });
}