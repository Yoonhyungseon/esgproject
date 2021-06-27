<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 줄바꿈 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("replaceChar","\n"); %>

<html>
<head>
</head>

<body>
	<div>
		<form action="/board/listAll">
			<div class="w3-container" style="width: 18%">
				<h2>상세보기</h2>
			</div>
			<table class="w3-table w3-bordered" style="width: 18%">
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
					<td><p>${fn:replace(board.contents, replaceChar, "<br/>")}</p></td>
				</tr>
			</table>
			
		</form>
		<div>
			<input type="hidden" name="ssn" id="ssn" value="${board.ssn}"/>
		</div>
		<div>
			<button type="button" onclick="location='/board/listAll'">목록</button>
			<button type="button" onclick="location='/board/write.do?ssn=${board.ssn}'">수정</button>
			<button type="button" onClick="DeleteCheck()">삭제</button>	
		</div>					
	</div>
	
<script>	
var ssn = $("#ssn").val();

function DeleteCheck() {    
	 if(confirm("삭제하시겠습니까?")){ 
            $.ajax({
                async : true, 
                type : "POST", 
                data: "ssn=" + ssn,
                url: "/delete.do",     
                success: function(isDeleted) {    
                    if(isDeleted == true) {
                        alert("삭제되었습니다.");    
                        $("form").submit();   
                    } else {
                        alert("없는 게시물이거나, 이미 삭제된 게시물입니다.(isDeleted false)");
                        $("form").submit(); 	         
                    }            
                },
                error: function(error) {
                	alert("삭제에 실패하였습니다. 관리자에게 문의하세요.(function error)");
                	$("form").submit(); 
                }        
            });
    }
}
</script>

</body>
</html>
