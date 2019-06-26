<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	//setMaxAge(시간정보: 초단위): 60(초)*60(분)*24(시간)*365(일) = 1년 
	Cookie delCk = new Cookie("firstCk", "");
	delCk.setMaxAge(0); //유효시간을 0으로 설정 --> 쿠키의 삭제 
	response.addCookie(delCk);
	
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
	<h1>쿠키 정보가 삭제되었습니다.</h1>	
	<a href="viewCookies.jsp">쿠키 request 결과 바로가기</a>
</body>
</html>