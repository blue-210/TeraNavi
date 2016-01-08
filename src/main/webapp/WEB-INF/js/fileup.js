$(function(){
	var ajax;
	var ajaxSettings = {
		type:'post',
		url:'upload',
		processData:false,
		contentType:false,
		cache:false,
		dataType:'json',
		success:function(data){
			document.getElementByName("body").innerHTML += data.result;
		}
	}

	if(window.File){
		document.getElementByName("body").addEventListener("drop",onDrop,false);
		console.log("アップロードOK");
	}else{
		alert("このブラウザでは画像ファイルのアップデート機能が使用できません");
	}

	function onDrop(event){
		var files = event.dataTransfer.files;
		var disp = document.getElementByName("body");

		console.log("オンドロップ");

		disp.innerHTML = " ";
		for(var i = 0;i < files.length;i++){
	        console.log("for");
			var f = files[i];
	        var formData = new FormData();
			formData.append("file",uploadFile);
			ajaxSettings.data = formData;
			ajax = $.ajax(ajaxSettings);
		}

		event.preventDefault();
	}

	function onDragOver(event){
		event.preventDefault();
	}

});
