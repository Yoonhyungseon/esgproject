<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>
<!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">아이디 찾기</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>Find Id</li>
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
                        <h3 class="find-id">아이디 찾기</h3>
				        <form class="w3layouts-contact-fm">
	                        <div class="row main-cont-sec">
	                            <div class="col-md-6 left-cont-contact">
	                                <div class="form-group">
	                                    <label for="nickName">이름</label>
	                                    <input class="form-control" type="text" name="nickName" id="nickName" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="email">이메일</label>
	                                    <input class="form-control" type="text" name="email" id="email" placeholder=""
	                                        required="">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="form-group-2 mt-4 login-button">
	                            <button type="button" class="btn button-style d-flex ml-auto" onclick="findIdValidation()">완료</button>
	                        </div>
	                    </form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- MENU-JS -->
    <script type="text/javascript">
    	function findIdValidation(){
			var nickName = $("#nickName").val();
			var email = $("#email").val();
			
			if(!nickName){
				alert("이름을 입력해주세요.");
				$("#nickName").focus();
			}else if(!email){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
			}else {
				
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