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
		<div class="w3-container" style="width: 18%">
			<h2>글쓰기</h2>
		</div>
		<form action='/board/register.do' method="post" class="w3-container">

			<label>제목</label>
			<input class="w3-input w3-border w3-light-grey" style="width: 330px" name="title" id="title" value="${board.title}" autocomplete='off' placeholder="제목을 입력하세요.">

			<label>작성자</label>
			<input class="w3-input w3-border w3-light-grey" style="width: 330px" name="name" id="name" value="${board.name}" autocomplete='off' placeholder="이름을 입력하세요.">

			<label>내용</label>
			<textarea class="w3-input w3-border w3-light-grey" style="width: 330px" rows="5" cols="10" name="contents" id="contents" placeholder="내용을 입력하세요.">${board.contents}</textarea>
		</form>
		<div>
			<button type="button" onclick="location='/board/listAll'">뒤로가기</button>
			<button type="button" onclick="registerCheck()">등록</button>
		</div>
	</div>

	<script type="text/javascript">  		 
		 function registerCheck() {
			    if($.trim($('#title').val()) == '') {
			        alert("제목을 입력해주세요.");
			        return false;
			    }
			    if($.trim($('#contents').val()) == '') {
			        alert("내용을 입력해주세요.");
			        return false;
			    }			 
			    if(confirm("등록하시겠습니까?")){ 
			        alert("등록되었습니다.");
			        $("form").submit();     
			    }
			}
		</script>
</body>
</html>

