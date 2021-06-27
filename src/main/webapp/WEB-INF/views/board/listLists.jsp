<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">

<th:block>
	<head>	
	</head>
	<title>This page is a List Page</title>
</th:block>

<th:block>
	<div class="w3-container">
		<h2>게시판</h2>
		<table>
			<tr>
				<th>
					<form id="writeForm">
						<!-- <a href="/board/index">[뒤로가기]</a>
							<button type="button" onclick="location='/board/index'">뒤로가기</button> -->
						<button type="button" onclick="fn_list()">뒤로가기</button>
						<button type="button" onclick="location='/board/write.do'">글쓰기</button>
						&emsp;						
					</form>
				</th>
				<th align = "right">
					<form id="searchForm" method="post">
						<select name="serchOption">
							<option value="title" selected="selected">제목</option>
							<option value="name">작성자</option>
						</select> 
						<input style="" name="name" id="searchKeyWord" placeholder="검색어를 입력하세요" />
						<button type="button" onclick="fn_searchOption()">검색</button>
					</form>
				</th>
			</tr>
		</table>

		<table class="w3-table-all w3-hoverable" style="width: 50%">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listAll}" var="boardVO" varStatus="i">
					<tr>
						<td>${boardVO.ssn}</td>
						<td><a href="/board/view.do?ssn=${boardVO.ssn}" style="text-decoration:none; color: black">${boardVO.title}</a></td>
						<td>${boardVO.name}</td>
						<td>${boardVO.view_count}</td>
						<td>${boardVO.insert_time}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</th:block>

<script>
			//goSearch == 1 인 경우 검색을 한 경우 -> 뒤로가기는 게시물 리스트로, 0인 경우는 검색을 안한경우 뒤로가기는 index로
		function fn_list(){
				var form = document.getElementById("writeForm");
			    if(${goSearch} == 1){
			    	form.action = "<c:url value='/board/listAll'/>";		    
			    }else{				   				    
				    form.action = "<c:url value='/board/index'/>";			    
				 }
				form.submit();
			}	
		function fn_searchOption(){
				if($.trim($('#searchKeyWord').val()) == '') {			
		      	 alert("검색어를 입력해주세요.");
		       	 return false;
				}
				var form = document.getElementById("searchForm");
				
				if ($("select[name=serchOption]").val() == "name"){
					form.action = "<c:url value='/board/searchName'/>";		    
				}
				else if ($("select[name=serchOption]").val() == "title"){
					form.action = "<c:url value='/board/searchTitle'/>";		    
				}
				form.submit();
			}
	</script>

</html>


<%-- <td><a href="<c:url value="board/view.do"/>">${boardVO.title}</a></td> --%>


