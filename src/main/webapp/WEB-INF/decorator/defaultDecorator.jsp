<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>테스트</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Script-Type" content="text/javascript" />
		<meta http-equiv="Content-Style-Type" content="text/css" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
		<meta name="description" content="" />
		<meta property="og:title" content="" />
		<meta property="og:url" content="" />
		<meta property="og:image" content="" />
		<meta property="og:description" content="" />
		<meta name="format-detection" content="telephone=no" />
		
		<link rel="canonical" href="">
		<link rel="shortcut icon" href="">
		
		<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
		
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<body>
		<!-- header -->
		<%@ include file="/WEB-INF/includes/header.jsp"%>
	
		<!-- body -->
		<sitemesh:write property='body' />
		
	
		<!-- footer  -->
		<%@ include file="/WEB-INF/includes/footer.jsp"%>
	</body>
</html>