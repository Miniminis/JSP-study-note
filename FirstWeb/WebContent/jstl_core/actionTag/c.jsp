<%@page import="web.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<h1>C page 입니다.</h1>
	<%-- <jsp:forward page="b.jsp"></jsp:forward> --%>
	<!--@ forward 액션 태그를 만나는 순간 A page의 모든 내용을 무시하고 
	- forward로 연결된 페이지를 로드해준다.
	- 요청은 A, 응답은 B! 
	- 단, URL 은 그대로 A page @-->
	
	pageType : ${pageType} <br>
	pNo : ${pNo} <br>
	username : ${username} <br>
	
</body>
</html>