<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="sb-nav-fixed">
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
					<div class="card-body">
						<form action="noticeResult" method="post"
							enctype="multipart/form-data" style="text-align: center;">
							<!-- <sec:csrfInput /> -->
							<div class="form-group">
								<label for="title" class="col-form-label"
									style="display: inline-block; margin-right: 60px;">Title</label>
								<input type="text" class="form-control" placeholder=" Title"
									name="title" id="title" required="required"
									style="width: 800px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<!-- style="text-align: center;" -->
								<label for="subTitle" class="col-form-label"
									style="display: inline-block; margin-right: 30px;">Sub
									Title</label> <input type="text" class="form-control"
									placeholder=" Sub Title" name="subTitle" id="subTitle"
									required="required"
									style="width: 800px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<!-- style="text-align: center;" -->
								<label for="cUrl" class="col-form-label"
									style="display: inline-block; margin-right: 60px;">URL</label>
								<input type="text" class="form-control" placeholder=" URL"
									name="cUrl" id="cUrl" required="required"
									style="width: 800px; display: inline-block;" />
							</div>
							<br>
							<div class="form-group">
								<!--  style="text-align: center;" -->
								<label for="contents" class="col-form-label"
									style="display: inline-block; margin-right: 37px;">Content</label>
								<textarea name="contents" class="form-control" id="contents"
									placeholder="Content"
									style="width: 800px; display: inline-block;"></textarea>
							</div>
							<br> 
							<input id="filename" name="attFile" type="file"
								style="display: block; margin: auto;" />
					
							<input type="submit" value="등록back" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;"
							onclick="history.back()">
							<input type="submit" value="등록등록" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;"
							onClick="location.href='${pageContext.request.contextPath}/admin/textboard/noticeResult'">
							<!-- 저장되지만 ajaxSiteBoardSave로 이동 -->
							<button type="submit" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;"
							formaction="/admin/textboard/noticeList" formmethod = "post">등록버튼</button>
							<!-- 저장과 이동 둘다 안됌 -->
							<button type="submit" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;"
							onClick="location.href='${pageContext.request.contextPath}/admin/textboard/noticeList'">등록리스트</button>
							<!-- 저장되지만 ajaxSiteBoardSave로 이동 -->
						</form>
						<button type="submit" class="btn btn-primary" style="float: right; background-color: #0d6efd; padding: 0.375rem 0.75rem;"
							onClick="location.href='${pageContext.request.contextPath}/admin/textboard/noticeResult'">등록</button> 
						<!-- 이동 잘되지만 저장되지 않음 -->
					</div>
				</div>
			</div>
		</main>
	</div>
</div>
    






