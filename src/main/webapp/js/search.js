/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
	$(document).on("change","#target",function(){
        var target = $("#target option:selected").attr("value");
        $("#sform").attr("action","/TeraNavi/front/"+target);
		$("#sFormMobile").attr("action","/TeraNavi/front/"+target);
    });
	
	$(document).on("change","#targetMobile",function(){
        var target = $("#targetMobile option:selected").attr("value");
        $("#sform").attr("action","/TeraNavi/front/"+target);
		$("#sFormMobile").attr("action","/TeraNavi/front/"+target);
    });
});
