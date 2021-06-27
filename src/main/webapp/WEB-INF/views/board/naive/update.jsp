<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>

<head>
</head>

<body>
	<div>
		<form action="/board/register.do" id="writeForm" method="post">
			<div>
				<h2>글쓰기</h2>
				<div>
					<table>
						<tr>
							<td><input type="hidden" name="ssn" value="${board.ssn}" /></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><textarea style="width: 330px" rows="1" name="title">${board.title}</textarea></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><textarea style="width: 330px" rows="1" name="name">${board.name}</textarea></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea style="width: 330px" rows="5" cols="10" name="contents">${board.contents}</textarea></td>
						</tr>
					</table>					
					<div>
						<button type="button" onclick="location='/board/view.do?ssn=${board.ssn}'">뒤로가기</button>
						<button type="submit">등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>

</html>

