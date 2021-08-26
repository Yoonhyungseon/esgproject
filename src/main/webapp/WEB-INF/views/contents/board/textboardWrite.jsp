<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<style>
.container {
	width: 750px%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
</style>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Board</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="../index">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>Upload Posting</li>

			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<!-- Write Posting -->
<section class="w3l-form-comments-sec mt-5 ">
	<div class="container ">
		<h3 class="title-big mb-4 pb-2">Write your posting</h3>
		<div class="form-commets">
			<form id="siteFrm" name="siteFrm" enctype="multipart/form-data"	method="post" data-parsley-validate>
				<div class="row mb-4">
					<div class="col-md-6">
						<input type="text" name="title" id="title" required="required" placeholder="Posting Title">
					</div>
					<br>
					<div class="col-md-6 mt-md-0 mt-4">
						<input type="file" name="postImage" id="postImage" required="required" class="upload-hidden">
					</div>
				</div>
				<TEXTAREA id="contents" name="contents"  required="required" style="width: 100%; display: inline-block;" rows="15" cols="200"></TEXTAREA>
				<input type="text" name="hashTag" id="hashTag" placeholder="Hash Tag" style="margin-top: 1.5rem; margin-bottom: 1.5rem !important;">
				<button class="btn button-style d-flex ml-auto" type="button" onclick="noWriteObj.fn_save()">Posting</button>
			</form>
		</div>
	</div>
</section>
<!-- //Write Posting -->
<script type="text/javascript">
	function replaceAll(str, searchStr, replaceStr) {
		return str.split(searchStr).join(replaceStr);
	}

	let noWriteObj = {

		fn_siteInfoReturn : function(rst) {
			console.log(rst);
		},
		fn_view : function() {
			$("#siteFrm").prop("action", "/board/textboardList");
			$("#siteFrm").submit();
		},
		fn_save : function() {
			if (!$('#title').val() || !$('#title').val().trim()) {
				alert("제목을 입력해주세요.");
				$('#title').focus();
				return false;
			}
			if ($('#postImage').val() =="") {
				alert("사진을 첨부해주세요.");
				$('#postImage').focus();
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
				//$('#contents').focus();
				return false;
			}
			
			if (confirm('등록하시겠습니까?'))
				ajaxFileFormExecute("siteFrm", "/board/posting", "post", false,	false, noWriteObj.fn_saveReturn);
		},
		fn_saveReturn : function(rst) {
			if (rst) {
				alert('등록되었습니다.');
				console.log(rst);
				noWriteObj.fn_view();
			} else {
				alert('등록에 실패하였습니다. \n관리자에게 문의바랍니다.');
			}
		}
	}
</script>

<!-- 스마트 에디터2 -->
<script type="text/javascript"
	src="/adminLayer/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	var oEditors = [];

	var sLang = "ko_KR"; // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "contents",
		sSkinURI : "/adminLayer/js/smarteditor2/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function() {
				//alert("완료!");
			},
			I18N_LOCALE : sLang
		}, //boolean
		fOnAppLoad : function() {
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator : "createSEditor2"
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
<!-- 스마트 에디터2 -->
<!--script-->
<button onclick="topFunction()" id="movetop" title="Go to top">
	<span class="fa fa-level-up" aria-hidden="true"></span>
</button>
<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			document.getElementById("movetop").style.display = "block";
		} else {
			document.getElementById("movetop").style.display = "none";
		}
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>
<!-- //move top -->
