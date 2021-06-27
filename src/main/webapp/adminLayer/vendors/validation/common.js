/**
 * JQuery Form Serialize() 함수에서 Checkbox 값 자동으로 추가 기능
 * @Author     : Wonhee. Han
 * @Version    : 2016. 02. 22.
 */
(function ($) {

    $.fn.serialize = function (options) {
        return $.param(this.serializeArray(options));
    };

    $.fn.serializeArray = function (options) {
        var o = $.extend({
        checkboxesAsBools: false
    }, options || {});

    var rselectTextarea = /select|textarea/i;
    var rinput = /text|hidden|password|search/i;

    return this.map(function () {
        return this.elements ? $.makeArray(this.elements) : this;
    })
    .filter(function () {
        return this.name && !this.disabled &&
            (this.checked
            || (o.checkboxesAsBools && this.type === 'checkbox')
            || rselectTextarea.test(this.nodeName)
            || rinput.test(this.type));
        })
        .map(function (i, elem) {
            var val = $(this).val();
            return val == null ?
            null :
            $.isArray(val) ?
            $.map(val, function (val, i) {
                return { name: elem.name, value: val };
            }) :
            {
                name: elem.name,
                value: (o.checkboxesAsBools && this.type === 'checkbox') ? //moar ternaries!
                       (this.checked ? 'true' : 'false') :
                       val
            };
        }).get();
    };

})(jQuery);


/**
 * @param formId : data form id name
 * @param action : data form action url
 * @param method : get / post
 * @param asyncFlag : true / false
 * @param progressFlag : true / false
 * @param title  : Message title
 * @param msg    : Message Contents
 * @param callback : ajax success is callback function
 * @Author     : joon
 * @Version    : 2015. 11. 27.
 */
var jsSubmit = {
	submit : function(formId, action, method, title, msg) {
		if (checkValidation(formId)) {
			jsAlert.confirm(title, msg, "submitExecute('" + formId + "', '" + action + "', '" + method + "')", "");	
		}
	},
	ajaxForm : function(formId, action, method, asyncFlag, progressFlag, title, msg, callback) {
		if (checkValidation(formId)) {
			jsAlert.confirm(title, msg, "ajaxFormExecute('" + formId + "', '" + action + "', '" + method + "', " + asyncFlag+ ", " + progressFlag + ", " + callback + ")", "");	
		}
	},
	ajaxFileForm : function(formId, action, method, asyncFlag, progressFlag, title, msg, callback) {
		if (checkValidation(formId)) {
			jsAlert.confirm(title, msg, "ajaxFileFormExecute('" + formId + "', '" + action + "', '" + method + "', " + asyncFlag+ ", " + progressFlag + ", " + callback + ")", "");	
		}
	},
	ajaxParam : function(params, action, method, asyncFlag, progressFlag, title, msg, callback) {
		jsAlert.confirm(title, msg, "ajaxParamExecute('" + params + "', '" + action + "', '" + method + "', " + asyncFlag+ ", " + progressFlag + ", " + callback + ")", "");	
	}
}

/**
 * ************************************************ 
 * @MethodName : submitExecute
 * @Description: submit function
 * @param formId
 * @param action
 * @param method void
 * @Author     : joon
 * @Version    : 2015. 11. 27.
**************************************************/
function submitExecute(formId, action, method){
	$('#' + formId).prop("method", method);
	$('#' + formId).prop("action", action);
	$('#' + formId).submit();
}

/**
 * ************************************************ 
 * @MethodName : ajaxLoginCheck
 * @Description: 세션 체크 
 * @param request
 * @returns any
 * @Author     : joon
 * @Version    : 2017. 5. 19.
*************************************************
 */
function ajaxLoginCheck(request){
//	console.log(JSON.parse(request.responseText));
	if(request.status == 401) {
		jsAlert.alert("경고", "인증에 실패 했습니다.<br/>로그인 페이지로 이동합니다.", null, fn_goLogin);
	}else if(request.status == 403) {
		jsAlert.alert("경고", "세션이 만료가 되었습니다.<br/>로그인 페이지로 이동합니다.", null, fn_goLogin);
    }else{
    	//fn_goLogin();
    	var msg = JSON.parse(request.responseText);
    	var errors = new Array();
    	errors.push('[' + msg.status + '] ' + msg.error);
    	errors.push(msg.message);
    	
    	jsAlert.alert("경고", "오류가 발생했습니다.<br/>관리자에게 문의해주세요.<br/>" + fn_error_message_box_make(errors));
    }
}

//errors 배열
function fn_error_message_box_make(errors){
	var errorMsg = '<ul class="list-group mt-3" style="max-height: 28rem;overflow-y: auto;overflow-x: hidden;">';
	errorMsg += '<li class="list-group-item list-group-item-sm list-group-item-secondary text-center font-weight-bold">ERROR INFO</li>';
	
	for(var i=0;i<errors.length;i++){
		errorMsg += '<li class="list-group-item list-group-item-sm list-group-item-light">' + errors[i] + '</li>';
	}
	
	errorMsg += '</ul>';
	
	return errorMsg;
}

function fn_goLogin(){
	location.href = base + "/login";
}

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
			if (typeof callback == "function") {
				callback.call(this, data);
			}
		},
		error: function(request,status,error) {
			//$('body').empty().append(data.responseText);
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			if(progressFlag) removeAjaxLoading();
			ajaxLoginCheck(request);
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", true);
			if(progressFlag) appendAjaxLoading();
		},
		complete: function() {
			if(progressFlag) removeAjaxLoading();
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
			if(progressFlag) removeAjaxLoading();		
			ajaxLoginCheck(request);
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", true);
			if(progressFlag) appendAjaxLoading();
		},
		complete: function() {
			if(progressFlag) removeAjaxLoading();
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
			if(progressFlag) removeAjaxLoading();
			ajaxLoginCheck(request);
		},
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", true);
			if(progressFlag) appendAjaxLoading();
		},
		complete: function() {
			if(progressFlag) removeAjaxLoading();
		}
	});
}

/**
 * ************************************************ 
 * @MethodName : appendAjaxLoading
 * @Description: ajax connect before... loading html
 * @Author     : joon
 * @Version    : 2015. 11. 27.
*************************************************
 */
var cnt = 1;
var loadingTld;
function appendAjaxLoading(){
	var loadingHtml = '';
	loadingHtml =  '<div id="ajax-loading" style="position:fixed;left:0;right:0;top:0;bottom:0;z-index:999999;background: rgba(0,0,0,0.2);">\n';
	loadingHtml += '	<div style="position:fixed;top:45%;left:45%;margin-left:-21px;margin-top:-21px;text-align:center;width:300px;">\n';
	loadingHtml += '		<div class="spinner-border text-secondary" role="status" style="color:#6f42c1!important;">\n';
	loadingHtml += '			<span class="sr-only">Loading...</span>\n';
	loadingHtml += '		</div>\n';
	loadingHtml += '	</div>\n';
	loadingHtml += '</div>\n';
	
	$('body').append(loadingHtml);
	
//	loadingTld = setInterval(function(){
//		$('#ajaxLoadingImg').attr("src", "/images/common/loading_" + cnt + ".png");
//		cnt++;
//		if(cnt > 12) cnt = 1;
//	}, 100);	
}

/**
 * ************************************************ 
 * @MethodName : removeAjaxLoading
 * @Description: ajax connect complete... loading html remove
 * @Author     : joon
 * @Version    : 2015. 11. 27.
*************************************************
 */
function removeAjaxLoading(){
	clearInterval(loadingTld);
	$('#ajax-loading').remove();
}

/**
 * ************************************************ 
 * @MethodName : checkValidation
 * @Description: Form children input required check
 * @Sample : <input type="text" name="test" id="test" alt="Field Name" required/>
 * @Sample : Email Check : email="true"
 * @Sample : Number Only Check : numberOnly="true"
 * @Sample : Not Etc Check : notEtc="true"
 * @Sample : Not Number Check : notNumber="true"
 * @Sample : Image File Attach Check : imageFile="true"
 * @Sample : File type : attachFile="zip" or attachFile="xls,xlsx,ppt,pptx"
 * @Sample : Checkbox is checked number : checkNum="2"
 * @param  : formId : data form id name
 * @returns: {Boolean} Boolean
 * @Author     : joon
 * @Version    : 2015. 11. 27.
*************************************************/
function checkValidation(formId) {
	var sw = true;

	$.each($('#' + formId + " :required"), function() {
		// alert("name : " + $(this).attr("name") + ", alt : " +
		// $(this).attr("alt") + ", type : " + $(this).attr("type"));
		var type = $(this).attr("type");
		var fieldName = $(this).attr("alt");

		if (typeof (type) != 'undefined') {
			if (type.toLowerCase() == "checkbox" || type.toLowerCase() == "radio") {
				if(type.toLowerCase() == "checkbox" && typeof ($(this).attr("checkNum")) != 'undefined'  
						&& Number($(this).attr("checkNum")) > 1){
					
					var checkNum = $(this).attr("checkNum");
					var thisCheckNum = $("input:checkbox[name='" + $(this).attr("name") + "']:checked").length;
					
					if(Number(checkNum) > Number(thisCheckNum)){
						jsAlert.alert($.i18n.prop("MSG0004"), $.i18n.prop("MSG0005", fieldName, checkNum), $(this));
//						$(this).focus();
						sw = false;
						return false;
					}
					
				}else{
					if (!$('input:' + type + '[name="' + $(this).attr("name") + '"]').is(":checked")) {
						jsAlert.alert($.i18n.prop("MSG0004"), fieldName + " : " + $.i18n.prop("MSG0006"), $(this));
//						$(this).focus();
						sw = false;
						return false;
					}
				}
			} else {
				var inputMsg = $.i18n.prop("MSG0006");
				if (type.toLowerCase() == "file")
					inputMsg = $.i18n.prop("MSG0007");
				else if (type.toLowerCase() != "select")
					inputMsg = $.i18n.prop("MSG0008");

				if ($(this).val() == "" || $(this).val() == null) {
					jsAlert.alert($.i18n.prop("MSG0004"), fieldName + " : " + inputMsg, $(this));
//					$(this).focus();
					sw = false;
					return false;
				} else if (type.toLowerCase() != "select") {
					var min = $(this).attr("min");
					var max = $(this).attr("max");

					if ($(this).attr("email")) {
						if (!inputValueCheck($(this), "EM", min, max)) {
							$(this).focus();
							sw = false;
						}
					} else if ($(this).attr("numberOnly")) {
						if (!inputValueCheck($(this), "ON", min, max)) {
							$(this).focus();
							sw = false;
						}
					} else if ($(this).attr("notEtc")) {
						if (!inputValueCheck($(this), "!E", min, max)) {
							$(this).focus();
							sw = false;
						}
					} else if ($(this).attr("notNumber")) {
						if (!inputValueCheck($(this), "!N", min, max)) {
							$(this).focus();
							sw = false;
						}
					} else if ($(this).attr("imageFile")) {
						if (!inputValueCheck($(this), "IF", min, max)) {
							$(this).focus();
							sw = false;
						}
					} else {
						if (!inputValueCheck($(this), "", min, max)) {
							$(this).focus();
							sw = false;
						}
					}

					if (!sw)
						return false;
				}
			}
		} else {
			if($(this).is("textarea")){
				var min = $(this).attr("min");
				var max = $(this).attr("max");
				var valLength = $(this).val().replace(/[\0-\x7f]|([0-\u07ff]|(.))/g, "$&$1$2").length;
				
				if(trim($(this).val()) == ""){
					jsAlert.alert($.i18n.prop("MSG0004"), fieldName + " : " + $.i18n.prop("MSG0008"), $(this));
	//				$(this).focus();
					sw = false;
					return false;
				}else if(Number(min) > 0 && Number(max) > 0 && (valLength < Number(min) || valLength > Number(max)) ){
					var objName = $(this).attr("alt");
					jsAlert.alert($.i18n.prop("MSG0004"), $.i18n.prop("MSG0011", objName, min, max, valLength), $(this));		
					sw = false;
					return false;
				}
			}else{
				jsAlert.alert($.i18n.prop("MSG0004"), fieldName + " : " + $.i18n.prop("MSG0009"), $(this));
//				$(this).focus();
				sw = false;
				return false;
			}			
		}
	});

	return sw;
}

function fn_inputLenthValueCheck(obj, len1, len2){
	var str = $(obj).val();
	var objName = $(obj).attr("alt");
	var sw = true;
	
	var valLength = str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g, "$&$1$2").length;

	if (valLength < len1 || valLength > len2) {
		jsAlert.alert($.i18n.prop("MSG0004"), $.i18n.prop("MSG0011", objName, len1, len2, valLength), obj);		
		sw = false;
		return false;
	}
	
	return sw;
}

/**
 * input value check
 * 
 * @param obj(Object)
 * @param type(String)
 *            Check Type String - !N : Not in Number - !E : Not in Etc - ON :
 *            Only Number - EM : Email form Check
 * 
 * @param len1(integer)
 *            length Check from
 * @param len2(integer)
 *            length Check to
 */
function inputValueCheck(obj, type, len1, len2) {

	var str = $(obj).val();
	var objName = $(obj).attr("alt");
	var keycode = "";
	var sw = true;

	// input value Null Check
	if ((str == "" || str == null) && len1 > 0) {
		jsAlert.alert($.i18n.prop("MSG0004"), objName + ": " + $.i18n.prop("MSG0010"), '');
		sw = false;
		return false;
	}

	// input value length Check
	var valLength = str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g, "$&$1$2").length;

	if (valLength < len1 || valLength > len2) {
		jsAlert.alert($.i18n.prop("MSG0004"), $.i18n.prop("MSG0011", objName, len1, len2, valLength), obj);		
		sw = false;
		return false;
	}
	
	// Only Number
	if (type == "ON") {
		if (!(Number(str) >= len1 && Number(str) <= len2)) {
			jsAlert.alert($.i18n.prop("MSG0004"), $.i18n.prop("MSG0020", objName, str, len1, len2), obj);
			sw = false;
			return false;
		}
	}
	
	// input value Check
	for (var i = 0; i < valLength; i++) {
		ch_char = str.charAt(i);
		keycode = ch_char.charCodeAt();
//		// Only Number
//		if (type == "ON") {
//			if (!((keycode >= 48 && keycode <= 57)
//					|| (keycode >= 96 && keycode <= 105) || keycode == 8)) {
//				jsAlert.alert($.i18n.prop("MSG0004"), objName + " : " + $.i18n.prop("MSG0012"), obj);
//				sw = false;
//				return false;
//			}
//		}

		// Not in Number
		if (type.indexOf("!N") != -1) {
			if ((keycode >= 48 && keycode <= 57)
					|| (keycode >= 96 && keycode <= 105) || keycode == 8) {
				jsAlert.alert($.i18n.prop("MSG0004"), objName + " : " + $.i18n.prop("MSG0013"), obj);
				sw = false;
				return false;
			}
		}

		// Image File Check
		if (type.indexOf("IF") != -1) {
			var file = $(obj).val().split('\\').pop();
			file = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
			if ($.inArray(file, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				jsAlert.alert($.i18n.prop("MSG0004"), $.i18n.prop("MSG0014", objName), obj);
				$(obj).val("");
				sw = false;
				return false;
			}
		}

		// Not in Etc
		if (type.indexOf("!E") != -1) {
			if ((keycode >= 33 && keycode <= 47)
					|| (keycode >= 58 && keycode <= 64)
					|| (keycode >= 91 && keycode <= 96)
					|| (keycode >= 123 && keycode <= 126)) {
				jsAlert.alert($.i18n.prop("MSG0004"), objName + " : " + $.i18n.prop("MSG0015"), obj);
				sw = false;
				return false;
			}
		}
	}

	// Email form Check
	if (type.indexOf("EM") != -1) {
		var mailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if (!mailCheck.test(str)) {
			jsAlert.alert($.i18n.prop("MSG0004"), objName + " : " + $.i18n.prop("MSG0016"), obj);
			sw = false;
			return false;
		}
	}

	return sw;
}

/**
 * @Description : JQuery Alert or Confirm
 * @param : title
 * @param : msg
 * @param : trueCallback
 * @param : falseCallback
 */
var jsAlert = {
	alert : function(title, msg, obj, callback, okBtnNm) {
		if(isEmpty(title)) title = $.i18n.prop("MSG0017");
		jAlert(msg, title, okBtnNm, function(result){
			if (result) {
				if (typeof (obj) != 'undefined') $(obj).focus();
				if (typeof callback == "function") {
					appendAjaxLoading();
					setTimeout(function(){
						removeAjaxLoading();
						callback.call(this);
					}, 500);
				}
			}
		});
	},
	confirm : function(title, msg, trueCallback, falseCallback, okBtnNm, cancelBtnNm) {
		if(isEmpty(title)) title = $.i18n.prop("MSG0018");
		jConfirm(msg, title, okBtnNm, cancelBtnNm, function(result) {
			if (result) {
				if (typeof trueCallback == "function") {
					appendAjaxLoading();
					setTimeout(function(){ 
						removeAjaxLoading();
						trueCallback.call(this); 
					}, 500);
				}else{
					appendAjaxLoading();
					setTimeout(function(){ 
						removeAjaxLoading();
						eval(trueCallback); 
					}, 500);
				}
			} else {
				if (typeof falseCallback == "function") {
					appendAjaxLoading();
					setTimeout(function(){ 
						removeAjaxLoading();
						falseCallback.call(this); 
					}, 500);
				}
			}
		});
	},
	prompt : function(title, msg, inputVal, callback) {
		jPrompt(msg, inputVal, title, function(r) {
		    if( r ) {
//			    	alert('You entered ' + r);
	    		inputVal.val(r);
	    		if (typeof callback == "function") {
	    			appendAjaxLoading();
					setTimeout(function(){ 
						removeAjaxLoading();
						callback.call(this); 
					}, 500);
				}
		    } else {
		    	appendAjaxLoading();
		    	setTimeout(function(){ 
		    		removeAjaxLoading();
		    		jsAlert.alert(title, msg, ""); 
		    	}, 500);
		    }
		});
	}
}

function delChar(str, ch) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 문자열에서 특정문자를 제거한 새로운 문자열을 만든다. str : 문자열 ch : 제거할 문자
	 * **********************************************************************************************************
	 */
	var len = str.length;
	var ret = "";

	// 문자열에서 ch 문자를 제거한다. 예) , - 등등
	for (i = 0; i < len; ++i) {
		if (str.substring(i, i + 1) != ch)
			ret = ret + str.substring(i, i + 1);
	}

	return ret;
}

function replace(str, oldChar, newChar) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 문자열에서 특정문자를 다른 문자로 치환한 새로운 문자열을 만든다. str : 문자열 oldChar : 바꾸기 전의 문자
	 * newChar : 바꿔서 넣을 문자
	 * **********************************************************************************************************
	 */
	var oldstr = "";

	while (oldstr != str) {
		oldstr = str;
		str = str.replace(oldChar, newChar);
	}

	return str;
}

function lTrim(str) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 문자열에서 왼쪽의 공백을 제거한다. str : 문자열
	 * **********************************************************************************************************
	 */
	var i;
	i = 0;
	while (str.substring(i, i + 1) == ' ' || str.substring(i, i + 1) == '　')
		i = i + 1;
	return str.substring(i);
}

function rTrim(str) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 문자열에서 오른쪽의 공백을 제거한다. str : 문자열
	 * **********************************************************************************************************
	 */

	var i = str.length - 1;
	while (i >= 0
			&& (str.substring(i, i + 1) == ' ' || str.substring(i, i + 1) == '　'))
		i = i - 1;
	return str.substring(0, i + 1);
}

function trim(str) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 문자열에서 양쪽의 공백을 제거한다. str : 문자열
	 * **********************************************************************************************************
	 */
	if (str == "" || str.length == 0) {
		return str;
	} else {
		return (lTrim(rTrim(str)));
	}
}

// 오른쪽에 ch 문자 채우기

function rPadString(str, ch, len) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 문자열을 정해진 길이만큼 오른쪽을 특정 문자로 채운다. str : 문자열 len : 총길이
	 * **********************************************************************************************************
	 */
	var strlen = trim(str).length;
	var ret = "";
	var alen = len - strlen;
	var astr = "";

	// 부족한 숫자만큼 len 크기로 ch 문자로 채우기
	for (i = 0; i < alen; ++i) {
		astr = astr + ch;
	}

	ret = trim(str) + astr; // 뒤에서 채우기
	return ret;
}

function lPadString(str, ch, len) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 문자열을 정해진 길이만큼 왼쪽을 특정 문자로 채운다. str : 문자열 len : 총길이
	 * **********************************************************************************************************
	 */
	var strlen = trim(str).length;
	var ret = "";
	var alen = len - strlen;
	var astr = "";

	// 부족한 숫자만큼 len 크기로 ch 문자로 채우기
	for (i = 0; i < alen; ++i) {
		astr = astr + ch;
	}

	ret = astr + trim(str); // 앞에서 채우기
	return ret;
}

function formatComma(argStr) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 숫자를 세자리마다 컴마를 찍은 형식으로 바꾸어 준다. argStr : argument
	 * **********************************************************************************************************
	 */
	if (argStr == null)
		return;
	var argStr = argStr + ""; // 숫자인 경우 문자열로 변환
	var rule = /[^0-9-.]/g; // 숫자, 부호 및 소수점 이외의 데이터 제거

	argStr = getFilledCommaStr(argStr.replace(rule, ""));
	return argStr;
}

function getFilledCommaStr(argNumber) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 숫자에 천단위로 ','를 붙여서 반환 argNumber : 숫자
	 * **********************************************************************************************************
	 */
	argNumber = argNumber.toString();

	if (isEmpty(argNumber))
		return argNumber;

	// 숫자 항목에서 부호(-), 소수점(.) 체크
	var sourceStr = trim(argNumber);
	var signStr = ""
	var dotStr = "";

	if (sourceStr.substring(0, 1) == "-") {
		signStr = "-";
		sourceStr = sourceStr.substring(1, sourceStr.length);
	}
	if (sourceStr.indexOf(".") >= 0) {
		dotStr = sourceStr.substring(sourceStr.indexOf("."), sourceStr.length);
		sourceStr = sourceStr.substring(0, sourceStr.indexOf("."));
	}

	var sourceLen = sourceStr.length;
	var filledStr = "";
	var checkIdx = 0;

	for (var idx = sourceLen - 1; idx >= 0; idx--) {
		if (checkIdx++ % 3 == 0 && idx != sourceLen - 1) {
			filledStr = "," + filledStr;
			checkIdx = 1;
		}
		filledStr = sourceStr.substring(idx, idx + 1) + filledStr;
	}
	return signStr + filledStr + dotStr;
}

function formatDate(str, mark) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 날짜형식으로 년,월,일 사이에 구분자를 넣어준다. str : 날짜가 YYMMDD형식으로 담겨있는 문자열 mark :
	 * 년,월,일 사이에 들어갈 구분자
	 * **********************************************************************************************************
	 */
	if (str != "" && str.length == 8) {
		return str.substring(0, 4) + mark + str.substring(4, 6) + mark
				+ str.substring(6, 8);
	} else {
		return "";
	}
}

function setToday(field) {
	/*
	 * ***************************************************************************************************
	 * 함수설명: 입력란을 오늘날짜로 채워준다.
	 * 
	 * field : html에서 name으로 지정된 입력필드의 명
	 * 
	 * 사용예
	 * ***************************************************************************************************
	 */
	var cDate = new Date();
	var year = cDate.getYear();
	var month = (cDate.getMonth() + 1).toString();
	month = month.length == 1 ? "0" + month : month;
	var day = cDate.getDate().toString();
	day = day.length == 1 ? "0" + day : day;
	field.value = "" + year + month + day;
}

function setMonthFirstDay(field) {
	/*
	 * ***************************************************************************************************
	 * 함수설명: 입력란을 이번달의 첫날로 채워준다..
	 * 
	 * field : html에서 name으로 지정된 입력필드의 명
	 * 
	 * 사용예
	 * ***************************************************************************************************
	 */
	var cDate = new Date();
	var year = cDate.getYear();
	var month = (cDate.getMonth() + 1).toString();
	month = month.length == 1 ? "0" + month : month;
	var day = "01";
	field.value = "" + year + month + day;
}

function setYearFirstDay(field) {
	/*
	 * ***************************************************************************************************
	 * 함수설명: 입력란을 올해 1월1일로 채워준다.
	 * 
	 * field : html에서 name으로 지정된 입력필드의 명
	 * 
	 * 사용예
	 * ***************************************************************************************************
	 */

	var cDate = new Date();
	var year = cDate.getYear();
	var month = "01";
	var day = "01";
	field.value = "" + year + month + day;
}

function setOneMonthBefore(field) {
	/*
	 * ***************************************************************************************************
	 * 함수설명: 입력란을 오늘보다 한달전의 날짜로 채워준다..
	 * 
	 * field : html에서 name으로 지정된 입력필드의 명
	 * 
	 * 사용예
	 * ***************************************************************************************************
	 */
	var cDate = new Date();
	var year = cDate.getYear();
	var month = (cDate.getMonth()).toString();
	month = month.length == 1 ? "0" + month : month;
	if (month == "00") {
		month = "12";
		year--;
	}
	var day = cDate.getDate().toString();
	day = day.length == 1 ? "0" + day : day;
	field.value = "" + year + month + day;
}

function setOneYearBefore(field) {
	/*
	 * ***************************************************************************************************
	 * 함수설명: 입력란을 오늘보다 1년전의 날짜로 채워준다..
	 * 
	 * field : html에서 name으로 지정된 입력필드의 명
	 * 
	 * 사용예
	 * ***************************************************************************************************
	 */
	var cDate = new Date();
	var year = cDate.getYear() - 1;
	var month = (cDate.getMonth() + 1).toString();
	month = month.length == 1 ? "0" + month : month;
	var day = cDate.getDate().toString();
	day = day.length == 1 ? "0" + day : day;
	field.value = "" + year + month + day;
}

function isEmpty(str) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 문자열이 빈문자열 혹은 공백만 있는 문자열이지 검사한다. str : 문자열
	 * **********************************************************************************************************
	 */
	if (trim(str) == '')
		return true;
	return false;

}

function isContains(str, ch) {
	/*
	 * ********************************************************************************************************
	 * 함수설명: 문자열이 특정문자열을 포함하고 있는지 체크한다. str : 특정문자 포함여부를 체크할 대상 문자열 ch : 지정된
	 * 특정문자
	 * 
	 * **********************************************************************************************************
	 */
	var i = 0;
	for (i = 0; i < str.length; i++) {
		if (str.charAt(i) == ch)
			return true;
	}
	return false;
}

function isContainsOnly(str, chars) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 해당문자열이 지정된 문자들만을 포함하고 있는지 검사한다. str : 검사할 문자열 chars : 지정된 문자들의 나열
	 * **********************************************************************************************************
	 */
	for (var inx = 0; inx < str.length; inx++) {
		if (chars.indexOf(str.charAt(inx)) == -1)
			return false;
	}
	return true;
}

function isUnderMaxLen(strName, str, maxLen) {
	/*
	 * ********************************************************************************************************
	 * 함수설명: 문자열의 글자수체크를 한다. checkInputLength 등의 함수 내에서 호출된다. StrName : 글자수 체크를
	 * 할 문자열의 한글명칭. 에러 메시지 출력 시에 사용한다. str : 글자 수 체크를 할 문자열 maxLen : 해당 필드의
	 * 최대글자수 (한글2,영문1)
	 * 
	 * **********************************************************************************************************
	 */
	var i, len = 0;
	var korLen = maxLen / 2;

	for (i = 0; i < str.length; i++)
		(str.charCodeAt(i) > 255) ? len += 2 : len++;
	if (maxLen < len) {
		alert($.i18n.prop("MSG0019", strName, maxLen, korLen, len));
		
		return false;
	}
	return true;
}

function isValidDay(year, month, day) {
	/*
	 * ********************************************************************************************************
	 * 함수설명 : 지정하는 년,월,일이 달력상으로 존재하는 날짜인지 검사한다. year : 년 month : 월 day : 일
	 * **********************************************************************************************************
	 */
	var m = parseInt(month, 10) - 1;
	var d = parseInt(day, 10);

	var end = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
		end[1] = 29;
	}

	return (d >= 1 && d <= end[m]);
}

function checkInputNumber(fieldCalledName, field) {
	/*
	 * ***************************************************************************************************
	 * 함수설명: 입력란에 숫자만이 입력되는지 체크한다.
	 * 
	 * fieldCalledName : 글자수 체크를 할 입력필드의 한글명칭. 에러 메시지 출력 시에 사용한다. field : html에서
	 * name으로 지정된 입력필드 객체
	 * 
	 * 사용예
	 * ***************************************************************************************************
	 */
	if (field.value != "") {
		if (!isContainsOnly(field.value, "0123456789")) {
			alert(fieldCalledName + $.i18n.prop("MSG0023"));
			field.focus();
			field.value = field.value.substring(0, field.value.length - 1);
			return false;
		}
	}
	return true;
}

function checkNumber(fieldCalledName, field, min, max) {
	/*
	 * ***************************************************************************************************
	 * 함수설명: 입력란에 최종적으로 적합한 범위내의 숫자가 들어왔는지 검사한다.
	 * 
	 * fieldCalledName : 글자수 체크를 할 입력필드의 한글명칭. 에러 메시지 출력 시에 사용한다. field : html에서
	 * name으로 지정된 입력필드 객체 min : 최소값 max : 최대값
	 * 
	 * 사용예
	 * ***************************************************************************************************
	 */

	field.value = trim(field.value);
	if (!checkInputNumber(fieldCalledName, field)) {
		return false;
	}

	var fieldNumber = parseInt(field.value);
	if (!(fieldNumber >= min && fieldNumber <= max)) {
		alert($.i18n.prop("MSG0020", fieldCalledName, parseInt(field.value), min, max));
		
		field.focus();
		return false;
	}
	return true;
}

/*
 * ********************************************************************************************************
 * 함수설명 : 문자열에서 문자간의 공백을 제거한다. str : 문자열
 * **********************************************************************************************************
 */
function PerfactTrim(val) {
	var rtnVal = "";
	var len = val.length;

	for (var i = 0; i < len; i++) {
		if (val.substring(i, i + 1) != " ") {
			rtnVal = rtnVal + val.substring(i, i + 1);
		}
	}

	return rtnVal;
}

/**
 * @description 토스트 메시지
 * @param title		제목
 * @param message	내목
 * @param delayTime	메시지 창 노출시간
 * @returns
 */
function show_toast(title, message, delayTime){
	$('#toast-title').html(title);
	$('#toast-body').html(message);
	
	if(typeof(delayTime) == undefined || delayTime == null || delayTime == '') delayTime = 5;
	
	$('#commonToast').attr('data-delay', delayTime * 1000);
	$('#commonToast').parent().css('z-index', '1051');
	$('#commonToast').toast('show');
}

//콜백 공통
/**
 * @description 공통 콜백 메서드
 * @param data
 * @param msgType 배너정보, 환경설정, 셀럽정보 등
 * @param josa 이/가, 을/를, 은/는, 와/과
 * @param modeType 등록, 수정, 삭제 등
 * @returns
 */
function fn_common_callback(data, msgType, josa, modeType){
	if(data.sw){
		jsAlert.alert('확인', Josa.r(msgType, josa) + ' ' + modeType + ' 되었습니다.', null, fn_common_reload, '확인');
	}else{
		var errors = new Array();
    	errors.push(data.msg);
		
		jsAlert.alert('경고', msgType + ' ' + modeType +  ' 중 알수 없는 오류가 발생했습니다.<br/>관리자에게 문의해주세요.<br/>' + fn_error_message_box_make(errors));
	}
}

//페이지 리로드
function fn_common_reload(){
	location.reload();
}

function fn_common_callback_back(data, msgType, josa, modeType){
	if(data.sw){
		console.log('callback success!!');
		jsAlert.alert('확인', Josa.r(msgType, josa) + ' ' + modeType + ' 되었습니다.', null, fn_common_back, '확인');
	}else{
		var errors = new Array();
    	errors.push(data.msg);
		
		jsAlert.alert('경고', msgType + ' ' + modeType +  ' 중 알수 없는 오류가 발생했습니다.<br/>관리자에게 문의해주세요.<br/>' + fn_error_message_box_make(errors));
	}
}

function fn_common_back(){
	console.log('11111');
	history.go(-1);
}