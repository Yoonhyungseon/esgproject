<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<%@ include file="/WEB-INF/includes/admin/head.jsp" %>
	<body>
		<!-- header -->
		<%@ include file="/WEB-INF/includes/admin/header.jsp"%>
	
		<!-- body -->
		<sitemesh:write property='body' />
		
	
		<!-- footer  -->
		<%@ include file="/WEB-INF/includes/admin/footer.jsp"%>
	</body>
</html>