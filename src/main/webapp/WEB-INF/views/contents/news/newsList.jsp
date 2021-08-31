<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>

    
    <!--//header-->
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
    <!-- blog section -->
    <section class="w3l-blog-sec py-5">
        <div class="services-layout py-md-4 py-3">
            <div class="container">
                <h3 class="title-big mb-4 pb-2">ESG News</h3>
                <div class="row" id="listClone"></div>
                <div style="display: none;">
	                <div class="col-lg-4 col-md-6 column column-img" id="listCron" style="margin: 10px 0">
	                	<div class="services-gd">
	                		<div class="serve-info">
		                		<h3 class="date req_newspaper"></h3>
		                		<a>
		                			<figure>
		                				<img class="img-responsive req_thumb" alt="blog-image">
		                			</figure>
		                		</a>
		                		<h3>
		                			<a class="vv-link req_title"></a>
		                			<div class="req_content"></div>
		                		</h3>
		                		</div>
		                </div>
		            </div>
	            </div>
	            <form id="boardFrm" name="boardFrm" method="post" action="/news/newsView">
	            	<input type="hidden" id="newsUrl" name="newsUrl" value="">
				</form>
                <!-- pagination -->
<!--                 <div class="pagination">
                    <ul>
                        <li> <a href="#none" class="not-allowed" disabled="">
                                <span class="fa fa-angle-double-left" aria-hidden="true"></span>
                            </a>
                        </li>
                        <li><a class="active" href="#page">1</a></li>
                        <li>
                            <a href="#page">2</a>
                        </li>
                        <li>
                            <a href="#page">3</a>
                        </li>
                        <li>
                            <a href="#page"><span class="fa fa-angle-double-right" aria-hidden="true"></span>
                            </a>
                        </li>
                    </ul>
                </div> -->
                <!-- //pagination -->
            </div>
        </div>
    </section>
    <!-- //blog section -->
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
    
	    $(document).ready(function(){
	    	newsObj.fn_getNewsList();
	    });
	    
	    let newsObj = {
	    	fn_getNewsList : function() {
				ajaxParamExecute("", "/news/getNewsList", "get", false, false, newsObj.fn_getNewsListReturn);
			},
			fn_getNewsListReturn : function(rst) {
				$('#listClone').html('');
				
				if (rst.news.length > 0) {
					for (var i in rst.news) {
					
						var html = $('#listCron').clone().removeAttr('id').show();
						
						html.find('.req_newspaper').text(rst.news[i].newspaper);
						html.find('.req_thumb').attr("src", rst.news[i].thumb);
						html.find('.req_thumb').attr('onclick', 'newsObj.fn_view(\''+rst.news[i].url+'\')');
						html.find('.req_title').text(rst.news[i].title);
						html.find('.req_title').attr('onclick', 'newsObj.fn_view(\''+rst.news[i].url+'\')');
						html.find('.req_content').text(rst.news[i].content);
						
						$('#listClone').append(html);
					}
				} else {
					$('#listClone').html('');
				}
			},
			fn_view : function(url) {
				console.log(url);
				$('#newsUrl').val(url);
				$('#boardFrm').submit();
			}
	    };
    
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
	<script>
	  $(function(){
	     $('#site-header').hide();
	     $('.border-sec').hide();
	     $('.w3l-footer-16').hide();
	  });
	</script>
    <!-- //disable body scroll which navbar is in active -->

    <!--bootstrap-->
<!--     <script src="assets/js/bootstrap.min.js"></script> -->
    <!-- //bootstrap-->
    <!-- //Js scripts -->
</body>

</html>