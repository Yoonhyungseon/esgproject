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



                        <div class="form-row field-id_m">


                            <div>


                                <label class="required" for="id_id_m">Id:</label>

                                <input type="text" name="id_m" value="이범기" class="vTextField" maxlength="255" required id="id_id_m">



                            </div>

                        </div>

                        <div class="form-row field-password">


                            <div>


                                <label class="required" for="id_password">Password:</label>

                                <input type="text" name="password" value="1234" class="vTextField" maxlength="255" required id="id_password">



                            </div>

                        </div>

                        <div class="form-row field-name">


                            <div>


                                <label class="required" for="id_name">Name:</label>

                                <input type="text" name="name" value="이범기" class="vTextField" maxlength="255" required id="id_name">



                            </div>

                        </div>

                        <div class="form-row field-nickname">


                            <div>


                                <label class="required" for="id_nickname">Nickname:</label>

                                <input type="text" name="nickname" value="뺌기" class="vTextField" maxlength="255" required id="id_nickname">



                            </div>

                        </div>

                        <div class="form-row field-age">


                            <div>


                                <label class="required" for="id_age">Age:</label>

                                <input type="number" name="age" value="25" class="vIntegerField" required id="id_age">



                            </div>

                        </div>

                        <div class="form-row field-gender">


                            <div>


                                <label class="required" for="id_gender">Gender:</label>

                                <input type="text" name="gender" value="남" class="vTextField" maxlength="255" required id="id_gender">



                            </div>

                        </div>

                        <div class="form-row field-email">


                            <div>


                                <label class="required" for="id_email">Email:</label>

                                <input type="text" name="email" value="jeongiun@naver.com" class="vTextField" maxlength="255" required id="id_email">



                            </div>

                        </div>

                        <div class="form-row field-phone_naumber">


                            <div>


                                <label class="required" for="id_phone_naumber">Phone number:</label>

                                <input type="text" name="phone_naumber" value="01048705633" class="vTextField" maxlength="255" required id="id_phone_naumber">



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