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
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 뿜업게시판 피드백 등록
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