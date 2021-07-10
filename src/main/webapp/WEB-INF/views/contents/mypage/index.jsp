<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<style>
.w3l-bottom-grids-6 .area-box:hover {
    transition: .3s;
    box-shadow: 0 25px 98px 0 rgb(0 0 0 / 10%);
}
.w3l-bottom-grids-6 .area-box {
    padding: 50px 35px;
    position: relative;
    z-index: 1;
    border-radius: 8px;
    box-shadow: 0 25px 98px 0 rgb(0 0 0 / 3%);
    background-color: var(--bg-color);
    text-align: center;
}
/*-- inner-banner --*/

.w3l-breadcrumb {
  display: block;
  text-align: center;
  margin: 0 auto;
  z-index: 100;
  padding-top: 150px;
  z-index: 99;
}

.breadcrumbs-custom-path {
  text-align: center;
  display: inline-block;
}

.breadcrumbs-custom-path li {
  position: relative;
  display: inline-block;
  vertical-align: middle;
  font-size: 18px;
  line-height: 1.5;
  text-transform: capitalize;
}

.breadcrumbs-custom-path li span.fa {
  font-size: 12px;
}

.breadcrumbs-custom-path a,
.breadcrumbs-custom-path a:active,
.breadcrumbs-custom-path a:focus {
  color: var(--secondary-color);
}

@media (max-width: 568px) {
  .inner-banner {
    min-height: 150px;
  }

  .breadcrumbs-custom-path li {
    font-size: 16px;
  }

  .w3l-breadcrumb {
    padding-top: 80px;
  }
}
.fa-chevron-right:before {
  content: "";
}
.mr-2,
.mx-2 {
  margin-right: 0.5rem !important;
}
/*-- //inner-banner --*/
</style>

<!-- inner banner -->
<div class="inner-banner">
	<div class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">MyPage</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="${pageContext.request.contextPath}/index">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>My Page</li>
			</ul>
		</div>
	</div>
</div>
<link href="assetYejin/css/style.css" rel="stylesheet">
<section class="w3l-bottom-grids-6 w3l-services py-5" id="services">
	<div class="container py-md-5 py-4">
	<h3 class="title-big mb-4 pb-2">My Page</h3>
		<div class="grids-area-hny main-cont-wthree-fea row">	
				<div class="col-lg-4 col-md-6 grids-feature">
                    <div class="area-box">
                    <img src="/asset/images/1.png" alt="" class="img-fluid" style="width: 60px; margin:auto;">
						<h4>
							<a href="modifyInfo" class="title-head">내 정보</a>
						</h4>
						<p class="">개인정보 수정하는 공간</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-md-0 mt-4">
                    <div class="area-box">
                        <img src="/asset/images/2post.png" alt="" class="img-fluid" style="width: 60px; margin:auto;">
						<h4>
							<a href="postList" class="title-head">게시글 작성내역</a>
						</h4>
						<p class="">내가 쓴 게시글 작성 내역</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-lg-0 mt-4">
                    <div class="area-box">
                        <img src="/asset/images/3comment.png" alt="" class="img-fluid" style="width: 60px; margin:auto;">
						<h4>
							<a href="commentList" class="title-head">댓글 작성내역</a>
						</h4>
						<p class="">내가 쓴 댓글 작성내역</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-lg-5 mt-4">
                    <div class="area-box">
                      <img src="/asset/images/4.scrap.png" alt="" class="img-fluid" style="width: 60px; margin:auto;">
						<h4>
							<a href="scrap" class="title-head">스크랩 공간</a>
						</h4>
						<p class="">나의 스크랩 공간</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-lg-5 mt-4">
                    <div class="area-box">
                        <img src="/asset/images/5.png" alt="" class="img-fluid" style="width: 60px; margin:auto;">
						<h4>
							<a href="wallet" class="title-head">내 지갑</a>
						</h4>
						<p class="">나의 지갑</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 grids-feature mt-lg-5 mt-4">
                    <div class="area-box">
                       <img src="/asset/images/6delete.png" alt="" class="img-fluid" style="width: 60px; margin:auto;">
						<h4>
							<a href="usage" class="title-head">Unsubscribe account</a>
						</h4>
						<p class="">Don't Unsubscribe Our Website</p>
                    </div>
                </div>
		</div>
	</div>
</section>