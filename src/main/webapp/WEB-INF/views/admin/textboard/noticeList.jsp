<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<body class="sb-nav-fixed">
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">ESG: 관리자</a></li>
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
									<th>Comments</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>3</td>
									<td>System Architect</td>
									<td>2011/04/25</td>
									<td>9</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Accountant</td>
									<td>2011/07/25</td>
									<td>63</td>

								</tr>
								<tr>
									<td>1</td>
									<td>Junior Technical Author</td>
									<td>2009/01/12</td>
									<td>6</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
