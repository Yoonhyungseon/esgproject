<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body class="sb-nav-fixed">
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

                                <input type="number" name="mem_num" value="1" class="vIntegerField" maxlength="255" required id="id_id_m">



                            </div>

                        </div>
						


                        <div class="form-row field-id_m">


                            <div>


                                <label class="required" for="id_id_m">아이디:</label>

                                <input type="text" name="id_m" value="jeongiun" class="vTextField" maxlength="255" required id="id_id_m">



                            </div>

                        </div>

                        <div class="form-row field-password">


                            <div>


                                <label class="required" for="id_password">비밀번호:</label>

                                <input type="text" name="password" value="abcd1234" class="vTextField" maxlength="255" required id="id_password">



                            </div>

                        </div>

                        <div class="form-row field-name">


                            <div>


                                <label class="required" for="id_name">이름:</label>

                                <input type="text" name="name" value="이범기" class="vTextField" maxlength="255" required id="id_name">



                            </div>

                        </div>

 						<div class="form-row field-email">


                            <div>


                                <label class="required" for="id_email">이메일:</label>

                                <input type="text" name="email" value="jeongiun@naver.com" class="vTextField" maxlength="255" required id="id_email">



                            </div>

                        </div>

                        <div class="form-row field-question">


                            <div>


                                <label class="required" for="id_question">질문:</label>

                                <input type="text" name="question" value="나의 고향은" class="vTextField" maxlength="255" required id="id_nickname">



                            </div>

                        </div>

                        <div class="form-row field-state">


                            <div>


                                <label class="required" for="id_state">상태:</label>

                                <input type="text" name="state" value="접속" class="vTextField" required id="id_state">



                            </div>

                        </div>

                        <div class="form-row field-gender">


                            <div>


                                <label class="required" for="id_gender">성별:</label>

                                <input type="text" name="gender" value="남" class="vTextField" maxlength="255" required id="id_gender">



                            </div>

                        </div>

                       

                        <div class="form-row field-rank">


                            <div>


                                <label class="required" for="id_rank">회원등급:</label>

                                <input type="text" name="rank" value="1" class="vTextField" maxlength="255" required id="id_phone_naumber">



                            </div>

                        </div>
                        
                        
                        <div class="form-row last-access">


                            <div>


                                <label class="required" for="id_last_access">최종로그인일시</label>

                                <input type="text" name="last_access" value="2021-07-26" class="vTextField" maxlength="255" required id="id_phone_naumber">



                            </div>

                        </div>
                        
                        <div class="form-row start-date">


                            <div>


                                <label class="required" for="id_start_date">가입등록날짜</label>

                                <input type="text" name="start_date" value="2020-01-21" class="vTextField" maxlength="255" required id="id_phone_naumber">



                            </div>

                        </div>
                        

                        
                    </fieldset>









                    <div class="submit-row">

                        <input type="submit" value="Save" class="default" name="_save">


                        <p class="deletelink-box"><a href="/admin/accounts/member/4/delete/" class="deletelink">Delete</a></p>


                        <input type="submit" value="Save and add another" name="_addanother">
                        <input type="submit" value="Save and continue editing" name="_continue">


                    </div>



                    <script id="" src="/static/admin/js/change_form.js" async>
                    </script>




                    <script id="" src="/static/admin/js/prepopulate_init.js" data-prepopulated-fields="[]">
                    </script>


                </div>
            </form>
        </div>


        <br class="clear">
    </div>
    <!-- END Content -->
            
            
            
            
        </main>
    </div>
</body>

</html>