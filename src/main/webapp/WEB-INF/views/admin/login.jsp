<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Meta, title, CSS, favicons, etc. -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>ESG 관리자</title>

		<!-- Bootstrap -->
		<link href="/adminLayer/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Font Awesome -->
		<link href="/adminLayer/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<!-- NProgress -->
		<link href="/adminLayer/vendors/nprogress/nprogress.css" rel="stylesheet">
		<!-- Animate.css -->
		<link href="/adminLayer/vendors/animate.css/animate.min.css" rel="stylesheet">

		<!-- Custom Theme Style -->
		<link href="/adminLayer/build/css/custom.min.css" rel="stylesheet">

		<!-- Custom UI css -->
		<link rel="stylesheet" href="/adminLayer/build/css/ui.css">
	</head>
	<body class="login">
		<div id="body">
			<div class="body_inner">
				<h1>ESG<br/>관리자</h1>
				<div class="login_wrapper">
					<div class="animate form login_form">
						<section class="login_content">
						<form th:action="@{/login}" method="POST" class="form-signin" id="login_form" name="login_form">
							<div class="pl60 text-aling-r relative ">
								<input type="text" id="loginId" name="loginId" th:placeholder="LoginId" class="form-control" />
							</div>
							<div class="pl60 text-aling-r relative ">
								<input type="password" th:placeholder="Password" id="password" name="password" class="form-control" />
							</div>
							<div class="text-aling-r">
								<!-- <a class="btn btn-default submit m0" href="index.html" onclick="document.login_form.submit();">로그인</a> -->
								<button class="btn btn-default submit m0" name="Submit" value="Login" type="Submit" th:text="Login">로그인</button>
							</div>
							<input type="hidden" name="loginRedirect" value="${loginRedirect}" />
	  
							<div class="clearfix"></div>
	 					</form>
	 					</section>
					</div>
				</div>
        		<div class="separator">
          			<p class="change_link">관계자 외 이용을 금합니다.</p>
    				<div class="clearfix"></div>
					<br />
				</div>
			</div>
		</div>
		<div>
      		<p class="copyright">Copyright ⓒ ESG. All Rights Reserved.</p>
    	</div>
  	</body>
</html>