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
	<%
		/* request는 값을 가져오지 못한다! */
		session = request.getSession(false);
	%>
	
	<h3></h3>
	name: <%= session.getAttribute("name") %><br>
	id: <%= session.getAttribute("id") %><br>
	isLogin: <%= session.getAttribute("isLogin") %><br>
	age: <%= session.getAttribute("age") %><br>
</body>
</html>