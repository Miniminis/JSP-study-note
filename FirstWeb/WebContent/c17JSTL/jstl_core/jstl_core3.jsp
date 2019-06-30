<%@page import="web.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<!-- url 태그를 이용해서 uri_mist 변수를 생성
		- 이 변수에 url 경로를 대입 
		- param 태그를 이용해서 page 번호를 출력  -->
		
	<c:url value="/member/list.jsp" var="uri_mlist">
		<c:param name="pno">5</c:param>
	</c:url>
	
	<h4>단순출력 : ${uri_mlist }</h4>
	<h4>링크연동 1 : <a href="${uri_mlist }">회원리스트</a></h4>
	<h4>링크연동 1 : <a href='<c:url value="/member/list.jsp"/>'>회원리스트</a></h4>
</body>
</html>
