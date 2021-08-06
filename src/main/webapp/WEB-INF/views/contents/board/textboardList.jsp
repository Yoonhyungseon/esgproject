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

/* .container_bar {
	background-color: rgb(192, 192, 192);
	width: 100%;
	border-radius: 15px;
	height: 15px;
}

.skill {
	background-color: rgb(116, 194, 92);
	color: white;
	padding: 1%;
	text-align: right;
	font-size: 12px;
	border-radius: 15px;
	height: 15px;
}

.html {
	width: 80%; */
}
</style>
<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Board</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="../index">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>BoardList</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->
<!-- blog section -->
<section class="w3l-blog-sec py-5">
	<div class="services-layout py-md-4 py-3">
		<div class="container">
			<h3 class="title-big mb-4 pb-2">Blog Posts</h3>

			<div class="row">
				<div class="col-lg-4 col-md-6 column column-img" id="zoomIn">
					<div class="services-gd">
						<div class="serve-info serveInfoSize">
							<h3 class="date">
								21<sup>st</sup> October
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive uploadImg"
										src="/asset/images/straw.jpg" alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">빨대는 바다 생물들에게 해로운 영향을
									줄 수 있어요. 저는 앞으로 이 빨대가 붙어있는 제품을 사용하지 않겠습니다.</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> 중앙초</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>55 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>7 Comments</a></li>
							</ul>
							<!-- 	<div class="container_bar">
								<div class="skill html">80%</div>
							</div>
							<br> -->
							<progress id="progressbar" max="100" value="50"></progress>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 column column-img mt-md-0 mt-4"
					id="zoomIn">
					<div class="services-gd">
						<div class="serve-info serveInfoSize">
							<h3 class="date">
								6<sup>th</sup> January
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive uploadImg"
										src="/asset/images/parking.PNG" alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">젊은
									청년들의 건강과 인권을 생각해 백화점 측에서 패딩을 입을 수 있도록 배려해줬으면 좋겠습니다.</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> 김영웅</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>55 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>30 Comments</a></li>
							</ul>
							<progress id="progressbar" max="100" value="80"></progress>
						</div>
					</div>
				</div>
				<div
					class="col-lg-4 col-md-6 mt-lg-0 mt-md-5 mt-4 column column-img"
					id="zoomIn">
					<div class="services-gd">
						<div class="serve-info serveInfoSize">
							<h3 class="date">
								1<sup>st</sup> November
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive uploadImg"
										src="/asset/images/spam.jpg" alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">스팸 캔은 이미 밀봉 상태라 플라스틱
									뚜껑을 굳이 씌울 필요가 없습니다. 스팸 뚜껑은 반납합니다.</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> 쓰담쓰담</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>15 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>10 Comments</a></li>
							</ul>
							<progress id="progressbar" max="100" value="30"></progress>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-md-5 mt-4 column column-img"
					id="zoomIn">
					<div class="services-gd">
						<div class="serve-info">
							<h3 class="date">
								5<sup>st</sup> October
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive" src="assets/images/blog1.jpg"
										alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">Cras fringilla, enim
									a porta fermentum</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> Admin</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>6 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>9 Comments</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-md-5 mt-4 column column-img"
					id="zoomIn">
					<div class="services-gd">
						<div class="serve-info">
							<h3 class="date">
								7<sup>st</sup> October
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive" src="assets/images/blog4.jpg"
										alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">Cras fringilla, enim
									a porta fermentum</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> Admin</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>9 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>8 Comments</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-md-5 mt-4 column column-img"
					id="zoomIn">
					<div class="services-gd">
						<div class="serve-info">
							<h3 class="date">
								4<sup>st</sup> October
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive" src="assets/images/blog3.jpg"
										alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">Cras fringilla, enim
									a porta fermentum</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> Admin</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>8 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>6 Comments</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-md-5 mt-4 column column-img"
					id="zoomIn">
					<div class="services-gd">
						<div class="serve-info">
							<h3 class="date">
								21<sup>st</sup> October
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive" src="assets/images/blog6.jpg"
										alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">Nunc consequat justo
									id commodo feugiat</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> Admin</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>7 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>8 Comments</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div
					class="col-lg-4 col-md-6 mt-md-5 mt-4column column-img mt-md-0 mt-4"
					id="zoomIn">
					<div class="services-gd">
						<div class="serve-info">
							<h3 class="date">
								23<sup>rd</sup> October
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive" src="assets/images/blog2.jpg"
										alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">Fusce ac eros quis
									metus por edit some</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> Admin</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>9 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>7 Comments</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mt-md-5 mt-4 column column-img"
					id="zoomIn">
					<div class="services-gd">
						<div class="serve-info">
							<h3 class="date">
								1<sup>st</sup> November
							</h3>
							<a href="textboardView">
								<figure>
									<img class="img-responsive" src="assets/images/blog5.jpg"
										alt="blog-image">
								</figure>
							</a>
							<h3>
								<a href="textboardView" class="vv-link">Cras fringilla, enim
									a porta fermentum</a>
							</h3>
							<ul class="admin-list">
								<li><a href="textboardView"><span
										class="fa fa-user-circle" aria-hidden="true"></span> Admin</a></li>
								<li><a href="textboardView"><span class="fa fa-heart"
										aria-hidden="true"></span>6 Likes</a></li>
								<li><a href="textboardView"><span
										class="fa fa-comments" aria-hidden="true"></span>9 Comments</a></li>
							</ul>
						</div>
					</div>
					<br>
					<button class="btn button-style d-flex ml-auto"
						onClick="location.href='${pageContext.request.contextPath}textboardWrite'"
						type="submit">Posting</button>
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
					<li><a href="#page"><span class="fa fa-angle-double-right"
							aria-hidden="true"></span> </a></li>
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
