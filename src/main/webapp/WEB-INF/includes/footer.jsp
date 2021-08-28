<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
.inputText{
	background: #fff;
	border: none; 
	padding: 12px 12px; 
	font-size: 15px;
    outline: none;
    width: 80%;
    color: #333;
    border: 1px solid var(--border-color-light);
    border-radius: 30px 30px 30px 30px;
    width:298px; 
}
</style>
<script>
function sendEmailValidation(){
	var name = $("#name").val();
	var content = $("#content").val();
	var email = $("#email").val();

	if(!name){
		alert("이름을 입력해주세요.");
		$("#name").focus();
	}else if(!content){
		alert("내용을 입력해주세요.");
		$("#content").focus();
	}else if(!email){
		alert("이메일 주소를 입력해주세요.");
		$("#email").focus();
	}else {
		sendEmail();
	}
}

function sendEmail(){
	$.ajax({
		url : "/mail",
		type : 'POST',
		data : {
			"name" : $("#name").val(),
			"content" : $("#content").val(),
			"email" : $("#email").val(),
		},
		success : function(data){
			if(data == true){
				alert("이메일 전송이 완료되었습니다.");
			} else {
				alert("이메일 전송 실패");
			}
		}
	})
}
</script>
<!-- section divide border style -->
<div class="border-sec"></div>
<!-- //section divide border style -->
<!-- footer -->
	<section class="w3l-footer-16">
		<div class="w3l-footer-16-main">
			<div class="container">
				<div class="row footer-p">
					<div class="col-lg-4 pr-lg-5" style="margin-top: -36px;">
						<a class="logo" href="index" style="display: contents;">
						<!-- <i class="fa fa-cutlery" aria-hidden="true"></i> Foodies -->
						<img class="" src="/asset/images/logo1.png" style="height: 36%; width: 41%; margin-left: 14px">
						</a>
						<p class="mt-4" style="margin-top:0px!important;margin-left: 30px;">기업의 실질적 ESG 경영을 위해, </p>
						<p class="my-4" style="margin-top:0px!important;margin-left: 30px;">우리들의 적극적인 행동이 시작되는 곳</p>
					</div>
					<div class="col-lg-4 mt-lg-0 mt-4">
						<h3>Pages</h3>
						<div class="row">
							<div class="col-6 column">
								<ul class="footer-gd-16">
									<li><a href="index.html"><i class="fa fa-angle-right"
											aria-hidden="true"></i>Home</a></li>
									<li><a href="about.html"><i class="fa fa-angle-right"
											aria-hidden="true"></i>About Us</a></li>
									<li><a href="#services"><i class="fa fa-angle-right"
											aria-hidden="true"></i>Board</a></li>
									<li><a href="blog.html"><i class="fa fa-angle-right"
											aria-hidden="true"></i>Login</a></li>
									<li><a href="contact.html"><i
											class="fa fa-angle-right" aria-hidden="true"></i>Contact Us</a></li>
								</ul>
							</div>
							<div class="col-6 column pl-0">
								<ul class="footer-gd-16">
									<li><a href="menu.html"><i class="fa fa-angle-right"
											aria-hidden="true"></i>Notice</a></li>
									<li><a href="#privacy"><i class="fa fa-angle-right"
											aria-hidden="true"></i>ESG News</a></li>
									<li><a href="#terms"><i class="fa fa-angle-right"
											aria-hidden="true"></i>My Page</a></li>
									<li><a href="#faq"><i class="fa fa-angle-right"
											aria-hidden="true"></i>Join Us</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-7 column mt-lg-0 mt-4">
						<!-- <h3>Newsletter</h3> -->
						<div class="end-column">
							<h3>Contact Us</h3>
							<form class="<!-- subscribe -->">
								<input type="text" name="name" placeholder="Name" required="required" class="inputText" id="name">
								<br><br>
								<input type="text" name="content" placeholder="Content" required="required" class="inputText" id="content">
								<br><br>
								<div style="display:flex;">
								<input type="email" name="email" placeholder="Email Address" required="required" id="email">
								<button type="button" onclick="sendEmailValidation()">
									<span class="fa fa-paper-plane" aria-hidden="true"></span>
								</button>
								</div>
							</form>
						<!-- <p>기업의 실질적 ESG 경영을 위해, <br>
							우리들의 적극적인 행동이 시작되는 곳</p>  -->
						</div>
					</div>
				</div>
				<div
					class="d-flex below-section justify-content-between align-items-center pt-4 mt-5">
					<div class="columns text-lg-left">
						<p class="copy-text">@ 2021 ESG. All rights reserved.</p>
					</div>
<!-- 					<div class="columns-2 mt-md-0 mt-3"> -->
<!-- 						<ul class="social"> -->
<!-- 							<li><a href="#facebook"><span class="fa fa-facebook" -->
<!-- 									aria-hidden="true"></span></a></li> -->
<!-- 							<li><a href="#linkedin"><span class="fa fa-linkedin" -->
<!-- 									aria-hidden="true"></span></a></li> -->
<!-- 							<li><a href="#twitter"><span class="fa fa-twitter" -->
<!-- 									aria-hidden="true"></span></a></li> -->
<!-- 							<li><a href="#google"><span class="fa fa-google-plus" -->
<!-- 									aria-hidden="true"></span></a></li> -->
<!-- 							<li><a href="#github"><span class="fa fa-github" -->
<!-- 									aria-hidden="true"></span></a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</section>
	<!-- //footer -->
 <br/>