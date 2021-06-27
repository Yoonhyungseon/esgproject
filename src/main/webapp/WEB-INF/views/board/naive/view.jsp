<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
</head>

<body>
	<div>
		<form id="writeForm">
			<div>
				<h2>상세보기</h2>
				<div>
					<table>
						<tr>
							<th>제목:</th>
							<td><p>${board.title}</p></td>
						</tr>
						<tr>
							<th>작성자:</th>
							<td><p>${board.name}</p></td>
						</tr>
						<tr>
							<th>내용:</th>
							<td><p>${board.contents}</p></td>
						</tr>

					</table>
			<div>
						<button type="button" onclick="location='/board/listAll'">목록</button>
						<button type="button" onclick="location='/board/write.do?ssn=${board.ssn}'">수정</button>
						<button type="button" onClick="location='/board/delete.do?ssn=${board.ssn}'">삭제</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
