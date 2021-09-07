<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>
<!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">비밀번호 찾기</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="/">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>Find Password</li>
                </ul>
            </div>
        </section>
    </div>
    <!-- //inner banner -->
    <!-- blog single -->
    <section class="w3l-blog-single py-5">
        <div class="single-blog sec-padding py-md-4 py-3">
            <div class="container">
                <div class="single-bottom-blog">
                    <div class="bottom-grid mt-4 pt-2">
                        <h3 class="find-id" style="text-align: center;">비밀번호 찾기</h3>
				        <form class="w3layouts-contact-fm">
	                        <div class="row main-cont-sec" style="display: flex;justify-content: center;">
	                            <div class="col-md-6 left-cont-contact">
	                                <div class="form-group">
	                                    <label for="nickName">이름</label>
	                                    <input class="form-control" type="text" name="nickName" id="nickName" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="userId">아이디</label>
	                                    <input class="form-control" type="text" name="userId" id="userId" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="email">이메일</label>
	                                    <input class="form-control" type="text" name="email" id="email" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group-2 mt-4 login-button" style="width: 100%;">
			                            <button type="button" class="btn button-style d-flex ml-auto" onclick="findPwValidation()" style="width: 100%;justify-content: center;border-radius: 7px;">완료</button>
			                        </div>
	                            </div>
	                        </div>
	                    </form>
	                    <form id="boardFrm" name="boardFrm" method="post" action="/member/findPasswordMention">
	                    	<input type="hidden" id=memId name="memId" value="">
							<input type="hidden" id=memEmail name="memEmail" value="">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- MENU-JS -->
    <script>
    	function findPwValidation(){
			var nickName = $("#nickName").val();
			var userId = $("#userId").val();
			var email = $("#email").val();
			
			if(!nickName){
				alert("이름을 입력해주세요.");
				$("#nickName").focus();
			}else if(!userId){
				alert("아이디를 입력해주세요.");
				$("#email").focus();
			}else if(!email){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
			}else {
				$('#memId').val(userId);
				$('#memEmail').val(email);
				$('#boardFrm').submit();
			}
		}
    
        $(window).on("scroll", function () {
            var scroll = $(window).scrollTop();

            if (scroll >= 80) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");
            }
        });

        //Main navigation Active Class Add Remove
        $(".navbar-toggler").on("click", function () {
            $("header").toggleClass("active");
        });
        $(document).on("ready", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
            $(window).on("resize", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
            });
        });
    </script>
    <!-- //MENU-JS -->
</body>

</html>