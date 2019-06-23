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

</body>
</html>
<%
	request.setAttribute("code", "code-1");
	request.setAttribute("name", request.getParameter("redirect"));
	request.setAttribute("type", "request-type");

	/* String name = request.getParameter("redirect");
	response.sendRedirect("indexResult.jsp?type=redirect-type"); */
%>
<jsp:forward page="indexResult.jsp"/>