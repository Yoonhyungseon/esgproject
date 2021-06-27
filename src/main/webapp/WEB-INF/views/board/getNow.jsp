<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Test DB Page</title>
</head>
<body>
	<SPAN>DB Test</SPAN>
	<div>method from getNow</div>
	<h1>DB연동 : <a style="color: brown">[${DBtest}]</a></h1> 
	<!-- 	<a href="/board/index">[뒤로가기]</a> -->
	<button type="button" onclick="location='/board/index'">뒤로가기</button> 
	<button type="button" onclick="location='/board/test/show'">불러오기</button> 

</body>

</html>
