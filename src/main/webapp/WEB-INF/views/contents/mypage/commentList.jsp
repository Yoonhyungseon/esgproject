<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>



<body>
<!--  commentList-->
	<br>
	<br>
	<br>
	<section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-4">
                    <h2 class="heading-section">댓글관리</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center">Comment Table</h3>
                    <div class="table-wrap">
                        <table class="table myaccordion table-hover" id="accordion">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>게시글 제목</th>
                                    <th>게시글 작성자</th>
                                    <th>댓글 작성일</th>
                                    <th>원문링크</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <th scope="row">1</th>
                                    <td>매일유업 빨대 없애주세요</td>
                                    <td>esg지킴이</td>
                                    <td>2021-07-26</td>
                                    <td>http://localhost:8080/board/textboardView</td>
                                    <td>
                                        <i class="fa" aria-hidden="true"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseOne" class="collapse show acc" data-parent="#accordion">
                                        <p>정말 좋은 아이디어다고 생각합니다. 환경보호의 중요성이 커져가고 있는 시기인 만큼 기업이 지구를 지키기 위한 많은 노력이 필요하다고 생각합니다 적극 찬성 합니다!</p>
                                    </td>
                                </tr>
                                <tr data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsed">
                                    <th scope="row">2</th>
                                    <td>매일유업 빨대 없애주세요</td>
                                    <td>esg지킴이</td>
                                    <td>2021-07-26</td>
                                    <td>http://localhost:8080/board/textboardView</td>
                                    <td>
                                        <i class="fa" aria-hidden="false"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseTwo" class="collapse acc" data-parent="#accordion">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro iste, facere sunt sequi nostrum ipsa, amet doloremque magnam reiciendis tempore sapiente. Necessitatibus recusandae harum nam sit perferendis quia inventore natus.</p>
                                    </td>
                                </tr>
                                <tr data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="collapsed">
                                    <th scope="row">3</th>
                                    <td>매일유업 빨대 없애주세요</td>
                                    <td>esg지킴이</td>
                                    <td>2021-07-26</td>
                                    <td>http://localhost:8080/board/textboardView</td>
                                    <td>
                                        <i class="fa" aria-hidden="false"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseThree" class="collapse acc" data-parent="#accordion">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro iste, facere sunt sequi nostrum ipsa, amet doloremque magnam reiciendis tempore sapiente. Necessitatibus recusandae harum nam sit perferendis quia inventore natus.</p>
                                    </td>
                                </tr>
                                <tr data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" class="collapsed">
                                    <th scope="row">4</th>
                                    <td>매일유업 빨대 없애주세요</td>
                                    <td>esg지킴이</td>
                                    <td>2021-07-26</td>
                                    <td>http://localhost:8080/board/textboardView</td>
                                    <td>
                                        <i class="fa" aria-hidden="false"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" id="collapseFour" class="collapse acc" data-parent="#accordion">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro iste, facere sunt sequi nostrum ipsa, amet doloremque magnam reiciendis tempore sapiente. Necessitatibus recusandae harum nam sit perferendis quia inventore natus.</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>