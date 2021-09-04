<%@ page contentType="text/html;charset=UTF-8" language="java"%>


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
	margin-top: 3px;
}

progress::-webkit-progress-bar {
	background-color: rgb(192, 192, 192);
	width: 100%;
	border-radius: 15px;
}

progress::-webkit-progress-value {
	background-color:  #0abf53;
	color: white;
	padding: 1%;
	text-align: right;
	font-size: 20px;
	border-radius: 15px;
}
</style>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Blog
				Sinle</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>Blog Sinle</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->
<!-- blog single -->
<section class="w3l-blog-single py-5">
	<div class="single-blog sec-padding py-md-4 py-3">
		<div class="container">
			<div id="req_seq" style="display: none">${boardSsn}</div>
			<div class="single-bottom-blog">
				<h3 id="req_date" class="date">${regDtYmd}</h3>
				<div class="blog-img-single">
					<img id="req_file" class="img-fluid img-responsive" style="width:100%;"/>
				</div>

				<div class="bottom-grid mt-4 pt-2">
					<h3 id="req_title">${title}</h3>

					<p id="req_content">${contents}</p>
				</div>
				<!-- bottom -->
				
				<progress id="progressbar" max="100" value="50"></progress>

				<div
					class="blog-single-tags d-flex align-items-center mt-4 pt-1 mb-5">
					<div class="blog-tags">
						<ul>
							<li class="text-tag">Tags:</li>
							<li><a href="#url" id="req_hash">${hashTag}</a></li>
						</ul>
					</div>
					<div class="social-singles ml-md-auto mt-md-0 mt-4">
						<a href="#blog"><span class="fa fa-facebook"aria-hidden="true"></span></a> 
						<a href="#blog"><span class="fa fa-twitter" aria-hidden="true"></span></a> 
						<a href="#blog"><span class="fa fa-google-plus" aria-hidden="true"></span></a> 
						<a href="#blog"><span class="fa fa-pinterest-p"	aria-hidden=" true"></span></a>
					</div>
				</div>
				<div class="single-pagination clearfix">
					<a class="prev-post pull-left" href="#prev"><span
						class="fa fa-arrow-left" aria-hidden="true"></span> Previous Post</a>
					<a class="next-post pull-right" href="#next">Next Post <span
						class="fa fa-arrow-right" aria-hidden="true"></span></a>
				</div>
				<!-- //blog single -->
				<!-- comments section blog single -->
			<!-- 	<section class="w3l-comments-9-main mt-5">
					<div class="gallery-32">
						<h3 class="title-main2-blog-single">Comments (2)</h3>
						<div class="row">
							<div class="col-md-6">
								<div class="comment-grid">
									<p>
										<i class="fa fa-quote-left" aria-hidden="true"></i> Sed ut
										perspiciatis unde omnis iste natus error sit voluptatem
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
									<p>
										<i class="fa fa-quote-left" aria-hidden="true"></i> Nemo enim
										ipsam voluptatem quia voluptas sit aspernatur aut odit aut
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
				</section>
				//comments section blog single
				comments form blog single
				<section class="w3l-form-comments-sec mt-5">
					<div class="coments-forms-sub">
						<h3 class="title-main2-blog-single">Leave A Message</h3>
						<div class="form-commets">
							<form action="#" method="post">
								<div class="row mb-4">
									<div class="col-md-6">
										<input type="text" name="Name" required="Name"
											placeholder="Your Name">
									</div>
									<div class="col-md-6 mt-md-0 mt-4">
										<input type="email" name="Email" required="Email"
											placeholder="Your Email">
									</div>
								</div>
								<textarea name="Message" required=""
									placeholder="Write your comments here"></textarea>
								<button class="btn button-style d-flex ml-auto" type="submit">Post
									comment</button>
							</form>
						</div>
					</div>
				</section> -->
				<!-- //comments form blog single -->
				<div class="btn_right" style="margin-top: 10px; float: right;">
					<a class="btn button-style" href="textboardList" style="background-color: #0abf53;">목록</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- //blog single -->
<script type="text/javascript">
var boardSsn="${boardSsn}";
// var boardSsn='172';
    $(document).ready(function(){
    	boardObj.fn_getBoardInfo(boardSsn);
    });
    
    let boardObj = {
    	fn_getBoardInfo : function(boardSsn) {
    		console.log(boardSsn);
    		var param = "boardSsn="+boardSsn;
			ajaxParamExecute(param, "/board/getBoardInfo", "post", false, false, boardObj.fn_getBoardInfoReturn);
		},
		fn_getBoardInfoReturn : function(rst) {
 			console.log(rst)
 			//$('#req_seq').text(rst.resultInfo.seq);
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_hash').text(rst.resultInfo.hashTag);
 			$('#req_content').html(rst.resultInfo.contents);
 			
 			if(rst.userInfo == rst.resultInfo.regId){
 				console.log("내가 쓴글!!!");
 				$('#deletBtn').show();
 			}else{
 				$('#deletBtn').hide();
 				console.log("내가 쓴글 아님!!!");
 			}
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
