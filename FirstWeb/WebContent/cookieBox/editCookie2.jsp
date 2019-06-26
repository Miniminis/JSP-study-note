<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//쿠키의 이름이 title인 쿠키 데이터를 변경하고자 함! 
	//기존 이름과 같은 이름의 쿠키 객체를 생성
	//새로운 response 객체의 데이터로 등록! 
	//결국 새로 등록하는 과정 == 수정의 과정; 
	//다만, 같은 이름으로 신규등록을 하면 --> 수정의 처리!
	Cookie newck = CookieBox.createCookie("bakery", "delicious");
	//Cookie newck = new Cookie("firstCk", "toyStory4"); //value는 공백 설정이 불가하다
	response.addCookie(newck);
	
	Cookie newck2 = CookieBox.createCookie("snack", "good");
	//Cookie newck2 = new Cookie("title", "토이스토리4");
	response.addCookie(newck2);
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
	<h1>쿠키2 정보가 변경되었습니다.</h1>
	<a href="viewCookies2.jsp">쿠키 request2 결과 바로가기</a>

</body>
</html>