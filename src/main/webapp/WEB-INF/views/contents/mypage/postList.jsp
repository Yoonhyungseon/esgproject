<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!-- //inner banner -->
    <!-- menu -->
    <div class="menu-w3ls py-5" id="menu">
        <div class="container py-md-4 py-3">
            <h3 class="title-big mb-2">내가 작성한 게시글</h3>
            <div class="row menu-body">
                <!-- Section starts: Breakfast -->
                <div class="col-lg-12 menu-section" id="listClone">
                </div>
                    <!-- Item starts -->
                    <div class="row menu-item" id="listCron" style="display:none; float: left; width: 400px; height: 80px;">
                        <div class="col-3 p-0 position-relative">
                            <img src="https://image.edaily.co.kr/images/Photo/files/NP/S/2020/12/PS20122000371.jpg" class="img-responsive" alt="">
                            <a href=#none id="detail" class="btn button-style button-style-2">자세히</a>
                        </div>
                        <br>
                        <div class="col-9 pl-4">
                            <div class="row no-gutters">
                                <div class="col-9 menu-item-name">
                                    <h6 class="title"></h6>
                                </div>
                                <div class="col-3 menu-item-price text-right">
                                    <h6>up32</h6>
                                </div>
                            </div>
                            <!--  
                            <div class="menu-item-description">
                                <p class="contents"></p>
                            </div>
                            -->
                        </div>
                    </div>
                    <!-- Item ends -->
                    <form id="boardFrm" name="boardFrm" method="post" action="/board/textboardView">
							<input type="hidden" id="boardSsn" name="boardSsn" value="">
					</form>
                    
                   
                
                <!-- Section ends: Breakfast -->
            </div>

                  
           
        </div>
    </div>
    <!-- //menu -->

	<script type="text/javascript">
	$(document).ready(function(){
    	boardObj.fn_getBoardList();
    });
    
	let boardObj = {
		fn_getBoardList : function() {
			ajaxParamExecute("", "/mypage/getBoardList", "post", false, false, boardObj.fn_getBoardListReturn);
		},
		fn_getBoardListReturn : function(rst) {
 			console.log(rst);
			$('#listClone').html('');
			console.log(rst.resultList.length);
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('id').show();
					
					
					html.find('.title').html(rst.resultList[i].title25);
					html.find('#boardSsn').text(rst.resultList[i].boardSsn);
					html.find('.title').attr('onclick', 'boardObj.fn_view(\''+rst.resultList[i].boardSsn+'\')');
					html.find('#detail').attr('onclick', 'boardObj.fn_view(\''+rst.resultList[i].boardSsn+'\')');
		//			html.find('.contents').html(rst.resultList[i].contents60);

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