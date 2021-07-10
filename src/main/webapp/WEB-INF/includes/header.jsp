<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!--header-->
<header id="site-header" class="fixed-top">
	<div class="container">
		<nav class="navbar navbar-expand-lg stroke px-0">
			<h1>
				<a class="navbar-brand" href="../index"> <i
					class="fa fa-cutlery" aria-hidden="true"></i> ESG: 사회를 품다
				</a>
			</h1>
			<!-- if logo is image enable this   
    <a class="navbar-brand" href="#index.html">
        <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
    </a> -->
			<button class="navbar-toggler  collapsed bg-gradient" type="button"
				data-toggle="collapse" data-target="#navbarTogglerDemo02"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon fa icon-expand fa-bars"></span> <span
					class="navbar-toggler-icon fa icon-close fa-times"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mx-lg-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${pageContext.request.contextPath}/index">Home <span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/board/textboardList">Board</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/board/noticeList">Notice</a></li>
					<!--  <li class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Pages <span class="fa fa-angle-down"></span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="blog.html">Blog Posts</a>
                                <a class="dropdown-item" href="blog-single.html">Blog Single</a>
                                <a class="dropdown-item" href="error.html">404 Page</a>
                                <a class="dropdown-item" href="landing-single.html">Landing Page</a>
                            </div>
                        </li> -->
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/news/newsList">ESG
							News</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/login">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/mypage">Mypage</a>
					</li>
				</ul>
			</div>
			<!-- search button -->
			<div class="search-right">
				<a href="#search" title="search"><span class="fa fa-search"
					aria-hidden="true"></span></a>
				<!-- search popup -->
				<div id="search" class="pop-overlay">
					<div class="popup">
						<h4 class="search-pop-text-w3 text-white text-center mb-4">Search
							Here Your Favourite Food</h4>
						<form action="error.html" method="GET" class="search-box">
							<div class="input-search">
								<span class="fa fa-search mr-2" aria-hidden="true"></span><input
									type="search" placeholder="Enter Keyword" name="search"
									required="required" autofocus="">
							</div>
							<button type="submit" class="btn button-style">Search</button>
						</form>
					</div>
					<a class="close" href="#close">Ã</a>
				</div>
				<!-- //search popup -->
			</div>
			<!-- //search button -->
			<!-- toggle switch for light and dark theme -->
			<div class="cont-ser-position">
				<nav class="navigation">
					<div class="theme-switch-wrapper">
						<label class="theme-switch" for="checkbox"> <input
							type="checkbox" id="checkbox">
							<div class="mode-container">
								<i class="gg-sun"></i> <i class="gg-moon"></i>
							</div>
						</label>
					</div>
				</nav>
			</div>
			<!-- //toggle switch for light and dark theme -->
		</nav>
	</div>
</header>
<!--//header-->