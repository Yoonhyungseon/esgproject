<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>View Test DB Page</title>
</head>

<body>
	<div>
		<!-- 	<a href="/board/test">[뒤로가기]</a> -->
		<button type="button" onclick="location='/board/test'">뒤로가기</button>
		<input type="button" id="ajaxBtn" value="Send Ajax request" />
		<button type="button" onclick="location='/board/deleteBD'">삭제</button>
		<div id="status" style="display: inline-block">&nbsp; status : &nbsp;</div>
	</div>
<!-- ajax -->
	<div>	
		<table class="w3-table-all w3-small">
			<thead>
				<tr>
					<th>No.</th>
					<th>SSN</th>
					<th>NAME</th>
					<th>TITLE</th>
					<th>CONTENTS</th>
					<th>INSERT TIME</th>
					<th>VIEW_COUNT</th>
					<th><a style="color: brown">DELETE_YN</a></th>
				</tr>
			</thead>
			<tbody id="data">
			</tbody>
		</table>
		<div id="rara"></div>
	</div>
<!-- end -->
	<%-- 
	<table class="w3-table-all w3-small">
		<thead>
			<tr>
				<th>No.</th>
				<th>SSN</th>
				<th>NAME</th>
				<th>TITLE</th>
				<th>CONTENTS</th>
				<th>INSERT TIME</th>
				<th>VIEW_COUNT</th>
				<th><a style="color: brown">DELETE_YN</a></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lists}" var="boardVO" varStatus="i">
				<tr>
					<td>${i.count}번</td>
					<td>${boardVO.ssn}</td>
					<td>${boardVO.name}</td>
					<td>${boardVO.title}</td>
					<td>${boardVO.contents}</td>
					<td>${boardVO.insert_time}</td>
					<td>${boardVO.view_count}</td>
					<td><a style="color: brown">${boardVO.delete_yn}</a></td>
				</tr>
			</c:forEach>
						
			<tr th:each="boardVO : ${lists}">
				<td th:text="${boardVO.ssn}">No.</td>
				<td><a th:href="@{/board/listLists(ssn=${boardVO.name})}" th:text="${boardVO.title}">TITLE</a></td>
				<td th:text="${boardVO.name}">name</td>
				<td th:text="${#dates.format(boardVO.insert_time, 'yyyy-MM-dd HH:mm')}">DATE</td>
			</tr>
			
		</tbody>
	</table>
	 --%>

<script>
/* 
	var name = "view로부터 불러온 데이터";
	var list = new Array();
	function ajax(){
	  $.ajax({
		async : true, 
	    url: "/ajaxTest2",
	    data: "name=" + name,
	    type: "POST",
	    success : function(data){
	    	for(const i of data){
	    		list.push(i.ssn+" ", i.name+" ", i.title+" ", i.contents+" ", i.insert_time+" ", i.view_count+" ", i.delete_yn+" ", "<br/>", "\n");
	    	}
	    	alert("완료");	
	    	$("#resultDIV").html(list);
	//     	$("#resultDIV").append(list);
	//     	document.write(list)
	    },
	    error : function(){
	      alert("에러")		
	    }
	  });
	}

	 */
	$(document).ready(function() {

		$('#ajaxBtn').click(function() {
			$.ajax('/ajaxTest', // request url
			{
				dataType : 'json', // type of response data
				timeout : 500, // timeout milliseconds
				success : function(data, status, xhr) { // success callback function
					console.log(xhr)
					console.log(data)				
					
					$("#status").append("<a style='color: red'>"+status);
					$.each(data, function(index, item){
						console.log(index)
						console.log(item)
						$('#data').append("<tr><td>" + (index+1) + "번</td><td>" + item.ssn + "</td><td>" + item.name + "</td><td>" 
													 + item.title + "</td><td>"  + item.contents + "</td><td>" + item.insert_time + "</td><td>" 
													 + item.view_count + "</td><td><a style='color: brown'>" + item.delete_yn + "</a></td></tr>");
				})
				  $("#ajaxBtn").attr("disabled", "disabled");
					
// 					$("#status").append(status+" ");
// 					$("#name").append(data[0].name);
// 					$("#name").val(data[0].name);

// 					for(const u of data){
// 						$("#ssn").html(u.ssn);
// 						$("#title").html(u.title);
// 						$("#name").html(u.name);
// 						$("#contents").html(u.contents);
// 					}

// 					for(const i=0; i<=data.length; i++){
// 						$("#ssn").append(data[i].ssn);
// 						$("#title").append(data[i].title);
// 						$("#name").append(data[i].name);
// 						$("#contents").append(data[i].contents);					
// 					}
				}
			});
		});

	});
</script>

</body>
</html>
