<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
* {
    padding: 0;
    margin: 0;
    -webkit-text-size-adjust: none;
    -moz-text-size-adjust: none;
    -ms-text-size-adjust: none;
    box-sizing: border-box;
    -ms-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    font-family: 'NanumSquare', 'Noto Sans KR','맑은 고딕','sans-serif';
    font-size: 18px;
    font-weight: 400;
    line-height: 1;
    color: #333;
}
.pb-5, .py-5 {
    padding-bottom: 3rem !important;
}
.w3l-blog-single .single-bottom-blog {
    max-width: 950px;
    margin: 0 auto;
}
.w3l-blog-single .blog-img-single img {
    width: 100%;
    border-radius: 15px;
}
.mb-4, .my-4 {
    margin-bottom: 1.5rem !important;
}
.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}
.col-1, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8, .col-9, .col-10, .col-11, .col-12, .col, .col-auto, .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm, .col-sm-auto, .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12, .col-md, .col-md-auto, .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg, .col-lg-auto, .col-xl-1, .col-xl-2, .col-xl-3, .col-xl-4, .col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-10, .col-xl-11, .col-xl-12, .col-xl, .col-xl-auto {
    position: relative;
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
}
@media (min-width: 576px)
.mt-sm-0, .my-sm-0 {
    margin-top: 0 !important;
}
.w3l-blog-single .bottom-grid p, p.para-single {
    margin: 15px 0 30px;
}
.pt-1, .py-1 {
    padding-top: 0.25rem !important;
}
.mb-5, .my-5 {
    margin-bottom: 3rem !important;
}
.mt-4, .my-4 {
    margin-top: 1.5rem !important;
}
.align-items-center {
    align-items: center !important;
}
.blog-tags li.text-tag {
    color: var(--heading-color);
    font-size: 22px;
    margin-right: 10px;
}
.blog-tags li {
    display: inline;
}
.li {
    list-style-type: none;
}
.button, input, select, label, li, span {
    -webkit-appearance: none;
    outline: none;
    font-family: 'Open Sans', sans-serif;
}

.ul, ol, li, dl, dt, dd {
    list-style: none;
}
@media (min-width: 768px)
.ml-md-auto, .mx-md-auto {
    margin-left: auto !important;
}
@media (min-width: 768px)
.mt-md-0, .my-md-0 {
    margin-top: 0 !important;
}
.single-pagination a {
    display: grid;
    margin: 20px 0;
    grid-template-columns: auto auto;
    grid-gap: 10px;
    color: var(--heading-color);
    font-weight: 600;
    align-items: center;
}
.single-pagination a {
    display: grid;
    margin: 20px 0;
    grid-template-columns: auto auto;
    grid-gap: 10px;
    color: var(--heading-color);
    font-weight: 600;
    align-items: center;
}
.single-pagination a span.fa {
    font-size: 13px;
}
.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.fa {
    float: none !important;
    margin-right: 0.2em;
}
.button, input, select, label, li, span {
    -webkit-appearance: none;
    outline: none;
    font-family: 'Open Sans', sans-serif;
}
</style>
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/theme-change.js"></script>
    

<body class="sb-nav-fixed">
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index">ESG: 관리자</a></li>
					<li class="breadcrumb-item active">뿜업게시판</li>
				</ol>
			</div>
			<!-- blog single -->
			<section class="w3l-blog-single py-5">
				<div class="single-blog sec-padding py-md-4 py-3">
					<div class="container">
						<div class="single-bottom-blog">
							<h3 class="date">
								21<sup>st</sup> October
							</h3>
							<div class="blog-img-single">
								<img src="asset/images/single.jpg" alt=""
									class="img-fluid img-responsive" />
							</div>
							<div class="bottom-grid mt-4 pt-2">
								<h3>Our Latest Foodies Blog</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
									aute irure dolor in reprehenderit in voluptate velit esse
									cillum dolore eu fugiat nulla pariatur.</p>
								<p>Sed ut perspiciatis unde omnis iste natus error sit
									voluptatem accusantium doloremque laudantium, totam rem
									aperiam, eaque ipsa quae ab illo inventore aperiam, eaque ipsa
									quae ab illo inventore veritatis et quasi architecto beatae
									vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
									voluptas sit aspernatur aut odit aut fugit, sed quia
									consequuntur magni dolores eos qui ratione voluptatem sequi
									nesciunt.</p>
								<p>Dolore magna aliqua. Ut enim ad minim veniam, quis
									nostrud exercitation ullamco laboris nisi ut aliquip ex ea
									commodo consequat. Duis aute irure dolor in reprehenderit in
									voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
							</div>
							<!-- bottom -->
							<div class="row mb-4 pb-2">
								<div class="col-sm-6">
									<div class="blog-img-single">
										<a href="#blog"><img src="assets/images/blog1.jpg" alt=""
											class="img-fluid" /></a>
									</div>
								</div>
								<div class="col-sm-6 mt-sm-0 mt-4">
									<div class="blog-img-single">
										<a href="#blog"><img src="assets/images/blog2.jpg" alt=""
											class="img-fluid" /></a>
									</div>
								</div>
							</div>
							<p class="para-single">Sed ut perspiciatis unde omnis iste
								natus error sit voluptatem accusantium doloremque laudantium,
								totam rem aperiam, eaque ipsa quae ab illo inventore veritatis
								et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim
								ipsam voluptatem quia voluptas sit aspernatur aut odit aut
								fugit, sed quia consequuntur magni dolores eos qui ratione
								voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
								ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia
								non numquam eius modi tempora.</p>
							<p class="para-single">Neque porro quisquam est, qui dolorem
								ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia
								non numquam eius modi tempora incidunt ut labore et dolore
								magnam aliquam quaerat voluptatem. Ut enim ad minima veniam,
								quis nostrum exercitationem ullam corporis.suscipit laboriosam,
								nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum
								iure reprehenderit qui in ea voluptate velit esse quam nihil
								molestiae consequatur.</p>
							<p class="para-single">N Duis aute irure dolor in
								reprehenderit in voluptate velit esse cillum dolore eu fugiat
								nulla pariatur. Excepteur sint occaecat cupidatat non proident,
								sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
							<div
								class="blog-single-tags d-flex align-items-center mt-4 pt-1 mb-5">
							</div>
							<div class="single-pagination clearfix">
								<a class="prev-post pull-left" href="#prev">
								<span class="fa fa-arrow-left" aria-hidden="true"></span> Previous Post</a> 
								<a class="next-post pull-right" href="#next">Next Post
								<span class="fa fa-arrow-right" aria-hidden="true"></span>
								</a>
							</div>
							<!-- //blog single -->
							<!-- comments section blog single -->
							<section class="w3l-comments-9-main mt-5">
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
												<a href="#reply" class="reply-blog"><i
													class="fa fa-reply"></i>Reply</a>
											</div>
										</div>
										<div class="col-md-6 mt-md-0 mt-4">
											<div class="comment-grid">
												<p>
													<i class="fa fa-quote-left" aria-hidden="true"></i> Nemo
													enim ipsam voluptatem quia voluptas sit aspernatur aut odit
													aut fugit, sed quia consequuntur magni dolores eos qui.
												</p>
												<div class="testi-pos mt-3 d-flex align-items-center">
													<img src="assets/images/testi1.jpg" alt=""
														class="img-responsive rounded-circle mb-3" />
													<div class="right-coment">
														<h4>eius mod</h4>
														<span>sed quia</span>
													</div>
												</div>
												<a href="#reply" class="reply-blog"><i
													class="fa fa-reply"></i>Reply</a>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- //comments section blog single -->
							<!-- comments form blog single -->
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
							</section>
							<!-- //comments form blog single -->
						</div>
					</div>
				</div>
			</section>
			<!-- //blog single -->
		</main>
	</div>
</body>