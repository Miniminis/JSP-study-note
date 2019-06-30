<%@page import="web.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	request.setAttribute("member", new Member("플래시", "flash", "010-1234-5678"));	
	/* Member Class 객체 생성  */
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
		member 객체 참조1 - id: ${requestScope.member.id }<br>
		<!-- requestScope: map 
			.member: key 
			.id == public String getId(){} != private String id 
			id 는 private 타입으로 직접 참조가 불가-> getID() 매서드를 호출한다는 의미가 됨 -->
		member 객체 참조2 - name: ${requestScope.member.name }<br>
		member 객체 참조3 - phone number: ${requestScope.member.pnum}<br>
		<%-- member 객체 참조4 - getPnum(): ${requestScope.member.getPnum}<br> --%>
	</h3>
	<hr>
	<h3>
		member 객체 참조1 - id: ${member.id }<br>
		member 객체 참조2 - name: ${member.name }<br>
		member 객체 참조3 - phone number: ${member.pnum}<br>
		<%-- member 객체 참조4 - getPnum(): ${member.getPnum}<br> --%>
	</h3>
</body>
</html>

