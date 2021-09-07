<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>
    <!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">ESG News</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="/">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>ESG News</li>
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
                	<div id="dateClone"></div>
                	<div id="date" style="display: none;"><h3 class="date"></h3></div>
                    <div class="bottom-grid mt-4 pt-2">
                        <div id="titleClone"></div>
	                	<div id="title" style="display: none;"><h3 class="title" style="margin-bottom: 55px;"></h3></div>
	                	<div id="thumbClone"></div>
	                	<div id="thumb" style="display: none;"><img class="thumb" style="margin-bottom: 55px;width: 100%;" alt=""></div>
	                	<div id="listClone"></div>
	                	<p id="content" style="display: none;"></p>
                    </div>
                    <!-- bottom -->
<!--                     <div class="row mb-4 pb-2">
                        <div class="col-sm-6">
                            <div class="blog-img-single">
                                <a href="#blog"><img src="assets/images/blog1.jpg" alt="" class="img-fluid" /></a>
                            </div>
                        </div>
                        <div class="col-sm-6 mt-sm-0 mt-4">
                            <div class="blog-img-single">
                                <a href="#blog"><img src="assets/images/blog2.jpg" alt="" class="img-fluid" /></a>
                            </div>
                        </div>
                    </div> -->
                    <div id="reporterClone" style="padding-top: 50px;"></div>
	                <strong id="reporter" style="display: none;"></strong>
                    <p class="para-single">세상을 보는 균형, 한국일보</p>
                    <!-- <div class="blog-single-tags d-flex align-items-center mt-4 pt-1 mb-5">
                        <div class="blog-tags">
                            <ul>
                                <li class="text-tag">Tags:</li>
                                <li><a href="#url">Fresh</a></li>
                                <li><a href="#url">Foodie</a></li>
                                <li><a href="#url">Eat</a></li>
                                <li><a href="#url">Healthy</a></li>
                            </ul>
                        </div>
                        <div class="social-singles ml-md-auto mt-md-0 mt-4">
                            <a href="#blog"><span class="fa fa-facebook" aria-hidden="true"></span></a>
                            <a href="#blog"><span class="fa fa-twitter" aria-hidden="true"></span></a>
                            <a href="#blog"><span class="fa fa-google-plus" aria-hidden="true"></span></a>
                            <a href="#blog"><span class="fa fa-pinterest-p" aria-hidden=" true"></span></a>
                        </div>
                    </div> -->
                    <!-- <div class="single-pagination clearfix">
                        <a class="prev-post pull-left" href="#prev"><span class="fa fa-arrow-left"
                                aria-hidden="true"></span>
                            Previous Post</a>
                        <a class="next-post pull-right" href="#next">Next Post <span class="fa fa-arrow-right"
                                aria-hidden="true"></span></a>
                    </div> -->
                    <!-- //blog single -->
                    <!-- comments section blog single -->
                    <!-- <section class="w3l-comments-9-main mt-5">
                        <div class="gallery-32">
                            <h3 class="title-main2-blog-single">Comments (2)</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="comment-grid">
                                        <p><i class="fa fa-quote-left" aria-hidden="true"></i> Sed ut perspiciatis unde
                                            omnis iste natus error sit voluptatem
                                            accusantium doloremque laudantium, totam rem aperiam.
                                        </p>
                                        <div class="testi-pos mt-3 d-flex align-items-center">
                                            <img src="assets/images/testi2.jpg" alt=""
                                                class="img-responsive rounded-circle mb-3" />
                                            <div class="right-coment">
                                                <h4>Nemo en</h4>
                                                <span>totam rem</span>
                                            </div>
                                        </div>
                                        <a href="#reply" class="reply-blog"><i class="fa fa-reply"></i>Reply</a>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-md-0 mt-4">
                                    <div class="comment-grid">
                                        <p><i class="fa fa-quote-left" aria-hidden="true"></i>
                                            Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut
                                            fugit, sed quia consequuntur magni dolores eos qui.
                                        </p>
                                        <div class="testi-pos mt-3 d-flex align-items-center">
                                            <img src="assets/images/testi1.jpg" alt=""
                                                class="img-responsive rounded-circle mb-3" />
                                            <div class="right-coment">
                                                <h4>eius mod</h4>
                                                <span>sed quia</span>
                                            </div>
                                        </div>
                                        <a href="#reply" class="reply-blog"><i class="fa fa-reply"></i>Reply</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section> -->
                    <!-- //comments section blog single -->
                    <!-- comments form blog single -->
                    <!-- <section class="w3l-form-comments-sec mt-5">
                        <div class="coments-forms-sub">
                            <h3 class="title-main2-blog-single">Leave A Message</h3>
                            <div class="form-commets">
                                <form action="#" method="post">
                                    <div class="row mb-4">
                                        <div class="col-md-6">
                                            <input type="text" name="Name" required="Name" placeholder="Your Name">
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-4">
                                            <input type="email" name="Email" required="Email" placeholder="Your Email">
                                        </div>
                                    </div>
                                    <textarea name="Message" required=""
                                        placeholder="Write your comments here"></textarea>
                                    <button class="btn button-style d-flex ml-auto" type="submit">Post comment</button>
                                </form>
                            </div>
                        </div>
                    </section> -->
                    <!-- //comments form blog single -->
					<div class="row" style="display: inline; padding: 1rem 1.1rem;">
						<div class="btn_area">
							<div class="btn_right" style="margin-top: 10px; float: right;">
								<a class="btn btn-primary btn-block myform" href="/news/newsList"
									style="background-color: #0abf53;">목록</a>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
    </section>
    <!-- //blog single -->
    <!-- //section divide border style -->

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
<!--     <script src="assets/js/jquery-3.3.1.min.js"></script> -->
    <!-- //common jquery plugin -->

    <!-- theme switch js (light and dark)-->
<!--     <script src="assets/js/theme-change.js"></script> -->
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

    <!-- MENU-JS -->
    <script>
    	var newsUrl = '${newsUrl}';
	    
	    $(document).ready(function(){
	    	newsObj.fn_getNewsInfo(newsUrl);
	    });
	    
	    let newsObj = {
	    	fn_getNewsInfo : function(newsUrl) {
	    		var param = "url="+newsUrl;
				ajaxParamExecute(param, "/news/getNewsInfo", "get", false, false, newsObj.fn_getNewsInfoReturn);
			},
			fn_getNewsInfoReturn : function(rst) {

				$('#dateClone').html('');
				var html = $('#date').clone().removeAttr('id').show();
				html.find('.date').text(rst.news.date);
				$('#dateClone').append(html);
				
				$('#titleClone').html('');
				var html2 = $('#title').clone().removeAttr('id').show();
				html2.find('.title').text(rst.news.title);
				$('#titleClone').append(html2);
				
				$('#thumbClone').html('');
				var html4 = $('#thumb').clone().removeAttr('id').show();
				html4.find('.thumb').attr("src", rst.news.thumb);
				$('#thumbClone').append(html4);
				
				$('#listClone').html('');
				if (rst.news.content.length > 0) {
					for (var i in rst.news.content) {
						var html3 = $('#content').clone().removeAttr('id').show();
						html3.text(rst.news.content[i]);
						$('#listClone').append(html3);
					}
				} else {
					$('#listClone').html('');
				}
				
				$('#reporterClone').html('');
				var html5 = $('#reporter').clone().removeAttr('id').show();
				html5.text(rst.news.reporter);
				$('#reporterClone').append(html5);
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
    <!-- <script src="assets/js/bootstrap.min.js"></script> -->
    <!-- //bootstrap-->
    <!-- //Js scripts -->
</body>

</html>