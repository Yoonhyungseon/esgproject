<%@ page contentType="text/html;charset=UTF-8" language="java"%>


	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">ESG: 관리자</a></li>
					<li class="breadcrumb-item active">뿜업게시판</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 뿜업게시판
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th style="width: 10%;">No</th>
									<th style="width: 50%!important;">제목</th>
									<th>작성자</th>
									<!-- <th>답변여부</th> -->
									<th>작성일</th>
									<!-- <th>모금액</th> -->
								</tr>
							</thead>
							<tbody id="listClone">
							</tbody>
								<tr id="listCron" style="display: none;">
									<td class="boardSsn"></td>
									<td class="req_title"><a href="textboardView"></a></td>
									<td class="req_regName"></td>
									<!-- <td class="req_reply"></td> -->
									<td class="req_regDt"></td>
									<!-- <td>320,800원</td> -->
								</tr>
						</table>
						<form id="boardFrm" name="boardFrm" method="post" action="/admin/textboard/textboardView">
							<input type="hidden" id=boardSsn name="boardSsn" value="">
						</form>
						<!-- <div class="inputArea">
							<a class="btn btn-primary" role="button"
								style="float: right; color: white;" href="textboardWrite">Post</a>
						</div> -->
					</div>
				</div>
			</div>
		</main>
	</div>

<script type="text/javascript">
    $(document).ready(function(){
    	boardeObj.fn_getBoardList();
    });
    
	let boardeObj = {
		fn_getBoardList : function() {
			ajaxParamExecute("", "/admin/textboard/getBoardList", "post", false, false, boardeObj.fn_getBoardListReturn);
		},
		fn_getBoardListReturn : function(rst) {
 			console.log(rst);
			$('#listClone').html('');
			
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('title').show();
					
					html.find('.boardSsn').text(rst.resultList[i].boardSsn);
				
					html.find('.req_title').text(rst.resultList[i].title);
					html.find('.req_title').attr('onclick', 'boardeObj.fn_view(\''+rst.resultList[i].boardSsn+'\')');

					html.find('.req_regName').text(rst.resultList[i].uName);

					/* html.find('.req_reply').text(rst.resultList[i].replyYn); */
					   
					html.find('.req_regDt').text(rst.resultList[i].regDtYmd);

					$('#listClone').append(html);
				}
			} else {
				$('#listClone').html('');
			}
		},
		fn_view : function(boardSsn) {
 			console.log(boardSsn);
			$('#boardSsn').val(boardSsn);
			$('#boardFrm').submit();
		}
	}
    </script>
