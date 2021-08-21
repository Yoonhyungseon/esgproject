<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!-- //inner banner -->
    <!-- menu -->
    <div class="menu-w3ls py-5" id="menu">
        <div class="container py-md-4 py-3">
            <h3 class="title-big mb-2">내가 등록한 게시글</h3>
            <div class="row menu-body">
                <!-- Section starts: Breakfast -->
                <div class="col-lg-6 menu-section">
                    <!-- Item starts -->
                    <div class="row menu-item">
                        <div class="col-3 p-0 position-relative">
                            <img src="https://image.edaily.co.kr/images/Photo/files/NP/S/2020/12/PS20122000371.jpg" class="img-responsive" alt="">
                            <a href="/board/textboardView" class="btn button-style button-style-2">자세히</a>
                        </div>
                        <div class="col-9 pl-4">
                            <div class="row no-gutters">
                                <div class="col-9 menu-item-name">
                                    <h6>매일유업 빨대 없애주세요</h6>
                                </div>
                                <div class="col-3 menu-item-price text-right">
                                    <h6>up32</h6>
                                </div>
                            </div>
                            <div class="menu-item-description">
                                <p>음료수에 붙은 플라스틱 빨대는 환경 오염을 야기합니다. 빨대를 없애주세요</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item ends -->
                    <!-- Item starts -->
                    <div class="row menu-item">
                        <div class="col-3 p-0 position-relative">
                            <img src="https://image.edaily.co.kr/images/Photo/files/NP/S/2020/12/PS20122000371.jpg" class="img-responsive" alt="">
                            <a href="/board/textboardView" class="btn button-style button-style-2">자세히</a>
                        </div>
                        <div class="col-9 pl-4">
                            <div class="row no-gutters">
                                <div class="col-9 menu-item-name">
                                    <h6>매일유업 빨대 없애주세요</h6>
                                </div>
                                <div class="col-3 menu-item-price text-right">
                                    <h6>up32</h6>
                                </div>
                            </div>
                            <div class="menu-item-description">
                                <p>음료수에 붙은 플라스틱 빨대는 환경 오염을 야기합니다. 빨대를 없애주세요</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item ends -->
                    <!-- Item starts -->
                    <div class="row menu-item">
                        <div class="col-3 p-0 position-relative">
                            <img src="https://image.edaily.co.kr/images/Photo/files/NP/S/2020/12/PS20122000371.jpg" class="img-responsive" alt="">
                            <a href="/board/textboardView" class="btn button-style button-style-2">자세히</a>
                        </div>
                        <div class="col-9 pl-4">
                            <div class="row no-gutters">
                                <div class="col-9 menu-item-name">
                                    <h6>매일유업 빨대 없애주세요</h6>
                                </div>
                                <div class="col-3 menu-item-price text-right">
                                    <h6>up32</h6>
                                </div>
                            </div>
                            <div class="menu-item-description">
                                <p>음료수에 붙은 플라스틱 빨대는 환경 오염을 야기합니다. 빨대를 없애주세요</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item ends -->
                    <!-- Item starts -->
                    <div class="row menu-item">
                        <div class="col-3 p-0 position-relative">
                            <img src="https://image.edaily.co.kr/images/Photo/files/NP/S/2020/12/PS20122000371.jpg" class="img-responsive" alt="">
                            <a href="/board/textboardView" class="btn button-style button-style-2">자세히</a>
                        </div>
                        <div class="col-9 pl-4">
                            <div class="row no-gutters">
                                <div class="col-9 menu-item-name">
                                    <h6>매일유업 빨대 없애주세요</h6>
                                </div>
                                <div class="col-3 menu-item-price text-right">
                                    <h6>up32</h6>
                                </div>
                            </div>
                            <div class="menu-item-description">
                                <p>음료수에 붙은 플라스틱 빨대는 환경 오염을 야기합니다. 빨대를 없애주세요</p>
                            </div>
                        </div>
                    </div>
                    <!-- Item ends -->
                </div>
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
			
			
			
		}
		
	}
	
	</script>