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
                    <li><a href="/">Home</a></li>
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
                    <div class="blog-img-single">
                        <img src="/assets/images/single.jpg" alt="" class="img-fluid img-responsive" />
                    </div>
                    <div class="bottom-grid mt-4 pt-2" id="findId" style="text-align: center;">
                        <h3 class="find-id-mention">한이음 님의 아이디는</h3>
                    </div>
                    <div class="bottom-grid mt-4 pt-2" style="display: flex;justify-content: center;">
	                   	<div class="form-group-2 mt-4 login-button find-id-mention-button">
		                	<button type="button" class="btn button-style d-flex ml-auto" onclick="location.href='/member/findPassword'">비밀번호 찾기</button>
		                </div>
		                <div class="form-group-2 mt-4 login-button">
		                	<button type="button" class="btn button-style d-flex ml-auto" onclick="location.href='/member/login'">로그인 하기</button>
		                </div>
	                </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- MENU-JS -->
    <script>
	    var memEmail = '${memEmail}';
	    console.log(memEmail);
	    
	    $(document).ready(function(){
	    	memberObj.fn_getMemberId(memEmail);
	    });
	    
	    let memberObj = {
	    	fn_getMemberId : function(memEmail) {
	    		var param = "email="+memEmail;
				ajaxParamExecute(param, "/member/getFindId", "post", false, false, memberObj.fn_getMemberIdRetrun);
			},
			fn_getMemberIdRetrun : function(rst) {
				if(rst.resultInfo == null) {
					alert("아이디가 존재하지 않습니다.");
					location.href='/member/findId';
				}
				else {
		 			var tag = "<h2>" + rst.resultInfo.userId + " 입니다." + "</h2>";
		 			$("#findId").append(tag);
	 			}
			},
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