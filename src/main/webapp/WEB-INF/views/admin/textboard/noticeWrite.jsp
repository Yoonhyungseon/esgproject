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
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 공지사항 등록
					</div>

					<form method="post" action="" enctype="multipart/form-data"
						class="card-body">

						<div class="top-inputs d-grid">
							<input type="text" class="form-control" placeholder=" Title"
								name="title" id="w3lName" required="required"
								style="width: 800px; margin: auto; align: center;" />
						</div>
						<br>
						<input type="text" class="form-control" placeholder=" Sub Title"
								name="subTitle" id="w3lName" required="required"
								style="width: 800px; margin: auto; align: center;" />
						<br>
						<textarea name="content" class="form-control" id="ckeditor"
							placeholder="Content" style="width: 800px; margin: auto;"></textarea>
						<br> <br> 
						<input id="filename" name="uploadImg"
							type="file" style="display: block; margin: auto;" /> <input
							type="submit" class="btn btn-primary"
							style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;"
							value="등록" />
					</form>
				</div>
			</div>
		</main>
	</div>
</body>






