<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!--header-->
 <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">		
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin/index">ESG: 관리자</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                </div>
            </div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">관리자</div>
                            <a class="nav-link" href="/admin/index">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                모아보기
                            </a>
                            <div class="sb-sidenav-menu-heading">메뉴</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                게시판 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/admin/textboard/textboardList">뿜업 게시판</a>
                                    <a class="nav-link" href="/admin/textboard/noticeList">공지사항</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="/admin/newsList">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                ESG 뉴스
                            </a>
                             <a class="nav-link" href="/admin/companies/companiesList">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                소비자 지수
                            </a>
                            <div class="sb-sidenav-menu-heading">회원</div>
                            <a class="nav-link" href="/admin/member/memberList">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원 관리
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
<!--header-->
