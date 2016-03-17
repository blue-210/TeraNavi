var ajaxSettings;
var ajaxRule;
var nowId;

$(function () {

    ajaxRuleSettings = {
        type: 'post',
        url: '/TeraNavi/front/TermsDisplay',
        dataType: 'json'
    };

});

function loadRule() {

    ajaxRuleSettings.data = {
        ajax: "true",
        target: "rule"
       
    };

    ajaxRuleSettings.success = function (data) {

        var ruleMainModal = $("#ruleMainModal");

        ruleMainModal.empty();

        ruleMainModal.append("<p>" + data.main.body + "</p>");

    };

    ajaxRule = $.ajax(ajaxRuleSettings);

}

function loadRuleId(id) {
    nowId = id;

    ajaxRuleSettings.data = {
        ajax: "true",
        target: "rule",
        id: id,
        where: " WHERE rule_id = ?"
        
    };

    ajaxRuleSettings.success = function (data) {

        var ruleMainModal = $("#ruleMainModal");

        ruleMainModal.empty();

        ruleMainModal.append(data.main.body);

    };

    ajaxRule = $.ajax(ajaxRuleSettings);
}
