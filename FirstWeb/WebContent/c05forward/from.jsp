<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page buffer="none"%> 
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
		for (int i = 0; i < 1000000; i++) {
	%>
	<h3>from.jsp: from.jsp에서 실행된 결과페이지 입니다!</h3>
	<%
		}
	%>

	<jsp:forward page="to.jsp" />
	<!--from.jsp url은 유지된 상태로 to.jsp 페이지로 이동하게 된다.  -->
</body>
</html>