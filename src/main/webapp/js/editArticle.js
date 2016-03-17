
$(function () {



	//タグ一覧を取得する処理-----------------------------------------------------------
	$.ajax({
		// urlで飛ばしたいコマンドを指定してあげる
		url: '/TeraNavi/front/getTagList',
		type: 'POST',
		dataType: 'json',
		//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
		data: {
			//   キー:バリューで書く。バリューには変数も使えます。
			ajax: 'true',
			articleId: $("#targetArticleId").val()
		}
	})
			//    成功時の処理
			.done(function (data) {
				//タグ選択モーダルにタグ一覧を入れ込む
				var atmBody = $("#addTagModalBody");
				for (var i in data) {
					var tagId = data[i].tag.id;
					var tagName = data[i].tag.name;
					var status = data[i].status;

					if (status == 'true') {
						atmBody.append(
								'<label class="checkbox-inline">\n\
				   <input type="checkbox" checked="true" name="chTag" value="' + tagId + '">\n\
					   ' + tagName + '\n\
			   </label>'
								);
					} else {
						atmBody.append(
								'<label class="checkbox-inline">\n\
					   <input type="checkbox" name="chTag" value="' + tagId + '">\n\
						   ' + tagName + '\n\
				   </label>'
								);

					}


				}
			})
			//    失敗時の処理
			.fail(function () {

			});

	//画像追加-------------------------------------------------------------

	// $("#addImage").on("click", function () {
	// 	$("#inputImage").click();
	// });
    //
	// $(document).on("change", "#inputImage", function () {
	// 	var file = this.files[0];
	// 	// ブラウザごとの違いをフォローする
	// 	window.URL = window.URL || window.webkitURL;
    //
	// 	// Blob URLの作成
	// 	src = window.URL.createObjectURL(file);
	// 	$("#headimg").attr("src", src);
	// 	uploadImage();
	// });
    //
	// function uploadImage() {
	// 	var files = document.getElementById("inputImage").files;
    //
	// 	for (var i = 0; i < files.length; i++) {
	// 		var f = files[i];
	// 		var formData = new FormData();
	// 		formData.append("file", f);
	// 		ajaxSettings.data = formData;
	// 		ajaxSettings.url = "/TeraNavi/upload/article";
	// 		ajaxSettings.success = function (data) {
	// 			var imageTag = "<img src=\"" + data.result + "\" / style=\"width:100%;\">";
	// 			var currentText = CKEDITOR.instances.inputBody.getData();
	// 			CKEDITOR.instances.inputBody.setData(currentText + "" + imageTag);
    //
	// 		};
    //
	// 		ajax = $.ajax(ajaxSettings);
	// 	}
	// }

    //モバイル版の画像追加-------------------------------------------------------------

    $("#mobileAddImage").on("click", function () {
        $("#inputImage").click();
    });

    $(document).on("change", "#inputImage", function () {
        uploadMobileImage();
    });

    function uploadMobileImage() {
        var files = document.getElementById("inputImage").files;

        var ajaxSettings;
        var ajax;

        ajaxSettings = {
                type: 'post',
                url: 'upload',
                processData: false,
                contentType: false,
                cache: false,
                dataType: 'json'

            };

        for (var i = 0; i < files.length; i++) {
            var f = files[i];
            var formData = new FormData();
            formData.append("file", f);
            ajaxSettings.data = formData;
            ajaxSettings.url = "/TeraNavi/upload/article";
            ajaxSettings.success = function (data) {
                var imageTag = "<img src=\"" + data.result + "\" / style=\"width:100%;\">";
                var currentText = $("#inputBody").val();
                $("#inputBody").val(currentText + "" + imageTag);
                console.log(imageTag);
                console.log(currentText);
                console.log($("#inputBody").val());
            }

            ajax = $.ajax(ajaxSettings);
        }
    }



	//タグ選択モーダルを出す処理---------------------------------------------
	$("#btn_addTag").on("click", function () {
		$("#addTagModal").modal();
	});

//				ajaxSettings = {
//					type: 'post',
//					url: 'upload',
//					processData: false,
//					contentType: false,
//					cache: false,
//					dataType: 'json',
//					success: function (data) {
//						console.log("success");
//						var text = $("#tbody").val();
//						$("#tbody").val(text + "<br>" + data.result);
//					}
//				};

    //記事投稿の際の確認モーダルを出す処理---------------------------------------------
	$("#btn_post").on("click", function () {
        if ($("#inputTitle").val().length <= 0) {
            $("#validateMessage").css("display","");
            $("#validateTitle").css("display", "");
        }else{
            var eamBody = $("#editArticleModalBody");
    		var title = $("#inputTitle").val();
    		var body = tinyMCE.get('inputBody').getContent();
    		$("#editArticleModalBody").empty();
    		eamBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
    		eamBody.append('<hr><p>この内容でよろしいですか？<p>');
    		$("#editArticleModal").modal();
        }
	});

    //モバイル版の確認画面の表示処理
    $("#mobile_btn_post").on("click", function () {

        if ($("#inputTitle").val().length <= 0) {
            $("#validateMessage").css("display","");
            $("#validateTitle").css("display", "");
        } else {
            var eamBody = $("#editArticleModalBody");
    		var title = $("#inputTitle").val();
    		var body = $("#inputBody").val();
    		$("#editArticleModalBody").empty();
    		eamBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
    		eamBody.append('<hr><p>この内容でよろしいですか？<p>');
    		$("#editArticleModal").modal();
        }


    });

    //記事を投稿する処理--------------------------------------------------------------
	$("#btn_modalEditArticle").on("click", function () {
		var checks = [];
		$("[name='chTag']:checked").each(function () {
			checks.push(this.value);
		});

		$.ajax({
			// urlで飛ばしたいコマンドを指定してあげる
			url: '/TeraNavi/front/editArticle',
			type: 'POST',
			//   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
			dataType: 'json',
			//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
			data: {
				//   キー:バリューで書く。バリューには変数も使えます。
				articleId: $("#targetArticleId").val(),
				status: "0",
				title: $("#inputTitle").val(),
				body: tinyMCE.get('inputBody').getContent(),
				tag: checks,
				ajax: 'true',
				token:$("#tokenInput").val()
			}
		})
				//    成功時の処理
				.done(function (data) {
					$("#inputTitle").val("");
                    tinyMCE.get('inputBody').setContent("");

                    $("[name='chTag']:checked").prop("checked",false);
					$("#editArticleResultModal").modal();
				})
				//    失敗時の処理
				.fail(function () {
					$("#editArticleResultMessage").text("記事の編集結果を投稿できませんでした");
					$("#editArticleResultModal").modal();
				});
	});

    //モバイル版投稿処理-------------------------------------------------------------------
    $("#mobile_btn_modalEditArticle").on("click", function () {

        var checks = [];
        $("[name='chTag']:checked").each(function () {
            checks.push(this.value);
        });

        $.ajax({
            // urlで飛ばしたいコマンドを指定してあげる
            url: '/TeraNavi/front/editArticle',
            type: 'POST',
            dataType: 'json',
            //   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
            data: {
                //   キー:バリューで書く。バリューには変数も使えます。
                articleId: $("#targetArticleId").val(),
				status: "0",
                title: $("#inputTitle").val(),
                body: $("#inputBody").val(),
                tag: checks,
                ajax: 'true',
				token:$("#tokenInput").val()
            }
        })
            //    成功時の処理
            .done(function (data) {
                $("#editArticleResultModal").modal();
            })
            //    失敗時の処理
            .fail(function () {
                $("#editArticleResultMessage").text("記事の編集結果を投稿できませんでした");
                $("#editArticleResultModal").modal();
            });
    });

    //下書き保存する処理--------------------------------------------------------------
	$("#btn_draft").on("click", function () {
		$.ajax({
			// urlで飛ばしたいコマンドを指定してあげる
			url: '/TeraNavi/front/editArticle',
			type: 'POST',
			//   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
			dataType: 'json',
			//   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
			data: {
				//   キー:バリューで書く。バリューには変数も使えます。
				articleId: $("#targetArticleId").val(),
				status: "1",
				title: $("#inputTitle").val(),
				body: tinyMCE.get('inputBody').getContent(),
				ajax: 'true',
				token:$("#tokenInput").val()
			}
		})
				//    成功時の処理
				.done(function (data) {
					$("#editArticleResultMessage").text("記事の編集結果を下書き保存しました");
					$("#editArticleResultModal").modal();
					$("#inputTitle").val("");
                    tinyMCE.get('inputBody').setContent("");

                    $("[name='chTag']:checked").prop("checked",false);
				})
				//    失敗時の処理
				.fail(function () {
					$("#editArticleResultMessage").text("記事の編集結果を下書き保存できませんでした");
					$("#editArticleResultModal").modal();
				});
	});

    //モバイル版の下書き保存---------------------------------------------------------------------
    $("#mobile_btn_draft").on("click", function () {

        if ($("#inputTitle").val().length <= 0) {
            $("#validateTitle").css("display", "");
            $("#validateMessage").css("display","");
        } else {
            var checks = [];
            $("[name='chTag']:checked").each(function () {
                checks.push(this.value);
            });

            $.ajax({
                // urlで飛ばしたいコマンドを指定してあげる
                url: '/TeraNavi/front/editArticle',
                type: 'POST',
                //   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
                dataType: 'json',
                //   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
                data: {
                    //   キー:バリューで書く。バリューには変数も使えます。
                    articleId: $("#targetArticleId").val(),
    				status: "1",
                    title: $("#inputTitle").val(),
                    body: $("#inputBody").val(),
                    tag: checks,
                    ajax: 'true',
					token:$("#tokenInput").val()
                }
            })
                    //    成功時の処理
                    .done(function (data) {
                        $("#articlePostResultModalLabel").text("記事の下書き保存結果");
                        $("#articlePostResultMessage").text("記事の下書き保存が完了しました");
                        $("#articlePostResultModal").modal();
                    })
                    //    失敗時の処理
                    .fail(function () {
                        $("#articlePostResultMessage").text("記事を下書き保存できませんでした");
                        $("#articlePostResultModal").modal();
                    });
        }



    });

    //モバイル版プレビュー
    $("#mobile_btn_preview").on("click", function () {
        var apmBody = $("#previewModalBody");
        var title = $("#inputTitle").val();
        var body = $("#inputBody").val();
        $("#previewModalBody").empty();
        apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
        $("#previewModal").modal();

    });

    $(document).on("blur", "#inputTitle", function () {
        if ($("#inputTitle").val().length <= 0) {
            $("#validateTitle").css("display", "");
        } else {
            $("#validateTitle").css("display", "none");
            $("#validateMessage").css("display","none");
        }
    });

    //useragent（デバイスの情報）を取得
    var userAgent = window.navigator.userAgent.toLowerCase();

    //デバイスごとに挿入するタグを分岐
    if(userAgent.indexOf('iphone') != -1 || userAgent.indexOf('Android') != -1){
    //iphoneの場合に、#apAreaにpタグを挿入
    $('#inputBody').removeClass('articleEditor');
    $('#inputBody').addClass('form-control');
    $('#inputBody').css('height','210px');
    $('#inputBody').css('width','92%');

    }


    $("textarea").change( function() {
        var txtVal = $(this).val();
        text = txtVal.replace(/\r?\n/g, "<br />");
        $('#inputBody').val(text);
    });

});

//			function onDrop(event) {
//				var files = event.dataTransfer.files;
//
//
//				for (var i = 0; i < files.length; i++) {
//
//					var f = files[i];
//					var formData = new FormData();
//					formData.append("file", f);
//					ajaxSettings.data = formData;
//					ajax = $.ajax(ajaxSettings);
//				}
//
//				event.preventDefault();
//			}

//			function onDragOver(event) {
//				event.preventDefault();
//			}
