<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication"%>

<script src="js/jquery.js" type="text/javascript">
	$(document).ready(function() {
 	var progressbar = $('#progressbar'),
    max = progressbar.attr('max'),
    value = progressbar.val();
};
</script>
<style>
progress {
	width: 100%;
	margin: auto;
	height: 15px;
	margin-top: 10px;
}

progress::-webkit-progress-bar {
	background-color: rgb(192, 192, 192);
	width: 100%;
	border-radius: 15px;
}

progress::-webkit-progress-value {
	background-color: #0abf53;
	color: white;
	padding: 1%;
	text-align: right;
	font-size: 20px;
	border-radius: 15px;
}

.Yrow {
	display: flow-root;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px;
}
</style>

<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">게시글</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="../index">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>MyPage</li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>PostList</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->
<!-- blog section -->
<section class="w3l-blog-sec py-5">
	<div class="services-layout py-md-4 py-3">
		<div class="container">
			<h3 class="title-big mb-4 pb-2">My Post</h3>
			<div class="Yrow">
				<div id="listClone"></div>
				<div id="listCron" style="display: none;">
					<div class="col-lg-4 col-md-6 column column-img" id="zoomIn"
						style="float: left; margin: 10px 0;">
						<div class="services-gd">
							<div class="serve-info">
								<h3 class="date"></h3>
								<a class="req_title"><img class="img-responsive"
									id="req_file" alt="blog-image"></a>
								<h3>
									<a href="#none" id="req_title" class="req_title"></a>
								</h3>
								<ul class="admin-list">
									<li><div id="req_regName">
											<span class="fa fa-user-circle" aria-hidden="true"></span>
										</div></li>
									<li id="pick-switch-range req_scrap"
										style="font-size: 15px; text-transform: capitalize; color: #6b6768;">
										<a id="pick-switch"><span class="fa fa-heart req_scrap" aria-hidden="true"></span></a>
									</li>
									<li	style="display: inline-table; font-size: 15px; text-transform: capitalize; color: #6b6768;">
										<span class="fa fa-comments req_comments" aria-hidden="true"></span>
										Comments
									</li>
								</ul>
								<progress id="progressbar" max="100" value="50"></progress>
							</div>
						</div>
					</div>
					<form id="boardFrm" name="boardFrm" method="post" action="/board/textboardView">
						<input type="hidden" id="boardSsn" name="boardSsn" value="${boardSsn}">
					</form>
				</div>
			</div>
			<!-- pagination -->
			<div class="pagination">
				<ul>
					<li><a href="#none" class="not-allowed" disabled=""> <span
							class="fa fa-angle-double-left" aria-hidden="true"></span>
					</a></li>
					<li><a class="active" href="#page">1</a></li>
					<li><a href="#page">2</a></li>
					<li><a href="#page">3</a></li>
					<li><a href="#page"><span class="fa fa-angle-double-right" aria-hidden="true"></span> </a></li>
				</ul>
			</div>
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
<script src="assets/js/jquery-3.3.1.min.js"></script>
<!-- //common jquery plugin -->

<!-- theme switch js (light and dark)-->
<script src="assets/js/theme-change.js"></script>
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
<script src="assets/js/bootstrap.min.js"></script>
<!-- //bootstrap-->
<!-- //Js scripts -->
    
    
    <script type="text/javascript">
//	var uName = '${uName}'
	var uName = 'esg'
		
	$(document).ready(function(){
    	boardObj.fn_getScrapList(uName);
    });
    
	let boardObj = {
		fn_getScrapList : function() {
			var param = "uName="+uName;
			ajaxParamExecute(param, "/mypage/getScrapList", "post", false, false, boardObj.fn_getScrapListReturn);
		},
		fn_getScrapListReturn : function(rst) {
 			console.log(rst);
 			$('#listClone').html('');
			console.log(rst.resultList.length);
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('id').show();
					
					
					html.find('#req_title').text(rst.resultList[i].title);
					html.find('#req_title, .req_title').attr('onclick', 'boardObj.fn_view(\''+rst.resultList[i].boardSsn+'\')');
	               
					html.find('.date').text(rst.resultList[i].regDtYmd);

					html.find('.req_comments').text(rst.resultList[i].comments);
					
					html.find('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultList[i].attFile);

					html.find('#req_regName').text(rst.resultList[i].uName);

					html.find('.req_scrap').text(rst.resultList[i].scraps);
					
					$('#listClone').append(html);
				}
			} else {
				$('#listClone').html('');
			}
		},
		fn_view : function(boardSsn) {
 			console.log(boardSsn);
			$('#boardSsn').val(boardSsn);
			$('#boardFrm').submit();
		},
		fn_info : function(boardSsn){
			var boardSsn = $('#boardSsn').val(boardSsn);
			console.log(boardSsn);
			var url="${pageContext.request.contextPath}/board/textboardView?boardSsn="+boardSsn; 
			//location.href="${pageContext.request.contextPath}/board/textboardView?boardSsn=${boardSsn}";
			location.href=url;
		}
	}
	
	</script>