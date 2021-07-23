<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">기업 관리</h1>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 기업 상세
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>기업명</th>
								<th>기업 설명</th>
								<th>소비자 반응지수</th>
								<th>업데이트일</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>기업명</th>
								<th>기업 설명</th>
								<th>소비자 반응지수</th>
								<th>업데이트일</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td><input class="form-control myform" value="Tiger Nixon"
									disabled="disabled"></td>
								<td><input class="form-control myform" value="System Architect"
									disabled="disabled"></td>
								<td><input class="form-control myform" value="61"
									disabled="disabled"></td>
								<td><input class="form-control myform" value="2011/07/25"
									disabled="disabled"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row" style="display: inline; padding: 1rem 1.1rem;">
					<div class="btn_area">
	                	<div class="btn_right" style="margin-top:10px; float: right;">
	                		<a class="btn btn-primary btn-block myform" href="companiesList" style="color: white!important;">목록</a>
	                		<a class="btn btn-primary btn-block myform" href="companiesWrite" style="color: white!important;">수정</a>
<!-- 							<button type="button" class="btn btn-primary btn-block myform"  onclick="consultingObj.fn_list()">목록</button> -->
<!-- 							<button type="button" class="btn btn-primary btn-block myform"  onclick="consultingObj.fn_save()">수정</button> -->
	                    </div>
	                </div>
				</div>
			</div>
			

		</div>
	</main>
</div>

<script type="text/javascript">	
$(document).ready(function() {
	setTimeout(function() {
		$(".dataTable-top").hide();	
		$(".dataTable-bottom").hide();	
	}, 1);
	
})
</script>

