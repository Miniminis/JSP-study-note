<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %> <!-- 페이지 소스보기에서 jsp 코드로 실행되는 page 부분의 공백을 없에주는 역할  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	img {
 		width: 200px;
		height: 200px;
	}
</style>
</head>
<body>

	<%
		Calendar cal = Calendar.getInstance();
		//java.util.Calendar cal = java.util.Calendar.getInstance();
	%>
	<h1>회원 리스트</h1>
	<a href=" memberReg.jsp">회원가입</a>
	<br>
	<!-- 상대경로로 표현  -->
	<img alt="이미지" src="/web/image/zootopia_2.jpg">

	<h1><%= cal.get(Calendar.YEAR) %> 년</h1>
	<h1><%= cal.get(Calendar.MONTH)+1 %> 월</h1>
	<h1><%= cal.get(Calendar.DATE) %> 일</h1>
	
	<h1><%= Calendar.DATE %></h1>
	
	<a href="file.jsp">파일 </a>
	
	
</body>
</html>