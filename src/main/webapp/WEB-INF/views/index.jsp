<%@ page contentType="text/html;charset=UTF-8" language="java" %>

     <!-- Swiper -->
    <div class="swiper-container mySwiper" style="height: 37.25vw; margin-top: 90px;">
      <div class="swiper-wrapper">
        <div class="swiper-slide" style="background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url(/asset/img/iStock-1213710695.jpg); background-size: cover; background-position:center center;">
		    <section id="home" class="w3l-banner py-5 landing"  style="width: 100%;">
		        <div class="container pt-5 pb-md-4">
		            <div class="row align-items-center">
		                <div class="col-md-6 pt-md-0 pt-4">
		                    <h3 class="mb-sm-4 mb-3 title" style="text-align: left;">ESG: 사회를 품다</h3>
		                    <p id="landing-information" style="text-align: left;">기업의 실질적 ESG 경영을 위해<br><br>우리들의 적극적인 행동이 시작되는 곳</p>
		                    <div class="mt-md-5 mt-4 mb-lg-0 mb-4" style="text-align: left;">
		                        <button class="btn button-style btn-scroll-move">More information</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>        
        </div>   
        
        <div class="swiper-slide" style="background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url(/asset/img/iStock-1131802896.jpg); background-size: cover;">
		    <section id="home" class="w3l-banner py-5 landing"  style="width: 100%;">
		        <div class="container pt-5 pb-md-4">
		            <div class="row align-items-center">
		                <div class="col-md-6 pt-md-0 pt-4">
		                    <h3 class="mb-sm-4 mb-3 title" style="text-align: left;">ESG: 기업을 평가하는 하나의 잣대</h3>
		                    <p id="landing-information" style="text-align: left;">사회문제를 고민하는 일은 이제 하나의 소양이 아니라<br><br>기업이 멀리 볼 줄 아는지를 평가하는 잣대</p>
		                    <div class="mt-md-5 mt-4 mb-lg-0 mb-4" style="text-align: left;">
		                        <button class="btn button-style btn-scroll-move">More information</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>        
        </div>
        
        <div class="swiper-slide" style="background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url(/asset/img/iStock-1200807320.jpg); background-size: cover;">
		    <section id="home" class="w3l-banner py-5 landing"  style="width: 100%;">
		        <div class="container pt-5 pb-md-4">
		            <div class="row align-items-center">
		                <div class="col-md-6 pt-md-0 pt-4">
		                    <h3 class="mb-sm-4 mb-3 title" style="text-align: left; color: white; text-shadow: 1px 1px 5px #000;">ESG: 국민과 함께하는 금융</h3>
		                    <p id="landing-information" style="text-align: left; color: white; text-shadow: 1px 1px 5px #000;">위기를 기회로 바꾸는 금융<br><br>새로운 도약의 계기를 창출하는 금융</p>
		                    <div class="mt-md-5 mt-4 mb-lg-0 mb-4" style="text-align: left;">
		                        <button class="btn button-style btn-scroll-move">More information</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>        
        </div>

        <div class="swiper-slide" style="background-image: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ), url(/asset/img/iStock-1126410337.jpg); background-size: cover;">
		    <section id="home" class="w3l-banner py-5 landing"  style="width: 100%;">
		        <div class="container pt-5 pb-md-4">
		            <div class="row align-items-center">
		                <div class="col-md-6 pt-md-0 pt-4">
		                    <h3 class="mb-sm-4 mb-3 title" style="text-align: left; color: white; left; text-shadow: 1px 1px 5px #000;">ESG: 글로벌 트렌드</h3>
		                    <p id="landing-information" style="text-align: left; color: white; left; text-shadow: 1px 1px 5px #000;">떠오르는 투자 키워드<br><br>지속가능한 경영을 위한 ESG 경영</p>
		                    <div class="mt-md-5 mt-4 mb-lg-0 mb-4" style="text-align: left;">
		                        <button class="btn button-style btn-scroll-move">More information</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>        
        </div>
      </div>
      <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        pagination: {
          el: ".swiper-pagination",
          dynamicBullets: true,
        },
        autoplay: {
            delay: 50000,
            disableOnInteraction: false,
        },
        loop: true,
        loopAdditionalSlides: 1,
      });
    </script>
    
    <!-- about section -->
    <div id="moved-here" class="w3l-content-photo-5">
        <div class="content pt-md-5 pt-4">
            <div class="container py-lg-4 py-md-3">
                <div class="row">
                    <div class="col-lg-6 content-photo">
                    	<img src="/asset/images/esg2.jpg" class="img-responsive"
                                alt="content-photo">
                    </div>
                    <div class="col-lg-6 content-left mb-md-0 mb-3">
                        <h3>ESG 란?<!-- <span>What is ESG?</span> --></h3>
                        <p>· 기업의 지속가능경영 수준을 투자자 관점에서 해석</p>
                        <p>· 비재무적 성과를 재무적 지표로 환산하여 평가</p>
                        <p>· 20여년 전부터 존재한 개념이나, 최근 들어 주목받는 중</p>
                        <p>· 기업이 환경, 사회, 지배구조에서 발생할 수 있는 위험을 관리하여<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기회로 잘 전환하는지에 대한 능력을 확인하는 지표</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //about section -->
    
    <!-- 3 grids -->
    <section class="w3l-features-4">
        <div class="features4-block text-center">
            <div class="container py-md-5 py-3">
                <div class="row features4-grids">
                    <div class="col-lg-4 col-md-6">
                        <div class="features4-grid">
                            <div class="feature-images">
                            	<img src="/asset/images/letter-e.png">
                            </div>
                            <h5><a>Environment</a></h5>
                            <p>탄소 배출을 감축해야 하는 상황에서 발생하는 penalty를 기업이 사전적으로 얼마나 잘 대응하고, 얼마나 친환경 기술에 준비가 되었는지를 평가하기 위한 항목</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-md-0 mt-4">
                        <div class="features4-grid">
                            <div class="feature-images">
                                <img src="/asset/images/letter-s.png">
                            </div>
                            <h5><a>Social</a></h5>
                            <p>지배구조 하의 사회 구성원에 대한 항목으로, 구성원을 얼마나 잘 양성하고 있으며 우수한 인재들을 얼마나 hold하고 있는지를 평가하는 항목</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-lg-0 mt-4">
                        <div class="features4-grid">
                            <div class="feature-images">
                                <img src="/asset/images/letter-g.png">
                            </div>
                            <h5><a>Governance</a></h5>
                            <p>이사회, 임원 보수, ESG 위원회, 정치후원 등과 같은 의사결정 기구가 얼마나 투명하고 유연하며 효율적으로 기업을 리딩하고 있는지 평가하는 항목</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 3 grids -->
    
    <!-- Js scripts -->
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">
        <span class="fa fa-level-up" aria-hidden="true"></span>
    </button>
    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    <!-- //move top -->

    <!-- common jquery plugin -->
    <!-- <script src="/asset/js/jquery-3.3.1.min.js"></script> -->
    <!-- //common jquery plugin -->

    <!-- theme switch js (light and dark)-->
    <!-- <script src="/asset/js/theme-change.js"></script> -->
    <script>
        function autoType(elementClass, typingSpeed) {
            var thhis = $(elementClass);
            thhis.css({
                "position": "relative",
                "display": "inline-block"
            });
            thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
            thhis = thhis.find(".text-js");
            var text = thhis.text().trim().split('');
            var amntOfChars = text.length;
            var newString = "";
            thhis.text("|");
            setTimeout(function () {
                thhis.css("opacity", 1);
                thhis.prev().removeAttr("style");
                thhis.text("");
                for (var i = 0; i < amntOfChars; i++) {
                    (function (i, char) {
                        setTimeout(function () {
                            newString += char;
                            thhis.text(newString);
                        }, i * typingSpeed);
                    })(i + 1, text[i]);
                }
            }, 1500);
        }

        $(document).ready(function () {
            // Now to start autoTyping just call the autoType function with the 
            // class of outer div
            // The second paramter is the speed between each letter is typed.   
            autoType(".type-js", 200);
        });
    </script>
    <!-- //theme switch js (light and dark)-->

    <!-- magnific popup -->
    <!-- <script src="/asset/js/jquery.magnific-popup.min.js"></script> -->
    <script>
        $(document).ready(function () {
            $('.popup-with-zoom-anim').magnificPopup({
                type: 'inline',

                fixedContentPos: false,
                fixedBgPos: true,

                overflowY: 'auto',

                closeBtnInside: true,
                preloader: false,

                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });

            $('.popup-with-move-anim').magnificPopup({
                type: 'inline',

                fixedContentPos: false,
                fixedBgPos: true,

                overflowY: 'auto',

                closeBtnInside: true,
                preloader: false,

                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-slide-bottom'
            });
        });
    </script>
    <!-- //magnific popup -->

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

    <!-- disable body scroll which navbar is in active -->
    <script>
        $(function () {
            $('.navbar-toggler').click(function () {
                $('body').toggleClass('noscroll');
            })
        });
    </script>
    <!-- //disable body scroll which navbar is in active -->

    <!--bootstrap-->
    <!-- <script src="/asset/js/bootstrap.min.js"></script> -->
    <!-- //bootstrap-->
    <!-- //Js scripts -->
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		$(document).ready(function(){
			$('.btn-scroll-move').click(function(){
				var offset = $('#moved-here').offset();
		        $('html').animate({scrollTop : offset.top}, 300);	
			});
		});
	</script>
</body>

</html>