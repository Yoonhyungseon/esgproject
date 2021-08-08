<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">회원상세</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">ESG: 관리자</a></li>
                    <li class="breadcrumb-item active">회원상세</li>
                </ol>
                
            </div>
            
            <div class="content">



    <!-- Content -->
    <div id="content" class="colM">

        <h1>Change member</h1>
        <div id="content-main">


      

            <form method="post" id="member_form" novalidate><input type="hidden" name="csrfmiddlewaretoken" value="IK0znXt8rwABHrXL2enwhZCXhPflgZ2r2vNtmEJMSLLwI2R6AreEEm06gtZ195wc">
                <div>







                    <fieldset class="module aligned ">
						<div class="form-row field-mem_num">


                            <div>


                                <label class="required" for="id_mem_num">회원일련번호:</label>

                                <input type="number" name="mem_num" value="1" class="vIntegerField" maxlength="255" required id="id_id_m" disabled>



                            </div>

                        </div>
						


                        <div class="form-row field-id_m">


                            <div>


                                <label class="required" for="id_id_m">아이디:</label>

                                <input type="text" id="req_id" name="id_m" value="jeongiun" class="vTextField" maxlength="255" required id="id_id_m" disabled>



                            </div>

                        </div>


                        <div class="form-row field-name">


                            <div>


                                <label class="required" for="id_name">이름:</label>

                                <input type="text" name="name" value="이범기" class="vTextField" maxlength="255" required id="id_name" disabled>



                            </div>

                        </div>

 						<div class="form-row field-email">


                            <div>


                                <label class="required" for="id_email">이메일:</label>

                                <input type="text" name="email" value="jeongiun@naver.com" class="vTextField" maxlength="255" required id="id_email" disabled>



                            </div>

                        </div>
<!--  
                        <div class="form-row field-question">


                            <div>


                                <label class="required" for="id_question">질문:</label>

                                <input type="text" name="question" value="나의 고향은" class="vTextField" maxlength="255" required id="id_nickname">



                            </div>

                        </div>
-->
<!-- 
                        <div class="form-row field-gender">


                            <div>


                                <label class="required" for="id_gender">성별:</label>

                                <input type="text" name="gender" value="남" class="vTextField" maxlength="255" required id="id_gender">



                            </div>

                        </div>
 -->                        
                        <div class="form-row field-gender">
	                                    <label class="required" for="id_gender">성별:</label>
	                                    <div class="select-gender">
	                                    	<input type="radio" id="select" name="gender_M"  disabled><label for="select">남</label>
	                                    	<input type="radio" id="select2" name="gender_F" disabled><label for="select2">여</label>
	                                    </div>
	                    </div>

                       

                        <div class="form-row field-rank">


                            <div>


                                <label class="required" for="id_rank">회원등급:</label>

                                <input type="text" name="rank" value="1" class="vTextField" maxlength="255" required id="id_rank" disabled>



                            </div>

                        </div>
                        
                        
                        <div class="form-row last-access">


                            <div>


                                <label class="required" for="id_last_access">최종로그인일시</label>

                                <input type="text" name="last_access" value="2021-07-26" class="vTextField" maxlength="255" required id="id_phone_naumber" disabled>



                            </div>

                        </div>
                        
                        <div class="form-row start-date">


                            <div>


                                <label class="required" for="id_start_date">가입등록날짜</label>

                                <input type="text" name="start_date" value="2020-01-21" class="vTextField" maxlength="255" required id="id_phone_naumber" disabled>



                            </div>

                        </div>
                        

                        
                    </fieldset>









                    <div class="submit-row">

                        
                        <a class="btn btn-primary btn-block myform" href="memberList" style="color: white!important;">목록</a>


                        <p class="deletelink-box"><a href="#none" class="deletelink" style="height: auto;" onclick="memberObj.fn_delete()">삭제</a></p>




                    </div>


                </div>
            </form>
        </div>


        <br class="clear">
    </div>
    <!-- END Content -->
            
            
            
            
        </main>
    </div>

    <script>
    var memNum = '${memNum}'
    
    $(document).ready(function(){
    	memberObj.fn_getMemberInfo(memNum);
    });
    
    let memberObj = {
    	fn_getMemberInfo : function(memNum) {
    		var param = "memNum="+memNum;
			ajaxParamExecute(param, "/admin/member/getMemberInfo", "post", false, false, memberObj.fn_getMemberInfoRetrun);
		},
		fn_getMemberInfoRetrun : function(rst) {
// 			console.log(rst)
			$('#req_id').val(rst.resultInfo.userId);
			$('input[name=mem_num]').val(rst.resultInfo.memNum);
			$('input[name=name]').val(rst.resultInfo.nickName);
			$('input[name=email]').val(rst.resultInfo.email);
			$('input[name=rank]').val(rst.resultInfo.userType);
			$('input[name=last_access]').val(rst.resultInfo.lastLoginDt);
			$('input[name=start_date]').val(rst.resultInfo.regDtYmd);
			
			if (rst.resultInfo.gender == 'M') $('input[name=gender_M]').prop('checked', true);
			else $('input[name=gender_F]').prop('checked', true); 
		},
		fn_delete : function() {
		     if (confirm("삭제하시겠습니까?")) {
		            alert("삭제되었습니다.");
		            
		        	var param = "memNum="+memNum;
					ajaxParamExecute(param, "/admin/member/memberdelete", "post", false, false, memberObj.fn_deleteoRetrun);
		        }
		},
		fn_deleteoRetrun : function(rst) {
// 			console.log(rst);

			$('#member_form').attr('action','/admin/member/memberList');
			$('#member_form').submit();
		}
    }
    </script>