var utils =  {
    isNotEmpty : function(_str){
        obj = String(_str);
        if(obj == null || obj == undefined || obj == 'null' || obj == 'undefined' || obj == '' ) return false;
        else return true;
    },
    isEmpty : function(_str){
        return !utils.isNotEmpty(_str);
    },
    isVaildDate : function(d) {
    	return d instanceof Date && !isNaN(d);
   	},
    replaceAll: function(str, find, replace) {
    	if(str!=null){
    		if(str.indexOf(find)<0) return str;
			return str.split(find).join(replace);
    	}else {
    		return str;
    	}
	},
	priceToString : function(price) {
		if(price) return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		else return "0";
	},
	vatCalculator : function(price) {
		return Math.round(Number(price) * 0.1);
	},
	initFlatChange : function() {
		$('input.flat').each(function(){
			if($(this).parents(".x_panel").length > 0) {
				if($(this).parents(".icheckbox_flat-green").length==0 && $(this).parents(".iradio_flat-green").length==0){
					$(this).iCheck({
		                checkboxClass: 'icheckbox_flat-green',
		                radioClass: 'iradio_flat-green'
		            });
				}
			}
		});
	},
	formPostMove : function(url, _data) {
		$("#common_move_form").remove();
		var moveForm = $("<form id='common_move_form'></form>");
		for(var i in _data) {
			var formInput = $("<input type='hidden'></input>");
			formInput.attr("name", i);
			formInput.val(_data[i]);
			moveForm.append(formInput);
		}
		moveForm.attr("action", url);
		moveForm.attr("method","post");
		$("body").append(moveForm);
		$("#common_move_form").submit();
		$("#common_move_form").remove();
	},
}
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekNameShort = ["일", "월", "화", "수", "목", "금", "토"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|e|hh|h|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "e": return weekNameShort[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "h": return ((h = d.getHours() % 12) ? h : 12);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

/**
 * ************************************************ 
 * @MethodName : ajaxFileFormExecute
 * @Description: File Form data ajax connect
 * @param formId : 폼 아이디
 * @param action : 호출 URL
 * @param method : POST OR GET
 * @param asyncFlag : 동기 / 비동기 (true / false)
 * @param progressFlag : 프로그래스바 유무 (true / false)
 * @param callback : 콜백 메소드
 * @Author     : joon
 * @Version    : 2015. 11. 27.
*************************************************
 */
function ajaxFileFormExecute(formId, action, method, asyncFlag, progressFlag, callback){
	if(typeof(asyncFlag) == "undefined" || asyncFlag == null || asyncFlag == "") asyncFlag = true;
	
	var formName = $('#' + formId).attr("name");
	var formData = new FormData(document.forms.namedItem(formName));
	$.ajax({
		url : action,
		type: method,
		data: formData,
		contentType: false,
		processData: false,
		async: asyncFlag,
		success: function(data) {
			if(data.status) {
				if(data.status==999) {
					modalAlert(data.message);
					return;
				}
			}
			if (typeof callback == "function") {
				callback.call(this, data);
			}
		},
		error: function(request,status,error) {
			//$('body').empty().append(data.responseText);
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			modalAlert("code:"+request.status+"<br/>"+"message:"+request.responseText+"<br/>"+"error:"+error);
			return;
		},
		beforeSend: function(xhr) {
			if(progressFlag) loadingModal(true);
			xhr.setRequestHeader("AJAX", true);
		},
		complete: function() {
			if(progressFlag) loadingModal(false);
		}
	});
}

/**
 * ************************************************ 
 * @MethodName : ajaxFormExecute
 * @Description: Form data ajax connect
 * @param formId : 폼 아이디
 * @param action : 호출 URL
 * @param method : POST OR GET
 * @param asyncFlag : 동기 / 비동기 (true / false)
 * @param progressFlag : 프로그래스바 유무 (true / false)
 * @param callback : 콜백 메소드
 * @Author     : joon
 * @Version    : 2015. 11. 27.
*************************************************
 */
function ajaxFormExecute(formId, action, method, asyncFlag, progressFlag, callback){
	if(typeof(asyncFlag) == "undefined" || asyncFlag == null || asyncFlag == "") asyncFlag = true;
	
	$.ajax({
		url : action,
		type: method,
		data: $('#' + formId).serialize(),
		async: asyncFlag,
		success: function(data) {
			if (typeof callback == "function") {
				callback.call(this, data);
			}
		},
		error: function(request,status,error) {
			//$('body').empty().append(data.responseText);
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", true);
		},
		complete: function() {
		}
	});
}

/**
 * ************************************************ 
 * @MethodName : ajaxParamExecute
 * @Description: parameter data ajax connect
 * @param formId : 폼 아이디
 * @param action : 호출 URL
 * @param method : POST OR GET
 * @param asyncFlag : 동기 / 비동기 (true / false)
 * @param progressFlag : 프로그래스바 유무 (true / false)
 * @param callback : 콜백 메소드
 * @Author     : joon
 * @Version    : 2015. 11. 27.
*************************************************
 */
function ajaxParamExecute(params, action, method, asyncFlag, progressFlag, callback){
	if(typeof(asyncFlag) == "undefined" || asyncFlag == null || asyncFlag == "") asyncFlag = true;
	
	$.ajax({
		url : action,
		type: method,
		data: params,
		//contentType: false,
		processData: false,
		async: asyncFlag,
		success: function(data) {
			if (typeof callback == "function") {
				callback.call(this, data);
			}
		},
		error: function(request,status,error) {
			//$('body').empty().append(data.responseText);
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", true);
		},
		complete: function() {
		}
	});
}

/**
 * ************************************************ 
 * @MethodName : ajaxJsonExecute
 * @Description: json data ajax connect
 * @param action : 호출 URL
 * @param method : POST OR GET
 * @param asyncFlag : 동기 / 비동기 (true / false)
 * @param progressFlag : 프로그래스바 유무 (true / false)
 * @param callback : 콜백 메소드
 * @Author     : joon
 * @Version    : 2015. 11. 27.
*************************************************
 */
function ajaxJsonExecute(params, action, method, asyncFlag, progressFlag, callback){
	if(typeof(asyncFlag) == "undefined" || asyncFlag == null || asyncFlag == "") asyncFlag = true;
	
	$.ajax({
		url : action,
		type: method,
		data: JSON.stringify(params),
		contentType: 'application/json',
		//contentType: false,
		processData: false,
		async: asyncFlag,
		success: function(data) {
			if(data.status) {
				if(data.status==999) {
					modalAlert(data.message);
					return;
				}
			}
			if (typeof callback == "function") {
				callback.call(this, data);
			}
		},
		error: function(request,status,error) {
			if(request.status == 401) {
				modalAlert("로그아웃 되었습니다.", function(){
					location.href="/admin/login";
					return;
				});
			}
			//$('body').empty().append(data.responseText);
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		beforeSend: function(xhr) {
			if(progressFlag) loadingModal(true);
			xhr.setRequestHeader("AJAX", true);
		},
		complete: function() {
			if(progressFlag) loadingModal(false);
			utils.initFlatChange();
		}
	});
}

function excelDown(data, action) {
	$("#common_excel_form").remove();
	var excelForm = $("<form id='common_excel_form'></form>");
	for(var i in data) {
		var formInput = $("<input type='hidden'></input>");
		formInput.attr("name", i);
		formInput.val(data[i]);
		excelForm.append(formInput);
	}
	excelForm.attr("action", action);
	excelForm.attr("method","post");
	$("body").append(excelForm);
	$("#common_excel_form").submit();
	$("#common_excel_form").remove();
}

// msg 메세지
// callBack 예외적 function
// params 추가 파라미터
function modalAlert(msg, callBack, params) {
	var modalAlertHtml = '<div class="modal fade alert_popup" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">';
	modalAlertHtml += '<div class="modal-dialog modal-sm">';
	modalAlertHtml += '<div class="modal-content"><div class="modal-body"><p>';
	modalAlertHtml += msg;
	modalAlertHtml += '</p></div><button type="button" data-dismiss="modal" class="close" aria-label="Close">';
	modalAlertHtml += '<span aria-hidden="true">확인</span>';
	modalAlertHtml += '</button></div></div></div>';
	var modalObj = $('<div id="common_alert_modal"></div>').html(modalAlertHtml);
	
	$("body").append(modalObj);
	$("#common_alert_modal > div").modal();
	
	$('#common_alert_modal').off('hidden.bs.modal');
	$('#common_alert_modal').on('hidden.bs.modal', function () {
		$('#common_alert_modal').remove();
		if (typeof callBack == "function") {
			callBack.call(this, params);
		}
	});
}

var confirmEventFlg = false;
// msg 메세지
// yesCallBack yes일경우 콜백 function
// params 추가 파라미터
function modalConfirm(msg, yesCallBack, params, cancelText, okText, noCallBack) {
	confirmEventFlg = false;
	cancelEventFlg = false;
	var modalAlertHtml = '<div class="modal fade alert_popup style02" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">';
	modalAlertHtml += '<div class="modal-dialog modal-sm">';
	modalAlertHtml += '<div class="modal-content"><div class="modal-body"><p>';
	modalAlertHtml += msg;
	modalAlertHtml += '</p></div><div class="btn_area">';
	modalAlertHtml += '<button id="common_cancel_modal_button" type="button" class="close" data-dismiss="modal" aria-label="Close">';
	modalAlertHtml += '<span id="common_modal_cancelText" aria-hidden="true">취소</span>';
	modalAlertHtml += '</button><button id="common_alert_modal_button" type="button" class="close" data-dismiss="modal" aria-label="Close">';
	modalAlertHtml += '<span id="common_modal_okText" aria-hidden="true">확인</span>';
	modalAlertHtml += '</button></div></div></div></div>';
	var modalObj = $('<div id="common_alert_modal"></div>').html(modalAlertHtml);
	
	if(cancelText) {
		modalObj.find("#common_modal_cancelText").html(cancelText);
	}
	
	if(okText) {
		modalObj.find("#common_modal_okText").html(okText);
	}
	
	$("body").append(modalObj);
	$("#common_alert_modal > div").modal();
	
	$('#common_alert_modal').off('hidden.bs.modal');
	$('#common_alert_modal').on('hidden.bs.modal', function () {
		$('#common_alert_modal').remove();
		if(confirmEventFlg) {
			if (typeof yesCallBack == "function") {
				yesCallBack.call(this, params);
			}
		}
		if(cancelEventFlg) {
			if (typeof noCallBack == "function") {
				noCallBack.call(this, params);
			}
		}
	});
	$('#common_alert_modal_button').off('click');
	$('#common_alert_modal_button').on('click', function () {
		confirmEventFlg = true;
	});
	
	$('#common_cancel_modal_button').off('click');
	$('#common_cancel_modal_button').on('click', function () {
		cancelEventFlg = true;
	});
}

function loadingModal(view) {
	if(view) {
		if($("#loader1").length>0) {
			$("#loader1").show();
		}else {
			$('body').append('<div id="loader1" class="loader_wrap" style="display:none;"><div class="spinner"><img src="/adminLayer/build/css/loading.gif"></div></div>');
			$("#loader1").show();
		}
	}else {
		$("#loader1").hide();
	}
}


$(document).ready(function(){
	$(document).on({'show.bs.modal': function() {
		var zIndex = 1040 + (10 * $('.modal:visible').length);
		$(this).css('z-index', zIndex);
		setTimeout(function() {
			$('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
		}, 0);
	},
	'hidden.bs.modal': function() {
		if ($('.modal:visible').length > 0) {
			// restore the modal-open class to the body element, so that scrolling works
			// properly after de-stacking a modal.
			setTimeout(function() {
				$(document.body).addClass('modal-open');
			}, 0);
		}
	}
	}, '.modal'); 
});