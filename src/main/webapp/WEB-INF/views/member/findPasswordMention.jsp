<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>
<!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">비밀번호 변경</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>Modify Password</li>
                </ul>
            </div>
        </section>
    </div>
    <!-- //inner banner -->
    <!-- blog single -->
    <section class="w3l-blog-single py-5">
        <div class="single-blog sec-padding py-md-4 py-3">
            <div class="container">
                <div class="single-bottom-blog">
                    <div class="bottom-grid mt-4 pt-2">
                        <h3 class="find-id">비밀번호 변경</h3>
				        <form method="post" class="w3layouts-contact-fm" action="https://sendmail.w3layouts.com/submitForm">
	                        <div class="row main-cont-sec">
	                            <div class="col-md-6 left-cont-contact">
	                                <div class="form-group">
	                                    <label for="w3lName">새 비밀번호</label>
	                                    <input class="form-control" type="text" name="w3lName" id="w3lName" placeholder=""
	                                        required="">
	                                </div>
	                                <div class="form-group">
	                                    <label for="w3lName">새 비밀번호 확인</label>
	                                    <input class="form-control" type="text" name="w3lName" id="w3lName" placeholder=""
	                                        required="">
	                                </div>
	                            </div>
	                        </div>
	                        <div class="form-group-2 mt-4 login-button find-id-mention-button">
			                	<button type="submit" class="btn button-style d-flex ml-auto">변경하기</button>
			                </div>
			                <div class="form-group-2 mt-4 login-button">
			                	<button type="submit" class="btn button-style d-flex ml-auto">돌아가기</button>
			                </div>
	                    </form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>