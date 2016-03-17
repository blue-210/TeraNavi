var ajaxSettings;
var ajax;
var nowId;

$(function () {

	
	ajaxSettings = {
		type: 'post',
		url: '/TeraNavi/front/TermsDisplay',
		dataType: 'json',
		data: {
			
		}
	};

	loadPolicy();

});

function loadPolicy() {
	ajaxSettings.data = {
		ajax: "true",
		target: "policy",
		
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
		
	};

	ajaxSettings.success = function (data) {

		var policyMainModal = $("#policyMainModal");

		policyMainModal.empty();

		policyMainModal.append(data.main.body);

	};

	ajax = $.ajax(ajaxSettings);
}
