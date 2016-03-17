var ajaxSettings;
var ajax;
var nowId;
var token = $("input[name=token]").val();
$(function () {

	console.log("token = "+token);
	ajaxSettings = {
		type: 'post',
		url: '/TeraNavi/front/TermsDisplay',
		dataType: 'json',
		data: {
			token:token
		}
	};

	loadPolicy();

});

function loadPolicy() {
	ajaxSettings.data = {
		ajax: "true",
		target: "policy",
		token:token
	};

	ajaxSettings.success = function (data) {

		var policyMainModal = $("#policyMainModal");

		policyMainModal.empty();

		policyMainModal.append("<p>" + data.main.body + "</p>");

	};

	ajax = $.ajax(ajaxSettings);

}

function loadPolicyId(id) {
	nowId = id;
	ajaxSettings.data = {
		ajax: "true",
		target: "policy",
		id: id,
		where: " WHERE policy_id = ?",
		token:token
	};

	ajaxSettings.success = function (data) {

		var policyMainModal = $("#policyMainModal");

		policyMainModal.empty();

		policyMainModal.append(data.main.body);

	};

	ajax = $.ajax(ajaxSettings);
}
