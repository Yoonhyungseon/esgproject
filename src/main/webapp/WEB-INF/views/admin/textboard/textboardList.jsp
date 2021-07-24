<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<body class="sb-nav-fixed">
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">ESG: 관리자</a></li>
					<li class="breadcrumb-item active">뿜업게시판</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 뿜업게시판
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>작성자</th>
									<th>조회수</th>
									<th>작성일</th>
									<th>모금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td><a href="textboardView">홈플러스 계산원에게 의자를 주세요</a></td>
									<td>윤형선</td>
									<td>61</td>
									<td>2021/07/24</td>
									<td>320,800원</td>
								</tr>
								<tr>
									<td>2</td>
									<td><a href="textboardView">포카칩의 과대포장에 대해서..</a></td>
									<td>외붕이</td>
									<td>43</td>
									<td>2021/07/16</td>
									<td>120,300원</td>
								</tr>
								<tr>
									<td>3</td>
									<td><a href="textboardView">폐건전지 재생사업을 제안합니다.</a></td>
									<td>홍길동</td>
									<td>93</td>
									<td>2021/06/09</td>
									<td>920,800원</td>
								</tr>
							</tbody>
						</table>
						<!-- <div class="inputArea">
							<a class="btn btn-primary" role="button"
								style="float: right; color: white;" href="textboardWrite">Post</a>
						</div> -->
					</div>
				</div>
			</div>
		</main>
	</div>
</body>

