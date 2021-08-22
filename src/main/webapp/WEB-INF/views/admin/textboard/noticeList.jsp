<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<div class="sb-nav-fixed">
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
						<i class="fas fa-table me-1"></i> 공지사항
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>No.</th>
									<th>Title</th>
									<th>Date</th>
								</tr>
							</thead>
							<tbody id="listClone">
							</tbody>

							<tr id="listCron" style="display: none;">
								<td class="req_seq"></td>
								<td class="req_title"><a href="noticeView"></a></td>
								<td class="req_regDt"></td>
							</tr>
						</table>
						<div class="inputArea">
							<a class="btn btn-primary" role="button"
								style="float: right; color: white;" href="noticeWrite">Post</a>
						</div>
						<form id="boardFrm" name="boardFrm" method="post" action="/admin/textboard/noticeView">
							<input type="hidden" id=seq name="seq" value="">
						</form>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>
	<script type="text/javascript">
    $(document).ready(function(){
    	noticeObj.fn_getNoticeList();
    });
    
	let noticeObj = {
		fn_getNoticeList : function() {
			ajaxParamExecute("", "/admin/textboard/getNoticeList", "post", false, false, noticeObj.fn_getNoticeListReturn);
		},
		fn_getNoticeListReturn : function(rst) {
 			console.log(rst);
			$('#listClone').html('');
			
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('title').show();
					
					html.find('.req_seq').text(rst.resultList[i].seq);
				
					html.find('.req_title').text(rst.resultList[i].title);
					html.find('.req_title').attr('onclick', 'noticeObj.fn_view(\''+rst.resultList[i].seq+'\')');
	               
					html.find('.req_regDt').text(rst.resultList[i].regDtYmd);

					$('#listClone').append(html);
				}
			} else {
				$('#listClone').html('');
			}
		},
		fn_view : function(seq) {
 			console.log(seq);
			$('#seq').val(seq);
			$('#boardFrm').submit();
		}
	}
    </script>
