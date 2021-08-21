<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>
<!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">비밀번호 변경</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>Modify Password</li>
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
                        <h3 class="find-id">비밀번호 변경</h3>
				        <form method="post" class="w3layouts-contact-fm" action="https://sendmail.w3layouts.com/submitForm">
	                        <div class="row main-cont-sec">
	                            <div class="col-md-6 left-cont-contact">
	                                <div class="form-group">
	                                    <label for="newpassword">새 비밀번호</label>
	                                    <input class="form-control" type="text" name="newpassword" id="newpassword" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="renewpassword">새 비밀번호 확인</label>
	                                    <input class="form-control" type="text" name="renewpassword" id="renewpassword" placeholder=""
	                                        required="">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="form-group-2 mt-4 login-button find-id-mention-button">
			                	<button type="button" class="btn button-style d-flex ml-auto" onclick="updatePwValidation()">변경하기</button>
			                </div>
	                    </form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- MENU-JS -->
    <script>
    	var memId = '${memId}';
    	var memEmail = '${memEmail}';
    
    	function updatePwValidation(){
			var newpassword = $("#newpassword").val();
			var renewpassword = $("#renewpassword").val();
			
			if(!newpassword){
				alert("새 비밀번호를 입력해주세요.");
				$("#newpassword").focus();
			}else if(!renewpassword){
				alert("새 비밀번호 확인을 입력해주세요.");
				$("#renewpassword").focus();
			}else if(newpassword != renewpassword){
				alert("비밀번호가 맞지 않습니다.");
				$("#renewpassword").focus();
			}else {
				updatePw();
			}
		}
		
		function updatePw(){
			$.ajax({
				url : "/member/updatePw",
				type : 'POST',
				data : {
					"newPw" : $("#newpassword").val(),
					"userId" : memId,
					"email" : memEmail
				},
				success : function(data){
					if(data == true){
						alert("비밀번호 변경이 완료되었습니다.");
						location.href = "/member/login"
					} else {
						alert("비밀번호 변경 실패");
					}
				}
			})
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