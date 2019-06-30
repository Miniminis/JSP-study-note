<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form action="login.jsp" method="post">
		<h1>로그인</h1>
		<hr>
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="pw"></p>
		<p><input type="submit" value="로그인하기"></p>
	</form>
	<a href="loginCheck.jsp">로그인 확인</a>
</body>
</html>