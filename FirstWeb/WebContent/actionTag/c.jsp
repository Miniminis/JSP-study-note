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
	<br>
	no parameter 값: <%= request.getParameter("NO") %>
	<br>
	username parameter 값: <%= request.getParameter("USERNAME") %>
</body>
</html>