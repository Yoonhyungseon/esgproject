<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
							Writer : <span style="font-weight: normal;"">Yejin</span>
							<br> 
							21<sup>st</sup> October
							<br>
							Hits : <span style="font-weight: normal;">15</span>
							<br>
							Likes : <span style="font-weight: normal;">32</span>
							<br>
							Points : <span style="font-weight: normal;">320,800₩</span>
						</h5>
						<div class="blog-img-single">
							<img src="/asset/images/esg.jpg"
								style="width: 500px; height: 350px; margin: auto; display: block; padding: 20px;" />
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
							<a class="" href="#prev"> 
								<span class="fa fa-arrow-left" aria-hidden="true"></span> Previous Post
							</a> 
							<a class="" style="float:right;" href="#next">Next Post 
								<span class="fa fa-arrow-right" aria-hidden="true"></span>
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
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-book-open"></i> 뿜업게시판 피드백 등록
					</div>
					<form method="post" action="" enctype="multipart/form-data"
						class="card-body">

						<div class="top-inputs d-grid">
							<input type="text" class="form-control" placeholder=" Title"
								name="title" id="w3lName" required="required"
								style="width: 800px; margin: auto; align: center;" />
						</div>
						<br>
						<textarea name="content" class="form-control" id="ckeditor"
							placeholder="Content" style="width: 800px; margin: auto;"></textarea>
						<br> <br>
						<input type="submit" class="btn btn-primary"
							style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;"
							value="등록" />
					</form>
				</div>
			</div>
		</main>
	</div>
</body>

