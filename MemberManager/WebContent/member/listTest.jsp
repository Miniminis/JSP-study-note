<%@page import="member.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Enumeration<String> e = application.getAttributeNames();
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
	<%
		while(e.hasMoreElements()) {
			String name = e.nextElement();
			
			//name값을 이용해서 object 객체 불러옴 
			Object memObj = application.getAttribute(name);
			
			//불러들인 object 객체를 MemberInfo 타입으로 형변환
			if(memObj instanceof MemberInfo) {
				out.println(name+":"+memObj+"<br>");
			}
		}
	%>

</body>
</html>