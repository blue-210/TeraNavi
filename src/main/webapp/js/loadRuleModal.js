var ajaxSettings;
var ajax;
var nowId;
var token = $("input[name=token]").val();
$(function () {

    ajaxSettings = {
        type: 'post',
        url: '/TeraNavi/front/TermsDisplay',
        dataType: 'json',
        data: {
            token:token
        }

    };

    loadRule();

});

function loadRule() {

    ajaxSettings.data = {
        ajax: "true",
        target: "rule",
        token:token
    };

    ajaxSettings.success = function (data) {

        var ruleMainModal = $("#ruleMainModal");

        ruleMainModal.empty();

        ruleMainModal.append("<p>" + data.main.body + "</p>");

    };

    ajax = $.ajax(ajaxSettings);

}

function loadRuleId(id) {
    nowId = id;

    ajaxSettings.data = {
        ajax: "true",
        target: "rule",
        id: id,
        where: " WHERE rule_id = ?",
        token:token
    };

    ajaxSettings.success = function (data) {

        var ruleMainModal = $("#ruleMainModal");

        ruleMainModal.empty();

        ruleMainModal.append(data.main.body);

    };

    ajax = $.ajax(ajaxSettings);
}
