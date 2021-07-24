<%@ page contentType="text/html;charset=UTF-8" language="java"%>

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
						<i class="fas fa-table me-1"></i> 공지사항
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>No.</th>
									<th>Title</th>
									<th>Date</th>
									<!-- <th>Comments</th> -->
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>3</td>
									<td><a href="noticeView">System Architect</a></td>
									<td>2011/04/25</td>
									<!-- <td>9</td> -->
								</tr>
								<tr>
									<td>2</td>
									<td><a href="noticeView">Accountant</a></td>
									<td>2011/07/25</td>
									<!-- <td>63</td> -->
								</tr>
								<tr>
									<td>1</td>
									<td><a href="noticeView">Junior Technical Author</a></td>
									<td>2009/01/12</td>
									<!-- <td>6</td> -->
								</tr>
							</tbody>
						</table>
						<div class="inputArea">
							<a class="btn btn-primary" role="button" style="float: right; color: white;" href="noticeWrite">Post</a>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
