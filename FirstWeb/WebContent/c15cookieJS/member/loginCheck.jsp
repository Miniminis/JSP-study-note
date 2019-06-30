<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//쿠키 박스에 이미 저장된 사용자의 정보를 확인하기 위해서 쿠키박스의 객체 생성
	//쿠키박스 객체의 참조변수를 통해서 쉽게 참조 가능! 
	CookieBox cBox = new CookieBox(request);

	boolean loginChk = cBox.exists("LOGIN") && cBox.getValue("LOGIN").equals("SUCCESS");
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
	<h1>로그인 여부 확인</h1>
	<h3>
	<%
		if(loginChk) {
			out.println("아이디는 "+cBox.getValue("ID")+"로 로그인 되어있는 상태입니다.<br> ");
			out.println("<a href=\"logout.jsp\">로그아웃</a><br>");
			out.println("<a href=\"loginForm.jsp\">로그인 페이지로 돌아가기</a><br>");
		} else {
			out.println("로그인 되어있는 상태가 아닙니다. ");
		}
	%>
	</h3>
</body>
</html>