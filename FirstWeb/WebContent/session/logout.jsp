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
		//request.getSession(false).invalidate(); //현재 세션의 값을 false 로 불러와서 invalidate() 처리
		session.invalidate(); //세션의 종료
	%>
	
	<h2>로그아웃 되었습니다 ㅠㅠㅠㅠㅠ </h2>
	
	<a href="viewSession.jsp">viewSession in session folder</a><br>
	<a href="../response/viewSession.jsp">viewSession in response folder</a><br>
</body>
</html>