<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//현재 session 객체를 소멸시킨다. false를 써야 현재의 session 정보를 가져온다. (default=true)
	request.getSession(false).invalidate();

	response.sendRedirect(request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>

</body>
</html>