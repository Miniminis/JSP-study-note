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
		String path = "/image/zootopia_1.jpg";
	%>

	<h5>
		자원의 실제경로:
		<%=application.getRealPath(path)%>
		<!--이미지가 배포되는 실제 경로를 표시해줌   -->
	</h5>
</body>
</html>