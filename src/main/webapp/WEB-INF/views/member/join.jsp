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
                    <li><a href="/">Home</a></li>
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
                        <!-- <h3>이용약관</h3>
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
				        </form> -->
				        <h3 class="title-big mb-5" style="text-align: center;">회원가입</h3>
				        <form class="w3layouts-contact-fm" id="signupForm">
	                        <div class="row main-cont-sec" style="display: flex;justify-content: center;">
	                            <div class="col-md-6 left-cont-contact">
	                                <div class="form-group">
	                                    <label for="userId">아이디</label>
	                                    <input class="form-control" type="text" name="userId" id="userId" placeholder=""
	                                        required="" autocomplete="off">
	                                </div>
	                                <div class="form-group">
	                                    <label for="userPw">비밀번호</label>
	                                    <input class="form-control" type="password" name="userPw" id="userPw" placeholder=""
	                                        required="" autocomplete="off">
	                                </div>
	                                <div class="form-group">
	                                    <label for="repassword">비밀번호 확인</label>
	                                    <input class="form-control" type="password" name="repassword" id="repassword" placeholder=""
	                                        required="" autocomplete="off">
	                                </div>
	                                <div class="form-group">
	                                    <label for="nickName">이름</label>
	                                    <input class="form-control" type="text" name="nickName" id="nickName" placeholder=""
	                                        required="" autocomplete="off">
	                                </div>
	                                <div class="form-group">
	                                    <label for="email">이메일</label>
	                                    <input class="form-control" type="text" name="email" id="email" placeholder=""
	                                        required="" autocomplete="off">
	                                </div>
	                                <div class="form-group">
	                                    <label for="gender">성별</label>
	                                    <div class="select-gender">
	                                    	<input type="radio" name="gender" value="" checked>
	                                    	<input type="radio" id="select" name="gender" value="M"><label for="select">남</label>
	                                    	<input type="radio" id="select2" name="gender" value="F"><label for="select2">여</label>
	                                    </div>
	                                </div>
	                                <div class="form-group-2 mt-4 login-button" style="width: 100%;">
			                            <button type="button" class="btn button-style d-flex ml-auto" onclick="signUpValidation()" style="width: 100%;justify-content: center;border-radius: 7px;">완료</button>
			                        </div>
	                            </div>
	                        </div>
	                    </form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- MENU-JS -->
    <script type="text/javascript">
    	function signUpValidation(){
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			var userPwCheck = $("#repassword").val();
			var nickName = $("#nickName").val();
			var email = $("#email").val();
			var gender = $('input[name="gender"]:checked').val();
			
			var email_rule = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			
			if(!userId){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
			}else if(!userPw){
				alert("비밀번호를 입력해주세요.");
				$("#userPw").focus();
			}else if(!userPwCheck){
				alert("비밀번호 확인을 입력해주세요.");
				$("#repassword").focus();
			}else if(userPw != userPwCheck){
				alert("비밀번호가 맞지 않습니다.");
				$("#repassword").focus();		
			}else if(!nickName){
				alert("이름을 입력해주세요.");
				$("#nickName").focus();
			}else if(!email){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
			}else if(!email_rule.test(email)){
				alert("이메일을 형식에 맞게 입력해주세요.");
				$("#email").focus();
			}else if(!gender){
				alert("성별을 선택해주세요.");
			}else {
				signUp();
			}
		}

		function signUp(){
			$.ajax({
				url : "/rest/member/join",
				type : 'POST',
				data : {
					"userId" : $("#userId").val(),
					"userPw" : $("#userPw").val(),
					"nickName" : $("#nickName").val(),
					"email" : $("#email").val(),
					"gender" : $('input[name="gender"]:checked').val()
				},
				success : function(data){
					if(data == true){
						alert("회원가입이 완료되었습니다.");
						location.href = "/member/login"
					} else {
						alert("회원가입 실패");
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