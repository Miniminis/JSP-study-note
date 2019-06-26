<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//쿠키 등록 방법(쿠키를 굽는다!)
	//1. 쿠키 클래스의 객체를 생성: new Cookie(쿠키이름, 값) 
	//2. 생성된 객체를 response 객체에 추가: response.addCookie(쿠키객체의 참조변수); 
	//3. 불러올때는 request.getCookies(); 배열 형태로 불러옴
	Cookie ck = new Cookie("firstCk", "zootopia");
	response.addCookie(ck);
	//브라우저의 network >> response headers 에서 Set-Cookie: firstCk=zootopia로 표시됨! 
	//request headers에도 Cookie: firstCk=zootopia; JSESSIONID=CFD72B1B268A5ACF8F8B255BA8B22AC4 표시됨! 

	Cookie ck2 = new Cookie("title", "주토피아"); //한글 값은 인코딩 필요..?
	response.addCookie(ck2);
	
	Cookie ck3 = new Cookie("id", "aqua");
	ck3.setMaxAge(60); //60초 = 1분 후 
	response.addCookie(ck3);
	
	Cookie ck4 = new Cookie("username", "red");
	ck4.setMaxAge(60*60); //60초*60분 = 1시간 
	response.addCookie(ck4);
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
	<h1>쿠키 생성이 완료되었습니다.</h1>

	<h1>
		ck cookie:<br>
		<%=ck.getName()%>
		<br>
		<%=ck.getValue()%></h1>
	<br>
	<h2>
		ck2 cookie:<br>
		<%=ck2.getName()%>
		<br>
		<%=ck2.getValue()%></h2>
	<br>
	<h2>
		ck3 cookie:<br>
		<%=ck3.getName()%>
		<br>
		<%=ck3.getValue()%></h2>
	<br>
	<h2>
		ck4 cookie:<br>
		<%=ck4.getName()%>
		<br>
		<%=ck4.getValue()%></h2>
	<br>

	<a href="viewCookies.jsp">쿠키 request 결과 바로가기</a>
</body>
</html>