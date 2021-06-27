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
							<th>제목</th>
							<td><textarea style="width: 330px" rows="1" name="title" placeholder="제목을 입력하세요.">${board.title}</textarea></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><textarea style="width: 330px" rows="1" name="name" placeholder="이름을 입력하세요.">${board.name}</textarea></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea style="width: 330px" rows="5" cols="10" name="contents" placeholder="내용을 입력하세요.">${board.contents}</textarea></td>
						</tr>

					</table>
					<div>
						<button type="button" onclick="location='/board/listAll'">뒤로가기</button>
						<button type="submit">등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">  
		 if(${requiredempty} == 1)
			alert ("제목과 내용을 입력해주세요.");   
		</script>
</body>

</html>

