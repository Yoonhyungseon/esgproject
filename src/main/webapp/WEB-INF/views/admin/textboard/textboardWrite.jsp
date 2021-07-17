<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<style>
.center {
	text-align: center;
	margin: auto;
}

#postingwrap {
	width: 700px;
	margin: auto;
}
</style>

<link href="asset/css/style.css" rel="stylesheet">

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
			<!-- Write Posting -->
			<section class="w3l-form-comments-sec mt-5 ">
				<form method="post" action="" enctype="multipart/form-data">
					<div align="center">
						<h3>뿜업게시판 피드백 등록</h3>
						<div class="top-inputs d-grid">
							<input type="text" placeholder="Title" name="title" id="w3lName"
								required="required" style="width: 800px; margin: auto;">
						</div>
						<br>
						<textarea name="content" id="ckeditor" placeholder="Content"
							style="width: 800px; margin: auto;"></textarea>
						<br> <br>
						<div class="inputArea">
							<input	type="submit" value="등록" />
						</div>
					</div>
				</form>
			</section>
			<!-- //Write Posting -->
		</main>
	</div>
</body>