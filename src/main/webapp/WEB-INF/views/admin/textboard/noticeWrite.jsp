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
								<input type="text" class="form-control" placeholder=" Title" name="title" id="title" required="required" style="width: 800px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<!-- style="text-align: center;" -->
								<label for="subTitle" class="col-form-label" style="display: inline-block; margin-right: 30px;">Sub Title</label> <input type="text" class="form-control"
									placeholder=" Sub Title" name="subTitle" id="subTitle"
									required="required"
									style="width: 800px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<!-- style="text-align: center;" -->
								<label for="cUrl" class="col-form-label"
									style="display: inline-block; margin-right: 60px;">URL</label>
								<input type="text" class="form-control" placeholder=" URL"
									name="cUrl" id="cUrl" required="required"
									style="width: 800px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<!--  style="text-align: center;" -->
								<label for="contents" class="col-form-label"
									style="display: inline-block; margin-right: 37px;">Content</label>
								<textarea name="contents" class="form-control" id="contents"
									placeholder="Content"
									style="width: 800px; display: inline-block;"></textarea>
							</div>
							<br> 
							<a href="#" class="glyphicon glyphicon-download-alt"></a>
							<input type="file" id="uploadFile" name="uploadFile" class="upload-hidden"> 
					
<!-- 							<input type="submit" value="등록back" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;" -->
<!-- 							onclick="history.back()"> -->
<!-- 							<input type="submit" value="등록등록" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;" -->
<%-- 							onClick="location.href='${pageContext.request.contextPath}/admin/textboard/noticeResult'"> --%>
<!-- 							저장되지만 ajaxSiteBoardSave로 이동 -->
<!-- 							<button type="submit" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;" -->
<!-- 							formaction="/admin/textboard/noticeList" formmethod = "post">등록버튼</button> -->
<!-- 							저장과 이동 둘다 안됌 -->
<!-- 							<button type="submit" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;" -->
<%-- 							onClick="location.href='${pageContext.request.contextPath}/admin/textboard/noticeList'">등록리스트</button> --%>
<!-- 							저장되지만 ajaxSiteBoardSave로 이동 -->

							<div class="form-group text-right">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<button type="button" class="btn btn-primary" onclick="noWriteObj.fn_list()">취소</button>
									<button type="button" class="btn btn-primary" onclick="noWriteObj.fn_save()">완료</button>	
								</div>
							</div>
							
						</form>
<!-- 						<button type="submit" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;" -->
<%-- 							onClick="location.href='${pageContext.request.contextPath}/admin/textboard/noticeResult'">등록</button>  --%>
						<!-- 이동 잘되지만 저장되지 않음 -->
					</div>
				</div>
			</div>
		</main>
	</div>
    
<script type="text/javascript">
	var seq="${seq}";
	var mode;
	
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
			if(!$('#contents').val() || !$('#contents').val().trim()){
				alert("내용을 입력해주세요.");
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





