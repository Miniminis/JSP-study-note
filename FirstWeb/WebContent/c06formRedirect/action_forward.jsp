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
	action_forward.jsp 이곳에서는 응답페이지가 출력되지 않습니다.

	<%
	request.setAttribute("code", "code-0");
	request.setAttribute("name", request.getParameter("forward"));
	request.setAttribute("type", "forward-type");
%>

</body>
</html>
<jsp:forward page="indexResult.jsp"/>
