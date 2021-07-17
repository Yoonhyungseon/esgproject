<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="static/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('ckeditor', {
			width : '70%',
			height : '200px',
		});
	});
</script>


<body class="sb-nav-fixed">
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index">ESG: 관리자</a></li>
					<li class="breadcrumb-item active">공지사항</li>
				</ol>
			</div>

			<section class="w3l-form-comments-sec mt-5 ">
				<form method="post" action="" enctype="multipart/form-data">
					<div align="center">
						<h3>공지사항 등록</h3>
						<div class="top-inputs d-grid">
							<input type="text" placeholder="Title" name="title" id="w3lName"
								required="required" style="width: 800px; margin: auto;">
						</div>
						<br>
						<textarea name="content" id="ckeditor"  placeholder="Content" style="width: 800px; margin: auto;"></textarea>
						<br> <br>
						<div class="inputArea">
							<input id="filename" name="uploadImg" type="file" /> 
							<input type="submit" value="등록" />
						</div>
					</div>
				</form>
			</section>
	</main>
	</div>
</body>





