<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="js/jquery.js" type="text/javascript">
	$(document).ready(function() {
 	var progressbar = $('#progressbar'),
    max = progressbar.attr('max'),
    value = progressbar.val();
};
</script>
<style>
progress {
	width: 500px;
	margin: auto;
	margin-top: 3px;
}

progress::-webkit-progress-bar {
	background-color: rgb(192, 192, 192);
	width: 100%;
	border-radius: 15px;
}

progress::-webkit-progress-value {
	background-color: #0abf53;
	color: white;
	padding: 1%;
	text-align: right;
	font-size: 20px;
	border-radius: 15px;
}
.comment{
    box-shadow: -1px 7px 13px 0px rgb(10 10 10 / 8%);
    padding: 30px;
    height: 12rem;
}
.comment_content{
	overflow: hidden;
    display: -webkit-box;
    width: 500px;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
}
</style>

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index">ESG: 관리자</a></li>
					<li class="breadcrumb-item active">뿜업게시판</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i> 뿜업게시판
						</div>
					</div>
					<div class="card-body">
						<!-- blog single -->
						<h2 id="req_title" style="margin: auto; display: block;"></h2>

						<h5 class="date" style="float: right;">
							Writer : <span id="req_name"style="font-weight: normal;"></span> <br>
							Date : <span id="req_date" style="font-weight: normal;"></span><br>
							<!-- Reply : <span id="req_reply" style="font-weight: normal;"></span> <br>  -->
							Likes : <span style="font-weight: normal;">32</span> <br> 
							<!-- Points : <span style="font-weight: normal;">320,800₩</span> -->
						</h5>
						<div class="blog-img-single">
							<img id="req_file"
								style="width: 500px; height: 350px; margin: auto; display: block; padding: 20px;" />
							<!-- <progress id="progressbar" max="100" value="50" style="margin-left: 500px; width: 465px;"></progress> -->
						</div>
						<br> <br>
						<p id="req_content"></p>
						<br><br>
						<p class="text-tag">Tags:<a href="#url" id="req_hash"></a></p>
						
						<!-- <div
							class="blog-single-tags d-flex align-items-center mt-4 pt-1 mb-5">
						</div>
						<div class="single-pagination clearfix">
							<a class="" href="#prev"> <span class="fa fa-arrow-left"
								aria-hidden="true"></span> Previous Post
							</a> <a class="" style="float: right;" href="#next">Next Post <span
								class="fa fa-arrow-right" aria-hidden="true"></span>
							</a>
						</div> -->

						<!-- comments section blog single -->
						<section class="w3l-comments-9-main mt-5">
							<div class="gallery-32">
								<div style="display: -webkit-box;">
									<h3 class="title-main2-blog-single">Comments</h3>(<h4 id="count_comments" style="padding-top: 6px;display: inline-flex;"></h4>)
								</div>
								<form id="boardFrm" name="boardFrm" method="post" action="/admin/textboard/textboardView">
									<input type="hidden" id="linkSeq" name="boardSsn" value="">
									<div class="row" style="padding: 0 30px 30px;">
										<div id="listClone" style="display: contents;"></div>
										<div class="col-md-6 mt-4" id="listCron" style="display: none;">
											<div class="comment">
												<p id="c_contents" class="comment_content">
													<i class="fa fa-quote-left" aria-hidden="true"></i> 
												</p>
												<div class="testi-pos mt-3 d-flex align-items-center">
													<!-- <img src="assets/images/testi2.jpg" alt=""
														class="img-responsive rounded-circle mb-3" /> -->
													<div class="right-coment">
														<h4 id="c_regNm"></h4>
														<span id="c_dt"></span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</section>
						<!-- //comments section blog single -->

					</div>
					<div class="row" style="display: inline; padding: 1rem 1.1rem;">
						<div class="btn_area">
							<div class="btn_right" style="margin-top: 10px; float: right;">
								<a class="btn btn-primary" href="textboardList"	style="color: white !important;">목록</a>
								<!-- <a class="btn btn-primary btn-block myform" href="companiesWrite" style="color: white!important;">수정</a> -->
							</div>
						</div>
					</div>
				</div>
				<!-- feedback -->
				<section class="card mb-4">
					<div class="card-header">
						<i class="fas fa-book-open"></i> 뿜업게시판 피드백 등록
					</div>
					<div class="card-body" style="text-align: center;">
						<form name="fbFrm" action="fbFrm" method="post" >
							<input type="hidden" id="linkSeq" name="boardSsn" value="">
							<div class="form-group">
								<label for="ftitle" class="col-form-label" style="display: inline-block; margin-right: 60px;">Title</label>
								<input type="text" class="form-control" placeholder=" Title" name="ftitle" id="title" required="required"
									style="width: 800px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<label for="fcontents" class="col-form-label" style="display: inline-block; margin-right: 37px;">Content</label>
								<textarea name="fcontents" class="form-control" id="contents" placeholder="Content" required="required"
									style="width: 800px; display: inline-block;"></textarea>
							</div>
							<button type="button" class="btn btn-primary" style="float: right;" onclick="boardObj.fn_save()">등록</button>	
						</form>
					</div>
				</section>
				<!-- // feedback -->				
			</div>
		</main>
	</div>
<script type="text/javascript">
var boardSsn="${boardSsn}";
    $(document).ready(function(){
    	boardObj.fn_getBoardInfo(boardSsn);
    	boardObj.fn_getCommentList("${linkSeq}");
    });
    
    let boardObj = {
    	fn_getBoardInfo : function(boardSsn) {
    		console.log(boardSsn);
    		var param = "boardSsn="+boardSsn;
			ajaxParamExecute(param, "/admin/textboard/getBoardInfo", "post", false, false, boardObj.fn_getBoardInfoReturn);
		},
		fn_getBoardInfoReturn : function(rst) {
 			console.log(rst)
 			//$('#req_seq').text(rst.resultInfo.seq);
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_name').text(rst.resultInfo.uName);
 			$('#req_reply').text(rst.resultInfo.replyYn);
 			
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_hash').text(rst.resultInfo.hashTag);
 			$('#req_content').html(rst.resultInfo.contents);
 			$('#count_comments').text(rst.resultInfo.comments);
		},
		fn_save : function(){
			/*  if(!$('#ftitle').val() || !$('#ftitle').val().trim()){
				alert("피드백 제목을 입력해주세요.");
				$('#ftitle').focus();
				return false;
			}
			if(!$('#fcontent').val() || !$('#fcontent').val().trim()){
				alert("피드백 내용을 입력해주세요.");
				$('#fcontent').focus();
				return false;
			}  */
			if(confirm('피드백을 등록하시겠습니까?'))
				ajaxFormExecute("fbFrm", "/admin/textboard/postFeedback", "post", false, false, boardObj.fn_saveReturn);
		},
		fn_saveReturn : function(rst){
			if(rst){
				alert('피드백이 등록되었습니다.');
				console.log(rst);
				boardObj.fn_view();
			}else{
				alert('등록에 실패하였습니다. \n관리자에게 문의바랍니다.');
			}
		},
		fn_view : function(){
			$("#fbFrm").prop("action", "/admin/textboard/textboardView");
			$("#fbFrm").submit();
		},
		fn_getCommentList : function() {
			$('#linkSeq').val('${boardSsn}');
    		var cParam = "linkSeq="+'${boardSsn}';
    		console.log(cParam);
			ajaxParamExecute(cParam, "/admin/textboard/getCommentList", "post", false, false, boardObj.fn_getCommentListReturn);
		},
		fn_getCommentListReturn : function(rst) {
 			console.log(rst)
 			$('#listClone').html('');
 						
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('contents').show();

					html.find('#c_contents').text(rst.resultList[i].contents);
					 
					html.find('#c_regNm').text(rst.resultList[i].regNm);
						
					html.find('#c_dt').text(rst.resultList[i].regDtYmd);

					$('#listClone').append(html); 
				}
			} else {
				$('#listClone').html(''); 			
			}
    	}
    }
</script>