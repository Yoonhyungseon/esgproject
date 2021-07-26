<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>
<!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">회원가입</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>Sign Up</li>
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
                        <h3>이용약관</h3>
                        <form action="" id="joinForm">
				            <ul class="join_box">
				                <li class="checkBox check01">
				                    <ul class="clearfix">
				                        <li>이용약관, 개인정보 수집 및 이용,
				                            위치정보 이용약관(선택), 프로모션 안내
				                            메일 수신(선택)에 모두 동의합니다.</li>
				                        <li class="checkAllBtn">
				                            <input type="checkbox" name="chkAll" id="chk" class="chkAll">
				                        </li>
				                    </ul>
				                </li>
				                <li class="checkBox check02">
				                    <ul class="clearfix">
				                        <li>이용약관 동의(필수)</li>
				                        <li class="checkBtn">
				                            <input type="checkbox" name="chk"> 
				                        </li>
				                    </ul>
				                    <textarea name="" id="">여러분을 환영합니다.
				네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
							       </textarea>
				                </li>
				                <li class="checkBox check03">
				                    <ul class="clearfix">
				                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
				                        <li class="checkBtn">
				                            <input type="checkbox" name="chk">
				                        </li>
				                    </ul>
				 
				                    <textarea name="" id="">여러분을 환영합니다.
				네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
							 		</textarea>
				                </li>
				                <li class="checkBox check03">
				                    <ul class="clearfix">
				                        <li>위치정보 이용약관 동의(선택)</li>
				                        <li class="checkBtn">
				                            <input type="checkbox" name="chk">
				                        </li>
				                    </ul>
				 
				                    <textarea name="" id="">여러분을 환영합니다.
				네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
							    	</textarea>
				                </li>
				                <li class="checkBox check04">
				                    <ul class="clearfix">
				                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
				                        <li class="checkBtn">
				                            <input type="checkbox" name="chk">
				                        </li>
				                    </ul>
				 
				                </li>
				            </ul>
				        </form>
				        <form method="post" class="w3layouts-contact-fm" action="https://sendmail.w3layouts.com/submitForm">
	                        <div class="row main-cont-sec">
	                            <div class="col-md-6 left-cont-contact">
	                                <div class="form-group">
	                                    <label for="id">아이디</label>
	                                    <input class="form-control" type="text" name="id" id="id" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="password">비밀번호</label>
	                                    <input class="form-control" type="text" name="password" id="password" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="repassword">비밀번호 재확인</label>
	                                    <input class="form-control" type="text" name="repassword" id="repassword" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="name">이름</label>
	                                    <input class="form-control" type="text" name="name" id="name" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="email">이메일</label>
	                                    <input class="form-control" type="text" name="email" id="email" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="gender">성별</label>
	                                    <div class="select-gender">
	                                    	<input type="radio" id="select" name="shop"><label for="select">남</label>
	                                    	<input type="radio" id="select2" name="shop"><label for="select2">여</label>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="form-group-2 mt-4 login-button">
	                            <button type="submit" class="btn button-style d-flex ml-auto">완료</button>
	                        </div>
	                    </form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- MENU-JS -->
    <script>
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