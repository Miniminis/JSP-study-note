<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setAttribute("name01", "requestData");
	session.setAttribute("name02", "sessionData");
	application.setAttribute("name03", "applicationData");
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
	<h3>
		pageContext: ${pageContext.request.requestURI};<br>
		request 영역의 name01 : ${requestScope.name01}<br> 
								<%= request.getAttribute("name01") %><br>
								
		session 영역의 name02: ${sessionScope.name02}<br>
		application 영역의 name03 : ${applicationScope.name03}
	</h3>
</body>
</html>

