var ajaxSettings;
var ajax;
$(function () {

    ajaxSettings = {
        type: 'post',
        url: 'upload',
        processData: false,
        contentType: false,
        cache: false,
        dataType: 'json'

    };

});

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
            ajax: 'true'
        }
    })
            //    成功時の処理
            .done(function (data) {
                //タグ選択モーダルにタグ一覧を入れ込む
                var atmBody = $("#addTagModalBody")
                for (var i in data) {
                    var tagId = data[i].id;
                    var tagName = data[i].name;
                    atmBody.append(
                            '<label class="checkbox-inline">\n\
                    <input type="checkbox" name="chTag" value="' + tagId + '">\n\
                        ' + tagName + '\n\
                </label>'
                            );
                }
            })
            //    失敗時の処理
            .fail(function () {

            });

    //画像追加-------------------------------------------------------------

    // $("#addImage").on("click", function () {
    //     $("#inputImage").click();
    // });
    //
    // $(document).on("change", "#inputImage", function () {
    //     var file = this.files[0];
    //     // ブラウザごとの違いをフォローする
    //     window.URL = window.URL || window.webkitURL;
    //
    //     // Blob URLの作成
    //     src = window.URL.createObjectURL(file);
    //     $("#headimg").attr("src", src);
    //     uploadImage();
    // });
    //
    // function uploadImage() {
    //     var files = document.getElementById("inputImage").files;
    //
    //     for (var i = 0; i < files.length; i++) {
    //         var f = files[i];
    //         var formData = new FormData();
    //         formData.append("file", f);
    //         ajaxSettings.data = formData;
    //         ajaxSettings.url = "/TeraNavi/upload/article";
    //         ajaxSettings.success = function (data) {
    //             var imageTag = "<img src=\"" + data.result + "\" / style=\"width:100%;\">";
    //             var currentText = CKEDITOR.instances.inputBody.getData();
    //             CKEDITOR.instances.inputBody.setData(currentText + "" + imageTag);
    //             console.log(imageTag);
    //             console.log(currentText);
    //             console.log(CKEDITOR.instances.inputBody.getData());
    //         }
    //
    //         ajax = $.ajax(ajaxSettings);
    //     }
    // }


    //モバイル版の画像追加-------------------------------------------------------------

    $("#mobileAddImage").on("click", function () {
        $("#inputImage").click();
    });

    $(document).on("change", "#inputImage", function () {
        var file = this.files[0];
        // ブラウザごとの違いをフォローする
        window.URL = window.URL || window.webkitURL;

        // Blob URLの作成
        src = window.URL.createObjectURL(file);
        $("#headimg").attr("src", src);
        uploadMobileImage();
    });

    function uploadMobileImage() {
        var files = document.getElementById("inputImage").files;

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

    //記事投稿の際の確認モーダルを出す処理---------------------------------------------
    $("#btn_post").on("click", function () {

        if ($("#inputTitle").val().length <= 0) {
            $("#validateMessage").css("display","");
            $("#validateTitle").css("display", "");
        } else {
            var apmBody = $("#articlePostModalBody");
            var title = $("#inputTitle").val();
            var body = tinyMCE.get('inputBody').getContent();
            //var body = CKEDITOR.instances.inputBody.getData();
            $("#articlePostModalBody").empty();
            apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
            apmBody.append('<hr><p>この内容でよろしいですか？<p>');
            $("#articlePostModal").modal();
        }


    });

    //モバイル版の確認画面の表示処理
    $("#mobile_btn_post").on("click", function () {

        if ($("#inputTitle").val().length <= 0) {
            $("#validateMessage").css("display","");
            $("#validateTitle").css("display", "");
        } else {
            var apmBody = $("#articlePostModalBody");
            var title = $("#inputTitle").val();
            var body = $("#inputBody").val();
            $("#articlePostModalBody").empty();
            apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
            apmBody.append('<hr><p>この内容でよろしいですか？<p>');
            $("#articlePostModal").modal();
        }


    });


    //記事を投稿する処理--------------------------------------------------------------
    $("#btn_modalArticlePost").on("click", function () {

        var checks = [];
        $("[name='chTag']:checked").each(function () {
            checks.push(this.value);
        });

        $.ajax({
            // urlで飛ばしたいコマンドを指定してあげる
            url: '/TeraNavi/front/articlepost',
            type: 'POST',
            dataType: 'json',
            //   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
            data: {
                //   キー:バリューで書く。バリューには変数も使えます。
                title: $("#inputTitle").val(),
                body: tinyMCE.get('inputBody').getContent(),
                //body: CKEDITOR.instances.inputBody.getData(),
                tag: checks,
                ajax: 'true'
            }
        })
                //    成功時の処理
                .done(function (data) {
                    $("#articlePostResultModal").modal();

                    $("#inputTitle").val("");
                    tinyMCE.get('inputBody').setContent("");

                    $("[name='chTag']:checked").prop("checked",false);

                })
                //    失敗時の処理
                .fail(function () {
                    $("#articlePostResultMessage").text("記事を投稿できませんでした");
                    $("#articlePostResultModal").modal();
                });
    });
    //モバイル版投稿処理-------------------------------------------------------------------
    $("#mobile_btn_modalArticlePost").on("click", function () {

        var checks = [];
        $("[name='chTag']:checked").each(function () {
            checks.push(this.value);
        });

        $.ajax({
            // urlで飛ばしたいコマンドを指定してあげる
            url: '/TeraNavi/front/articlepost',
            type: 'POST',
            dataType: 'json',
            //   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
            data: {
                //   キー:バリューで書く。バリューには変数も使えます。
                title: $("#inputTitle").val(),
                body: $("#inputBody").val(),
                tag: checks,
                ajax: 'true'
            }
        })
                //    成功時の処理
                .done(function (data) {
                    $("#articlePostResultModal").modal();

                    $("#inputTitle").val("");
                    $("#inputBody").val("");

                    $("[name='chTag']:checked").prop("checked",false);

                })
                //    失敗時の処理
                .fail(function () {
                    $("#articlePostResultMessage").text("記事を投稿できませんでした");
                    $("#articlePostResultModal").modal();
                });
    });


    //下書き保存する処理--------------------------------------------------------------
    $("#btn_draft").on("click", function () {

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
                url: '/TeraNavi/front/draftArticle',
                type: 'POST',
                //   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
                dataType: 'json',
                //   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
                data: {
                    //   キー:バリューで書く。バリューには変数も使えます。
                    title: $("#inputTitle").val(),
                    body: tinyMCE.get('inputBody').getContent(),
                    tag: checks,
                    ajax: 'true'
                }
            })
                    //    成功時の処理
                    .done(function (data) {
                        $("#articlePostResultModalLabel").text("記事の下書き保存結果");
                        $("#articlePostResultMessage").text("記事の下書き保存が完了しました");
                        $("#articlePostResultModal").modal();

                        $("#inputTitle").val("");
                        tinyMCE.get('inputBody').setContent("");

                        $("[name='chTag']:checked").prop("checked",false);


                    })
                    //    失敗時の処理
                    .fail(function () {
                        $("#articlePostResultMessage").text("記事を下書き保存できませんでした");
                        $("#articlePostResultModal").modal();
                    });
        }



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
                url: '/TeraNavi/front/draftArticle',
                type: 'POST',
                //   Ajaxは基本的にJSONというデータ形式を使うのが一般的。JSONについては後述。
                dataType: 'json',
                //   dataでパラメータ名を指定する。コマンド側でgetParameterのときに使います。
                data: {
                    //   キー:バリューで書く。バリューには変数も使えます。
                    title: $("#inputTitle").val(),
                    body: $("#inputBody").val(),
                    tag: checks,
                    ajax: 'true'
                }
            })
                    //    成功時の処理
                    .done(function (data) {
                        $("#articlePostResultModalLabel").text("記事の下書き保存結果");
                        $("#articlePostResultMessage").text("記事の下書き保存が完了しました");
                        $("#articlePostResultModal").modal();

                        $("#inputTitle").val("");
                        $("#inputBody").val("");

                        $("[name='chTag']:checked").prop("checked",false);


                    })
                    //    失敗時の処理
                    .fail(function () {
                        $("#articlePostResultMessage").text("記事を下書き保存できませんでした");
                        $("#articlePostResultModal").modal();
                    });
        }



    });


    // $("#btn_preview").on("click", function () {
    //     var apmBody = $("#previewModalBody");
    //     var title = $("#inputTitle").val();
    //     var body = tinyMCE.get('inputBody').getContent();
    //     $("#previewModalBody").empty();
    //     apmBody.append('<h1 class="text-center">' + title + '</h1><br>' + body);
    //     $("#previewModal").modal();
    //
    // });
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
