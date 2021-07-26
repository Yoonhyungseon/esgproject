<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foodies - Restaurant Category Responsive Web Template - Home</title>
    <!-- google-fonts -->
    <link href="//fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
        rel="stylesheet">
    <!-- //google-fonts -->
</head>

<body>
    <!-- banner section -->
    <section id="home" class="w3l-banner py-5 landing">
        <div class="container pt-5 pb-md-4">
            <div class="row align-items-center">
                <div class="col-md-6 pt-md-0 pt-4">
                    <h3 class="mb-sm-4 mb-3 title">기업소개</h3>
                    <p id="landing-information">ESG: 사회를 품다는 ESG 기반의<br>ESG: 사회를 품다는 ESG 기반의<br>ESG: 사회를 품다는 ESG 기반의<br>ESG: 사회를 품다는 ESG 기반의</p>
                    <div class="mt-md-5 mt-4 mb-lg-0 mb-4">
                        <button id="btn-scroll-move" class="btn button-style">More information</button>
                    </div>
                </div>
                <div class="col-md-6 mt-md-0 mt-4">
                    <!-- <img class="img-fluid" src="/asset/images/bannerimg.png" alt=" "> -->
                </div>
            </div>
        </div>
    </section>
    <!-- //banner section -->
    
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
                        <h3>ESG 란? <span>What is ESG?</span></h3>
                        <p>Aptent taciti sociosqu ad litora
                            conubia nostra, per inceptos himenaeos. Aenean volutpat elementum ante, id eleifend eros
                            luctus sit.</p>
                        <p>Nunc vel pellentesque. Class aptent taciti sociosqu ad litora
                            torquent per
                            conubia nostra, per inceptos himenaeos. Aenean volutpat elementum ante, id eleifend eros
                            luctus sit
                            amet. vel tincidunt erat neque non ipsum. Ut sollicitudin pharetra enim.</p>
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
                                <span class="fa fa-motorcycle" aria-hidden="true"></span>
                            </div>
                            <h5><a>Environment</a></h5>
                            <p>Lorem ante ipsum primis in faucibus orci luctus eted ultrices posuere curae fers
                                luctus eted.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-md-0 mt-4">
                        <div class="features4-grid">
                            <div class="feature-images">
                                <span class="fa fa-shopping-basket" aria-hidden="true"></span>
                            </div>
                            <h5><a>Social</a></h5>
                            <p>Lorem ante ipsum primis in faucibus orci luctus eted ultrices posuere curae fers
                                luctus eted.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-lg-0 mt-4">
                        <div class="features4-grid">
                            <div class="feature-images">
                                <span class="fa fa-laptop" aria-hidden="true"></span>
                            </div>
                            <h5><a>Governance</a></h5>
                            <p>Lorem ante ipsum primis in faucibus orci luctus eted ultrices posuere curae fers
                                luctus eted.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 3 grids -->
    
    <!-- call section -->
    <section class="w3l-call-to-action-6">
        <div class="call-vv-action py-5">
            <div class="container py-md-4 py-3">
                <div class="grid">
                    <div class="float-lt">
                        <h3 class="title-big">Contact us now!</h3>
                        <p>For Online queries, please call us today</p>
                    </div>
                    <div class="float-rt text-right">
                        <ul class="buttons">
                            <li class="phone"><span class="fa fa-volume-control-phone mr-1" aria-hidden="true"></span>
                                <a class="call-style-w3" href="tel:+1(23) 456 789 0000">+1(23) 456 789 0000</a>
                            </li>
                            <li class="green">Or</li>
                            <li><a href="contact.html" class="btn button-style">Get in touch</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //call section -->    

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
    <script src="/asset/js/jquery-3.3.1.min.js"></script>
    <!-- //common jquery plugin -->

    <!-- theme switch js (light and dark)-->
    <script src="/asset/js/theme-change.js"></script>
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
    <script src="/asset/js/jquery.magnific-popup.min.js"></script>
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
    <script src="/asset/js/bootstrap.min.js"></script>
    <!-- //bootstrap-->
    <!-- //Js scripts -->
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		$(document).ready(function(){
			$('#btn-scroll-move').click(function(){
				var offset = $('#moved-here').offset();
		        $('html').animate({scrollTop : offset.top}, 300);	
			});
		});
	</script>
</body>

</html>