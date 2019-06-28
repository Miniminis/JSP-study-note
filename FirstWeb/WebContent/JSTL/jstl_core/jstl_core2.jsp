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
	
	<c:set value="test" var="msg"/>
	msg set result: ${msg} <br>
	<c:remove var="msg"/>
	msg remove result: ${msg} <br>
	
	<c:set value="test" var="msg"/>
	<c:if test="${msg eq 'test'}">
		msg 의 문자열은 test와 같습니다.
	</c:if>
	<!-- if 문의 결과가 true 이면 메시지 표시, false 이면 표시안됨 -->
	
	<c:if test="${msg eq 'test'}" var="condition"/> <br>
	결과값은: ${condition}
	
</body>
</html>