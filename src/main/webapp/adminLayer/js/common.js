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
			/*if(data.status) {
				if(data.status==999) {
					modalAlert(data.message);
					return;
				}
			}*/
			if (typeof callback == "function") {
				callback.call(this, data);
			}
		},
		error: function(request,status,error) {
			/*if(request.status == 401) {
				modalAlert("로그아웃 되었습니다.", function(){
					location.href="/";
					return;
				});
			}*/
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