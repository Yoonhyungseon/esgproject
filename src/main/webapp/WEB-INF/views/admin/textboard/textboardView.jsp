<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="js/jquery.js" type="text/javascript">
	$(document).ready(function() {
 	var progressbar = $('#progressbar'),
    max = progressbar.attr('max'),
    value = progressbar.val();
};
</script>
<style>
progress {
	width: 500px;
	margin: auto;
	margin-top: 3px;
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
</style>
<body class="sb-nav-fixed">
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index">ESG: 관리자</a></li>
					<li class="breadcrumb-item active">뿜업게시판</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i> 뿜업게시판
						</div>
					</div>
					<div class="card-body">
						<!-- blog single -->
						<h2 style="margin: auto; display: block;">ESG Board</h2>

						<h5 class="date" style="float: right;">
							Writer : <span style="font-weight: normal;"">Yejin</span> <br>
							21<sup>st</sup> October <br> Hits : <span
								style="font-weight: normal;">15</span> <br> Likes : <span
								style="font-weight: normal;">32</span> <br> Points : <span
								style="font-weight: normal;">320,800₩</span>
						</h5>
						<div class="blog-img-single">
							<img src="/asset/images/esg.jpg"
								style="width: 500px; height: 350px; margin: auto; display: block; padding: 20px;" />
							<progress id="progressbar" max="100" value="50" style="margin-left: 313px; width: 465px;"></progress>
						</div>
						<br> <br>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur.</p>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam,
							eaque ipsa quae ab illo inventore aperiam, eaque ipsa quae ab
							illo inventore veritatis et quasi architecto beatae vitae dicta
							sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit
							aspernatur aut odit aut fugit, sed quia consequuntur magni
							dolores eos qui ratione voluptatem sequi nesciunt.</p>
						<p>Dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat. Duis aute irure dolor in reprehenderit in voluptate
							velit esse cillum dolore eu fugiat nulla pariatur.</p>

						<div
							class="blog-single-tags d-flex align-items-center mt-4 pt-1 mb-5">
						</div>
						<div class="single-pagination clearfix">
							<a class="" href="#prev"> <span class="fa fa-arrow-left"
								aria-hidden="true"></span> Previous Post
							</a> <a class="" style="float: right;" href="#next">Next Post <span
								class="fa fa-arrow-right" aria-hidden="true"></span>
							</a>
						</div>

						<!-- comments section blog single -->
						<section class="w3l-comments-9-main mt-5">
							<div class="gallery-32">
								<h3 class="title-main2-blog-single">Comments (2)</h3>
								<div class="row">
									<div class="col-md-6">
										<div class="comment-grid">
											<p>
												<i class="fa fa-quote-left" aria-hidden="true"></i> 한이음 화이팅!
											</p>
											<div class="testi-pos mt-3 d-flex align-items-center">
												<img src="assets/images/testi2.jpg" alt=""
													class="img-responsive rounded-circle mb-3" />
												<div class="right-coment">
													<h4>정예진</h4>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 mt-md-0 mt-4">
										<div class="comment-grid">
											<p>
												<i class="fa fa-quote-left" aria-hidden="true"></i> 너희들도 주문
												“잘해왔고, 잘하고 있고, 잘할 수 있다”
											</p>
											<div class="testi-pos mt-3 d-flex align-items-center">
												<img src="assets/images/testi1.jpg" alt=""
													class="img-responsive rounded-circle mb-3" />
												<div class="right-coment">
													<h4>김재현멘토님</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						<!-- //comments section blog single -->

					</div>
					<div class="row" style="display: inline; padding: 1rem 1.1rem;">
						<div class="btn_area">
							<div class="btn_right" style="margin-top: 10px; float: right;">
								<a class="btn btn-primary btn-block myform" href="textboardList"
									style="color: white !important;">목록</a>
								<!-- <a class="btn btn-primary btn-block myform" href="companiesWrite" style="color: white!important;">수정</a> -->
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-book-open"></i> 뿜업게시판 피드백 등록
					</div>
					<form method="post" action="" enctype="multipart/form-data"
						class="card-body" style="text-align: center;">

						<div class="form-group">
							<label for="title" class="col-form-label"
								style="display: inline-block; margin-right: 60px;">Title</label>
							<input type="text" class="form-control" placeholder=" Title"
								name="title" id="title" required="required"
								style="width: 800px; display: inline-block;" />
						</div>
						<br>
						<div class="form-group">
							<!--  style="text-align: center;" -->
							<label for="content" class="col-form-label"
								style="display: inline-block; margin-right: 37px;">Content</label>
							<textarea name="content" class="form-control" id="content"
								placeholder="Content"
								style="width: 800px; display: inline-block;"></textarea>
						</div>
						<input type="submit" class="btn btn-primary"
							style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;"
							value="등록" />
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
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
