<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var = "modeText" value = "등록"/>
<c:choose>
	<c:when test = "${mode != 'MOD'}">
		<c:set var = "modeText" value = "등록" />	
	</c:when>
	<c:otherwise>
		<c:set var = "modeText" value = "수정"/>
	</c:otherwise>
</c:choose>

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index">ESG: 관리자</a></li>
					<li class="breadcrumb-item active">공지사항</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 공지사항 ${modeText}
					</div>
					<div class="card-body">
						<form id="siteFrm" name="siteFrm" enctype= "multipart/form-data" method="post" data-parsley-validate class="form-horizontal form-label-left">
							<!-- <sec:csrfInput /> -->
							<div class="form-group">
								<label for="title" class="col-form-label" style="display: inline-block; margin-right: 60px;">Title</label>
								<input type="text" class="form-control" placeholder=" Title" name="title" id="title" required="required" style="width: 1400px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<!-- style="text-align: center;" -->
								<label for="subTitle" class="col-form-label" style="display: inline-block; margin-right: 28px;">Sub Title</label> <input type="text" class="form-control"
									placeholder=" Sub Title" name="subTitle" id="subTitle"
									required="required"
									style="width: 1400px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<!-- style="text-align: center;" -->
								<label for="cUrl" class="col-form-label"
									style="display: inline-block; margin-right: 62px;">URL</label>
								<input type="text" class="form-control" placeholder=" URL"
									name="cUrl" id="cUrl" required="required"
									style="width: 1400px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<label for="contents" class="col-form-label" style="display: inline-block; margin-right: 37px;">Contents</label>
								<div class="col-sm-6 col-xs-12" style="width:1400px; margin-left:100px;">
									<TEXTAREA id="contents" name="contents" style="width:100%; display: inline-block;" rows="15" cols="200" class="form-control col-md-7 col-xs-12" required="required"></textarea>
								</div>
							</div>	
					
							<br> 
							<a href="#" class="glyphicon glyphicon-download-alt"></a>
							<input type="file" id="uploadFile" name="uploadFile" class="upload-hidden" style="margin: auto;display: block;">

							<div class="form-group">
								<div style="float: right;">
									<button type="button" class="btn btn-primary" onclick="noWriteObj.fn_list()">취소</button>
									<button type="button" class="btn btn-primary" onclick="noWriteObj.fn_save()">완료</button>	
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
	</div>
    
<script type="text/javascript">
	var seq="${seq}";
	var mode;
	
	function replaceAll(str, searchStr, replaceStr) {
		return str.split(searchStr).join(replaceStr);
	}
	
	$(document).ready(function(){
		if(seq) mode = 'MOD';
		else mode = 'INS';
			
		if (mode=="MOD"){
			ajaxParamExecute("seq="+seq, "/admin/textboard/getNoticeInfo", "post", false, false, noWriteObj.fn_siteInfoReturn);
		}
	});
	
	let noWriteObj = {
			
		fn_siteInfoReturn : function(rst){
			console.log(rst);
			
			
		},
		fn_list : function(){
			$("#siteFrm").prop("action", "/admin/textboard/noticeList");
			$("#siteFrm").submit();
		},
		fn_view : function(seq){
			$("#siteFrm").prop("action", "/admin/textboard/noticeList");
			$("#siteFrm").submit();
		},
		
		
		fn_save : function(){
			if(!$('#title').val() || !$('#title').val().trim()){
				alert("제목을 입력해주세요.");
				$('#title').focus();
				return false;
			}
			if(!$('#subTitle').val() || !$('#subTitle').val().trim()){
				alert("부재목을 입력해주세요.");
				$('#subTitle').focus();
				return false;
			}
			
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var text = $('#contents').val();
			var texttrim = replaceAll(text, ' ', '');
			texttrim = replaceAll(texttrim, ' ', '');
			texttrim = replaceAll(texttrim, '<p></p>', '');
			texttrim = texttrim.replace(/(<p>)*(\s*&nbsp;)*(<\/p>)*(<p><br><\/p>)*/g,'');
			
			if(texttrim=="" || texttrim=='&nbsp;' || texttrim == '<br>' || texttrim == '<br/>' || texttrim == '<p>&nbsp;</p>' || texttrim == '<p></p>'){
				alert('내용을 입력해주세요.');
				$('#contents').focus();
				return false;
			}
			if(confirm('${modeText}하시겠습니까?'))
				ajaxFileFormExecute("siteFrm", "/admin/textboard/ajaxSiteBoardSave", "post", false, false, noWriteObj.fn_saveReturn);
			
		},
		fn_saveReturn : function(rst){
			if(rst){
				alert('${modeText}되었습니다.');
				console.log(rst);
				if (rst.seq != ""){
					noWriteObj.fn_view();
				}
				else{
					noWriteObj.fn_list();
				}
			}else{
				alert('${modeText}에 실패하였습니다. \n관리자에게 문의바랍니다.');
			}
		}
	}
</script>

<!-- 스마트 에디터2 -->
<script type="text/javascript" src="/adminLayer/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	var oEditors = [];

	var sLang = "ko_KR"; // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "contents",
		sSkinURI: "/adminLayer/js/smarteditor2/SmartEditor2Skin.html", 
		htParams : {
			bUseToolbar : true,    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,   // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				//alert("완료!");
				},
				I18N_LOCALE : sLang
			}, //boolean
			fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});

	function pasteHTML(filepath) {

		 var sHTML = '<span style="color:#FF0000;"><img src="'+filepath+'"></span>';
		 oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["contents"].getIR();
		alert(sHTML);
	}
					
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["contents"].setDefaultFont(sDefaultFont, nFontSize);
	}

	function writeReset() {
		document.f.reset();
		oEditors.getById["contents"].exec("SET_IR", [""]);
	}
	
</script>