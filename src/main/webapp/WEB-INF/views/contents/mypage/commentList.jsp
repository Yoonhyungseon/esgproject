<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!--  commentList-->
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-4">
                    <h2 class="heading-section">댓글관리</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center">Comment Table</h3>
                    <div class="table-wrap">
                        <table class="table myaccordion table-hover" id="accordion">
                            <thead id="listClone">
                                <tr>
                                    <th>#</th>
                                    <th>게시글 제목</th>
                                    <th>게시글 작성자</th>
                                    <th>댓글 작성일</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                           	<tbody  id="listCron" style="display:none;" >
                                <tr data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" >
                                    <th class="seq" scope="row" ></th>
                                    <td class="title" ></td>
                                    <td class="name" ></td>
                                    <td class="date" ></td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseOne" class="collapse show acc" data-parent="#accordion">
                                        <p class="comment"></p>
                                    </td>
                                </tr>
                       		</tbody >
                            
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
//	var uName = '${uName}'
	var regNm = 'esg'
	$(document).ready(function(){
    	boardObj.fn_getCommentList(regNm);
    });
    
	let boardObj = {
		fn_getCommentList : function() {
			var param = "regNm="+regNm;
			ajaxParamExecute(param, "/mypage/getCommentList", "post", false, false, boardObj.fn_getCommentListReturn);
		},
		fn_getCommentListReturn : function(rst) {
 			console.log(rst);
			console.log(rst.resultList.length);
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('id').show();
					
					html.find('.seq').text(rst.resultList[i].seq);
					html.find('.date').text(rst.resultList[i].regDtYmd);
					html.find('.title').text(rst.resultList[i].title20);
					html.find('.name').text(rst.resultList[i].regNm);
					html.find('.comment').text(rst.resultList[i].contents);

					$('#listClone').after(html);
				}
			} else {
				$('#listClone').html('');
			}
 			
			
			
		}
		
	}
	
	</script>

