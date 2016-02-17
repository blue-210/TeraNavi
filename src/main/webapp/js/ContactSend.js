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
				url:'/TeraNavi/front/sendContact',
				dataType:'json',
				data:null
				
			};

			$("#contactBtn").on("click",function(){
				sendContact();
			});
		});

		function sendContact(){

			ajaxSettings.data = {
				ajax:"true",
				name:$("#contactName").val(),
				title:$("#contactTitle").val(),
				address:$("#contactAddress").val(),
				category:$("#contactCategory option:selected").text(),
				body:$("#contactBody").val()
			};
			
			ajaxSettings.success = function(data){
					
				var target = $("#contactM");
				target.empty();
				target.append("<h2 style='text-align:center;'>お問い合わせを送信しました</h2>");
			}

			ajax = $.ajax(ajaxSettings);
			
		}