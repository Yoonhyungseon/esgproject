<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>

<body>
<!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Login</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="/">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span> Login</li>
                </ul>
            </div>
        </section>
    </div>
    <!-- //inner banner -->
    <!-- contact -->
    <section class="w3l-contact-info-main" id="contact">
        <div class="contact-sec py-5">
            <div class="container py-md-4 py-3">
                <div class="contact-w3pvt-form">
                    <h3 class="title-big mb-5" style="text-align: center;">로그인</h3>
                    <form method="POST" class="form-signin" id="login_form" name="login_form">
                        <div class="row main-cont-sec" style="display: flex;justify-content: center;">
                            <div class="col-md-6 left-cont-contact">
                                <div class="form-group">
                                    <label for="id">아이디</label>
                                    <input class="form-control" type="text" name="loginId" id="loginId" placeholder=""
                                        required="">
                                </div>
                                <div class="form-group">
                                    <label for="password">비밀번호</label>
                                    <input class="form-control" type="password" name="password" id="password" placeholder=""
                                        required="">
                                </div>
                                <div class="form-group-2 mt-4 login-button find-id-mention-button" style="width: 100%;">
		                            <button type="button" id="btn_login" name="btn_login" class="btn button-style d-flex ml-auto" style="width: 100%;justify-content: center;border-radius: 7px;">로그인</button>
		                        </div>
		                        <div class="form-group-2 mt-4 login-button find-id-mention-button" style="width: 100%;">
		                            <button type="button" class="btn button-style d-flex ml-auto" onclick="location.href='/member/join'" style="width: 100%;justify-content: center;border-radius: 7px;">회원가입</button>
		                        </div>
		                        <div class="form-group-2 mt-4 login-button find-id-mention-button" style="width: 100%;">
		                            <button type="button" class="btn button-style d-flex ml-auto" onclick="location.href='/member/findId'" style="width: 100%;justify-content: center;border-radius: 7px;">아이디 찾기</button>
		                        </div>
		                        <div class="form-group-2 mt-4 login-button" style="width: 100%;">
		                            <button type="button" class="btn button-style d-flex ml-auto" onclick="location.href='/member/findPassword'" style="width: 100%;justify-content: center;border-radius: 7px;">비밀번호 찾기</button>
		                        </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    	<script type="text/javascript">
		var utils =  {
		    isNotEmpty : function(_str){
		        obj = String(_str);
		        if(obj == null || obj == undefined || obj == 'null' || obj == 'undefined' || obj == '' ) return false;
		        else return true;
		    },
		    isEmpty : function(_str){
		        return !utils.isNotEmpty(_str);
		    }
		}
		
		function loginWithNaver(){
			var w = window.document.body.offsetWidth;
			var h = window.document.body.offsetHeight;
			window.open("${getNaverLoginUrl}","_blank","top=0,left=0,width=500,height=600,toolbar=0,status=0,scrollbars=1,resizable=0");
		}
		
		function loginCheck(userId, snsType, name, email, mobile){
		 	/* console.log("userId : " + userId);
		 	console.log("snsType : " + snsType);
		 	console.log("name : " + name);
		 	console.log("email : " + email);
		 	console.log("mobile : " + mobile); */
			
			if (userId != "" && userId != null) {
				var data = {
					loginId : userId,
					loginPass : userId,
					snsType : snsType,
					name : name,
					email : email,
					mobile : mobile
				};
				
				fn_login(data);
			}
		}

		function fn_login(data){
			ajaxJsonExecute(data, "/rest/member/login", "post", true, true, function(rst) {
				/* console.log(rst); */
				if(rst.status==200) {
					$("#login_area").find(".error_txt").addClass("hide");
					$("#login_area").find(".error_txt").html("");
					//location.reload();
// 					if (document.referrer && document.referrer != "") {
// 						window.location.replace(document.referrer);
// 					} else {
						window.location.replace("/index");
// 					}
				}else {
					alert("가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.");
					/* console.log(rst.status + " : " + rst.message);  */
				}
			});
		}
		
		$(document).ready(function(){
			// 로그인 처리
			$(document).on("click", "#btn_login", function(e) {
				e.preventDefault();
				if(utils.isEmpty($("#loginId").val())){
					$("#loginId").focus();
					alert("아이디를 입력하세요");
					return;
				}
				
				if(utils.isEmpty($("#password").val())){
					$("#password").focus();
					alert("비밀번호를 입력하세요");
					return;
				}

				var data = {
					loginId : $("#loginId").val(),
					loginPass : $("#password").val()
				};
				
				fn_login(data);
			});
		});
	</script>
	
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