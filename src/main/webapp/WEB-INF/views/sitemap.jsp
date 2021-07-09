<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/includes/head.jsp" %>

<!DOCTYPE html>
	
<html lang="ko">
		<!-- body -->
		
	<!-- wrap -->
	<div id="wrap" class="guide-wrap">
		<div class="guide-head">
			<h1 class="title">ESG<span>(파일명 항목 링크 새창 열기)</span></h1>
			<span class="state">
			</span>
		</div>
		<!-- table -->
		<div class="table">
			<table>
				<caption>워크 리스트</caption>
				<colgroup>
					<col style="width: 50px;">
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col style="width: 100px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">1Depth</th>
						<th scope="col">2Depth</th>
						<th scope="col">3Depth</th>
						<th scope="col">파일명</th>
						<th scope="col">상태</th>
						<th scope="col">개발</th>
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">메인페이지</td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/index" title="새창" target="_blank">/index</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">기업 소개</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/index" title="새창" target="_blank"></a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">ESG란?</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/index" title="새창" target="_blank"></a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">회원관리</td>
						<td data-title="2Depth" class="align-C">로그인</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/member/login" title="새창" target="_blank">/member/login</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">회원가입</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/member/join" title="새창" target="_blank">/member/join</a>
						</td>
                        <td data-title="상태" class="align-C">X</td>
                        <td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">아이디 찾기</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/member/findId" title="새창" target="_blank">/member/findId</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">아이디 찾기(멘트)</td>
						<td data-title="파일명">
							<a href="/member/findIdMention" title="새창" target="_blank">/member/findIdMention</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">비밀번호 찾기</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/member/findPassword" title="새창" target="_blank">/member/findPassword</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr> 
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">비밀번호 찾기(멘트)</td>
						<td data-title="파일명">
							<a href="/member/findPasswordMention" title="새창" target="_blank">/member/findPasswordMention</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr> 
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">회원탈퇴</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/member/withdrawal" title="새창" target="_blank">/member/withdrawal</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr> 
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">회원탈퇴(멘트)</td>
						<td data-title="파일명">
							<a href="/member/withdrawalCompleted" title="새창" target="_blank">/member/withdrawalCompleted</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr> 
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">뿜업 게시판(가명)</td>
						<td data-title="2Depth" class="align-C">게시판 리스트</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/board/textboardList" title="새창" target="_blank">/board/textboardList</a>
						</td>
                        <td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">게시판 상세</td>
						<td data-title="파일명">
							<a href="/board/textboardView" title="새창" target="_blank">/board/textboardView</a>
						</td>
                        <td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">게시글 작성</td>
						<td data-title="파일명">
							<a href="/board/textboardWrite" title="새창" target="_blank">/board/textboardWrite</a>
						</td>
                        <td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">공지사항</td>
						<td data-title="2Depth" class="align-C">공지사항 리스트</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/board/noticeList" target="_blank">/board/noticeList</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">공지사항 상세</td>
						<td data-title="파일명">
							<a href="/board/noticeView" target="_blank">/board/noticeView</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">ESG 뉴스</td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/news/newsList" target="_blank">/news/newsList</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">소비자 지수</td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/indices/indices" target="_blank">/indices/indices</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">마이페이지</td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/mypage/mypage" target="_blank">/mypage/mypage</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">개인정보 수정</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/mypage/modifyinfo" target="_blank">/mypage/modifyinfo</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">글/댓글 작성내역</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/mypage/commentList" target="_blank">/mypage/commentList</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">스크랩 내역</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/mypage/scrap" target="_blank">/mypage/scrap</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">지갑</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/mypage/wallet" target="_blank">/mypage/wallet</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">포인트 사용내역</td>
						<td data-title="파일명">
							<a href="/mypage/usage" target="_blank">/mypage/usage</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr style="background-color: black;">
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C" style="color: white;">관리자 페이지</td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="" target="_blank"></a>
						</td>
						<td data-title="상태" class="align-C"></td>
						<td data-title="개발" class="align-C"></td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">로그인</td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/admin/login" target="_blank">/admin/login</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">관리자 인덱스</td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/admin/index" target="_blank">/admin/index</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>					
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">게시판 관리</td>
						<td data-title="2Depth" class="align-C">뿜업 게시판 리스트</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/admin/textboard/textboardList" target="_blank">/admin/textboard/textboardList</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">게시판 상세</td>
						<td data-title="파일명">
							<a href="/admin/textboard/textboardView" target="_blank">/admin/textboard/textboardView</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">게시판 답변(피드백)</td>
						<td data-title="파일명">
							<a href="/admin/textboard/textboardWrite" target="_blank">/admin/textboard/textboardWrite</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">공지사항 리스트</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/admin/textboard/noticeList" target="_blank">/admin/textboard/noticeList</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">공지사항 상세</td>
						<td data-title="파일명">
							<a href="/admin/textboard/noticeView" target="_blank">/admin/textboard/noticeView</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">공지사항 작성</td>
						<td data-title="파일명">
							<a href="/admin/textboard/noticeWrite" target="_blank">/admin/textboard/noticeWrite</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C">ESG 뉴스 리스트</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/admin/newsList" target="_blank">/admin/newsList</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">뉴스 상세</td>
						<td data-title="파일명">
							<a href="/admin/newsView" target="_blank">/admin/newsView</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">회원 관리</td>
						<td data-title="2Depth" class="align-C">회원 리스트</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/admin/member/memberList" target="_blank">/admin/member/memberList</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">회원 상세</td>
						<td data-title="파일명">
							<a href="/admin/member/memberView" target="_blank">/admin/member/memberView</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C">기업 관리</td>
						<td data-title="2Depth" class="align-C">지수 지표</td>
						<td data-title="3Depth" class="align-C"></td>
						<td data-title="파일명">
							<a href="/admin/companies/companiesList" target="_blank">/admin/companies/companiesList</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">지수 상세</td>
						<td data-title="파일명">
							<a href="/admin/companies/companiesView" target="_blank">/admin/companies/companiesView</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					<tr>
						<td data-title="No" class="align-C"></td>
						<td data-title="1Depth" class="align-C"></td>
						<td data-title="2Depth" class="align-C"></td>
						<td data-title="3Depth" class="align-C">지수 작성</td>
						<td data-title="파일명">
							<a href="/admin/companies/companiesWrite" target="_blank">/admin/companies/companiesWrite</a>
						</td>
						<td data-title="상태" class="align-C">X</td>
						<td data-title="개발" class="align-C">X</td>
						<td data-title="비고"></td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<!-- //table -->
	</div>
	<!-- //wrap -->
	<script>
		$(function(){
			$('#site-header').hide();
			$('.border-sec').hide();
			$('.w3l-footer-16').hide();
			
			$('table > tbody  > tr').each(function(index, tr) {
				console.log("index"+index)
				console.log("tr"+tr)
			   $(this).find('td:first-child').text(index + 1);
			});
		});
	</script>


</body>
</html>

