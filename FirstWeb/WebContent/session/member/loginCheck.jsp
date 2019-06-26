<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//세션에 저장되어있는 로그인 아이디를 받는다.
	//String id = (String)session.getAttribute("ID");
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("LOGININFO");
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
		if(loginInfo != null) { //id != null
			//out.print("<h3>"+id+"님은 로그인 상태입니다.<br></h3>");
			//out.print("<h3><a href=\"logout.jsp\">로그아웃</a></h3>");
			out.print(loginInfo.getId()+"님은 로그인 상태입니다!");
			out.print("nicname: "+loginInfo.getNicname());
			out.print("grade: "+loginInfo.getGrade());
			out.print("photo: "+loginInfo.getPhoto());
			out.print("phone number: "+loginInfo.getpNum());
		} else {
			out.print("<script>alert('로그인이 필요한 페이지입니다.');</script>");
			response.sendRedirect("loginForm.jsp");
		}
	%>
</body>
</html>