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

	indexResult.jsp 이곳에서 응답 처리가 진행됩니다.
	<h1>
		type: <%=request.getParameter("type")%><br>
		name: <%=request.getParameter("name")%><br>
		code: <%= request.getAttribute("code") %><br>
		type(getAttribute): <%= request.getAttribute("type") %><br>
		name(getAttribute): <%= request.getAttribute("name") %><br>
	</h1>
</body>
</html>