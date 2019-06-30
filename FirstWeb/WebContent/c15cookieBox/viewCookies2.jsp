<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//브라우저가 요청할때, 모든 쿠키 정보를 함께 서버로 전송한다. 
	//Cookie[] cookies = request.getCookies();
	CookieBox cBox = new CookieBox(request);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style></style>
</head>
<body>
	<h1>Cookie Data</h1>
	<h3>
		bakery: <%= cBox.getValue("bakery") %> <br>
		snack: <%= cBox.getValue("snack") %><br>
		place: <%= cBox.getValue("place") %><br>
	</h3>
	

	<a href="editCookie2.jsp">쿠키 edit2 결과 바로가기</a><br>
	<a href="deleteCookie2.jsp">쿠키 delete2 결과 바로가기</a>


</body>
</html>