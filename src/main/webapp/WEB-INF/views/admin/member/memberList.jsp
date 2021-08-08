<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">회원관리</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">ESG: 관리자</a></li>
                    <li class="breadcrumb-item active">회원관리</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        회원 리스트
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                	<th>회원일련번호</th>
                                	<th>아이디</th>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>성별</th>
                                    <th>회원등급</th>
                                    <th>최종로그인일시</th>
                                    <th>가입등록날짜</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Member Serial Number</th>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Gender</th>
                                    <th>rank</th>
                                    <th>Last Access Date</th>
                                    <th>Start Date</th>
                                </tr>
                            </tfoot>
                            <tbody id="listClone">
                            </tbody>
                            
	                        <tr id="listCron" style="display:none;">
	                           <td class="req_num"></td>
	                           <td ><a href="#none" class="req_userId"></a></td>
	                           <td class="req_nm"></td>
	                           <td class="req_email"></td>
	                           <td class="req_gender"></td>
	                           <td class="req_userType"></td>
	                           <td class="req_lastLoginDt"></td>
	                           <td class="req_regDt"></td>
	                       </tr>
                        </table>
                        
                        <form id="boardFrm" name="boardFrm" method="post" action="/admin/member/memberView">
							<input type="hidden" id=memNum name="memNum" value="">
						</form>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    
    <script type="text/javascript">
    $(document).ready(function(){
    	memberObj.fn_getMemberList();
    });
    
	let memberObj = {
		fn_getMemberList : function() {
			ajaxParamExecute("", "/admin/member/getMemberList", "post", false, false, memberObj.fn_getMemberListRetrun);
		},
		fn_getMemberListRetrun : function(rst) {
// 			console.log(rst);
			$('#listClone').html('');
			
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('id').show();
					
					html.find('.req_nm').text(rst.resultList[i].nickName);
					html.find('.req_num').text(rst.resultList[i].memNum);
					
					if (rst.resultList[i].gender == 'M') html.find('.req_gender').text("남");
					else html.find('.req_gender').text("여");
				
					html.find('.req_userId').text(rst.resultList[i].userId);
					html.find('.req_userId').attr('onclick', 'memberObj.fn_view(\''+rst.resultList[i].memNum+'\')');
	                
					html.find('.req_email').text(rst.resultList[i].email);
					html.find('.req_userType').text(rst.resultList[i].userType);
					html.find('.req_lastLoginDt').text(rst.resultList[i].lastLoginDt);
					html.find('.req_regDt').text(rst.resultList[i].regDtYmd);

					$('#listClone').append(html);
				}
			} else {
				$('#listClone').html('');
			}
		},
		fn_view : function(memNum) {
// 			console.log(memNum);
			$('#memNum').val(memNum);
			$('#boardFrm').submit();
		}
	}
    </script>
