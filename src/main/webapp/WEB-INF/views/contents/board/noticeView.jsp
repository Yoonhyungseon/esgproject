<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Notice</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>Notice</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->
<!-- blog single -->
<section class="w3l-blog-single py-5">
	<div class="single-blog sec-padding py-md-4 py-3">
		<div class="container">
			<div id="req_seq" style="display: none"></div>
			<div class="single-bottom-blog">
				<h3 id="req_date" class="date"></h3>

				<div class="bottom-grid mt-4 pt-2">
					<h3 id="req_title"></h3>
					<p id="req_subTitle" style="margin: auto; display: block;"></p>
					<br> <br>
					<div class="blog-img-single">
						<img id="req_file" class="img-fluid img-responsive" />
					</div>
					<p id="req_url"></p>
					<p id="req_content"></p>
				</div>
				<!-- <form id="boardFrm" name="boardFrm" method="post" action="/board/noticeView">
					<input type="hidden" id="post_seq" name="seq" value="">
					<div class="single-pagination clearfix">
						<input type="hidden" id="post_seq" name="seq" value=""> 
						<a class="prev-post pull-left" onclick="noticeObj.fn_getNoticePrev()">
						<span class="fa fa-arrow-left" aria-hidden="true"></span> Previous Post</a>
						<a class="next-post pull-right" onclick="noticeObj.fn_getNoticeNext()">Next Post <span
							class="fa fa-arrow-right" aria-hidden="true"></span></a>
					</div>
				</form> -->
				<div class="row" style="display: inline; padding: 1rem 1.1rem;">
					<div class="btn_area">
						<div class="btn_right" style="margin-top: 10px; float: right;">
							<a class="btn btn-primary btn-block myform" href="noticeList"
								style="background-color: #0abf53;">목록</a>
						</div>
					</div>
				</div>
				<!-- //blog single -->
			</div>
		</div>
	</div>
</section>
<!-- //blog single -->
<script type="text/javascript">
    $(document).ready(function(){
    	noticeObj.fn_getNoticeInfo('${seq}');
    });
    
    let noticeObj = {
    	fn_getNoticeInfo : function(seq) {
    		console.log(seq);
    		var param = "seq="+seq;
			ajaxParamExecute(param, "/board/getNoticeInfo", "post", false, false, noticeObj.fn_getNoticeInfoReturn);
		},
		fn_getNoticeInfoReturn : function(rst) {
 			console.log(rst)
 			//$('#req_seq').text(rst.resultInfo.seq);
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_subTitle').text(rst.resultInfo.subTitle);
 			if(rst.resultInfo.cUrl != null){
 				$('#req_url').show()
 				$('#req_url').text(rst.resultInfo.cUrl);
 			}
 			$('#req_content').html(rst.resultInfo.contents);
 			//location.reload();
		},
		fn_getNoticePrev : function() {
			$('#post_seq').val('${seq}');
    		var prevParam = "seq="+'${seq}';
    		console.log(prevParam);
			ajaxParamExecute(prevParam, "/board/getNoticePrev", "post", false, false, noticeObj.fn_getNoticePrevReturn);
		},
		fn_getNoticePrevReturn : function(rst){
			console.log(rst);
			$('#req_seq').text(rst.resultInfo.seq);
 			
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_subTitle').text(rst.resultInfo.subTitle);
 			if(rst.resultInfo.cUrl != null){
 				$('#req_url').show()
 				$('#req_url').text(rst.resultInfo.cUrl);
 			}
 			$('#req_content').text(rst.resultInfo.contents);
 		},
 		fn_getNoticeNext : function(){
 			$('#post_seq').val('${seq}');
 			var nextParam = "seq="+'${seq}';
    		console.log(nextParam);
			ajaxParamExecute(nextParam, "/board/getNoticeNext", "post", false, false, noticeObj.fn_getNoticeNextReturn);
		},
		fn_getNoticeNextReturn : function(rst){
			console.log(rst);
			$('#req_seq').text(rst.resultInfo.seq);
 			
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_subTitle').text(rst.resultInfo.subTitle);
 			if(rst.resultInfo.cUrl != null){
 				$('#req_url').show()
 				$('#req_url').text(rst.resultInfo.cUrl);
 			}
 			$('#req_content').text(rst.resultInfo.contents);
 		}
   }
    </script>

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
