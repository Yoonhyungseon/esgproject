<%@ page contentType="text/html;charset=UTF-8" language="java"%>

	<div id="layoutSidenav_content">
		<div class="container-fluid px-4">
			<h1 class="mt-4">게시판 관리</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index">ESG: 관리자</a></li>
				<li class="breadcrumb-item active">공지사항</li>
			</ol>
			<div class="card mb-4">
				<div class="card-header">
					<div class="sb-nav-link-icon">
						<i class="fas fa-book-open"></i> 공지사항
					</div>
				</div>
				<div class="card-body">
					<div id="req_seq" style="display:none">${seq}</div>
					<h2 id="req_title" style="margin: auto; display: block;">${title}</h2>
					
					<h5 id="req_date" class="date" style="float: right;">${regDtYmd}</h5>
					<div class="blog-img-single">
						<img id="req_file" style="width: 500px; height: 350px; margin: auto; display: none; padding: 20px;" />
					</div>
					<h3 id="req_subTitle" style="margin: auto; display: block;">${subTitle}</h3>
					<br> <br>
					<p id="req_url">${cUrl}</p>

					<div class="form-group">
						<div style="overflow-y:auto;">
							<div style="margin-top:10px;" id="contents"></div>
						</div>
					</div>					
					<div
						class="blog-single-tags d-flex align-items-center mt-4 pt-1 mb-5">
					</div>
					<div class="single-pagination clearfix">
						<a class="" onclick="noticeObj.fn_getNoticePrev()"> <span
							class="fa fa-arrow-left" aria-hidden="true"></span> Previous Post
						</a> <a class="" style="float: right;" onclick="noticeObj.fn_getNoticeNext()">Next Post <span
							class="fa fa-arrow-right" aria-hidden="true"></span>
						</a>
					</div>
				</div>
				<div class="row" style="display: inline; padding: 1rem 1.1rem;">
					<div class="btn_area">
						<div class="btn_right" style="margin-top: 10px; float: right;">
							<a class="btn btn-primary btn-block myform" href="noticeList"
								style="color: white !important;">목록</a>
							<!-- <a class="btn btn-primary btn-block myform" href="companiesWrite" style="color: white!important;">수정</a> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    $(document).ready(function(){
    	noticeObj.fn_getNoticeInfo('${seq}');
    });
    
    let noticeObj = {
    	fn_getNoticeInfo : function(seq) {
    		var param = "seq="+seq;
			ajaxParamExecute(param, "/admin/textboard/getNoticeInfo", "post", false, false, noticeObj.fn_getNoticeInfoReturn);
		},
		fn_getNoticeInfoReturn : function(rst) {
 			console.log(rst)
 			const contextPath = '${pageContext.request.contextPath}';
 			//$("#req_seq').val(rst.resultInfo.seq);
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_subTitle').text(rst.resultInfo.subTitle);
 			$('#req_url').text(rst.resultInfo.cUrl);
			$('#contents').html(rst.resultInfo.contents);
 			$('#req_file').val(rst.resultInfo.attFile);
 		
		},
		/*fn_getNoticePrev : function() {
			//$('#post_seq').val('${seq}');
    		var prevParam = "seq="+'${seq}';
    		console.log(prevParam);
			ajaxParamExecute(prevParam, "/board/getNoticePrev", "post", false, false, noticeObj.fn_getNoticePrevReturn);
		},
		fn_getNoticePrevReturn : function(rst){
			console.log(rst);
			$('#req_seq').text(rst.resultInfo.seq);
 			
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_subTitle').text(rst.resultInfo.subTitle);
 			if(rst.resultInfo.cUrl != null){
 				$('#req_url').show()
 				$('#req_url').text(rst.resultInfo.cUrl);
 			}
 			$('#req_content').text(rst.resultInfo.contents);
 		},
 		fn_getNoticeNext : function(){
 			var nextParam = "seq="+'${seq}';
    		console.log(nextParam);
			ajaxParamExecute(nextParam, "/board/getNoticeNext", "post", false, false, noticeObj.fn_getNoticeNextReturn);
		},
		fn_getNoticeNextReturn : function(rst){
			console.log(rst);
			$('#req_seq').text(rst.resultInfo.seq);
 			
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_subTitle').text(rst.resultInfo.subTitle);
 			if(rst.resultInfo.cUrl != null){
 				$('#req_url').show()
 				$('#req_url').text(rst.resultInfo.cUrl);
 			}
 			$('#req_content').text(rst.resultInfo.contents);
 		}*/	
    }
    </script>