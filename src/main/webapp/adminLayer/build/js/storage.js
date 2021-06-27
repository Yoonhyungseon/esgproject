$(document).ready(function(){
//	showStorage();
});

//로컬스토리지 저장
function setLocalStorage(key, value){
	localStorage.setItem(key, value);
}

//로컬스토리지 조회
function getLocalStorage(key){
	var value = localStorage.getItem(key);
	//console.log("local storage data :::: key : " + key + ", value : " + value);
	return value;
}

//로컬스토리지 항목 삭제
function removeLocalStorage(key){
	localStorage.removeItem(key);
}

//세션스토리지에 저장
function setSessionStorage(key, value){
	sessionStorage.setItem(key, value);
}

//세션스토리지 조회
function getSessionStorage(key){
	var value = sessionStorage.getItem(key);
	//console.log("session storage data :::: key : " + key + ", value : " + value);
	return value;
}

//세션스토리지 항목 삭제
function removeSessionStorage(key){
	sessionStorage.removeItem(key);
}

//스토리지 초기화
function setStorageReset(){
	localStorage.clear();
	sessionStorage.clear();
}

//스토리지 초기화
function setLogoutStorageReset(){
	
}

//인덱스 / 로그인 이동 시 스토리지 초기화
function setClearStorage(){
	
}

//스토리지 전체 조회
function showStorage(){
	for(var i=0;i<localStorage.length;i++){
		var key = localStorage.key(i);
		var value = localStorage[key];
		console.log("localStorage :::: i : " + i + ", key : " + key + ", value : " + value);
	}

	var lsData = localStorage.getItem("lsData");
	console.log("lsData :::: " + lsData);
	var json = JSON.parse(lsData);
	if(json != null){
		$.each(json, function(key, value){
			console.log("key : " + key + ", value : " + json[key]);
		});
	}

	for(var i=0;i<sessionStorage.length;i++){
		var key = sessionStorage.key(i);
		var value = sessionStorage[key];
		console.log("sessionStorage :::: i : " + i + ", key : " + key + ", value : " + value);
	}
}

function storageNotEmpty(storage){
	sw = true;
	if(storage == null || storage == "" ||  storage == "null") sw = false;
	return sw;
}