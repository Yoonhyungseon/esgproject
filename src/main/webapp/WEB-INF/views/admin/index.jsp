<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <body class="sb-nav-fixed">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">모아보기</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">ESG: 관리자</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">새로운 뿜업 : 0개</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/admin/textboard/textboardList">뿜업 게시판</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">새로운 크롤링 : 0개</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/admin/newsList">ESG 뉴스</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">공지글 : 0개</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/admin/textboard/noticeWrite">공지사항</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">새로운 회원 : 0명</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/admin/member/memberList">회원 관리</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                뿜업 모아보기
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
                                            <td>홈플러스 계산원에게 의자를 주세요</td>
                                            <td>윤형선</td>
                                            <td>61</td>
                                            <td>2021/07/24</td>
                                            <td>320,800원</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>포카칩의 과대포장에 대해서..</td>
                                            <td>외붕이</td>
                                            <td>43</td>
                                            <td>2021/07/16</td>
                                            <td>120,300원</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>폐건전지 재생사업을 제안합니다.</td>
                                            <td>홍길동</td>
                                            <td>93</td>
                                            <td>2021/06/09</td>
                                            <td>920,800원</td>
                                        </tr>    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
    </body>
</html>
