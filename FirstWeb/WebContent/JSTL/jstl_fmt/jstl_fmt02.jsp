<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<h1>fmt 태그의 사용 - Date</h1>
	<h3>		
		<!-- Date() 객체를 생성한 뒤, now 변수 안에 대입   -->
		<c:set var="now" value="<%= new java.util.Date() %>"/> 
		
		<!-- 국제화 태그가 사용살 시간대를 설정 -->
		<fmt:timeZone value="Hongkong"/>
		
		<!-- Date -->
		Date - date type -  full style: <fmt:formatDate value="${now}" type="date" dateStyle="full"/> <br>
		Date - date type - short style: <fmt:formatDate value="${now}" type="date" dateStyle="short"/>
		<!--result: 2019년 6월 28일 금요일 / 19. 6. 28  -->
		
		<hr> <!-- time -->
		Date - time type - full: <fmt:formatDate value="${now}" type="time" timeStyle="full"/> <br>
		Date - time type - short: <fmt:formatDate value="${now}" type="time" timeStyle="short"/>
		
		<hr> <!-- time & date = both -->
		Both - no style: <fmt:formatDate value="${now}" type="both"/> <br> 
		<!-- NAVER 양식 : 2019. 6. 28 오후 1:03:41 -->
		Both - short: <fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short"/> <br>
		Both - full: <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/> <br>
		
		<hr> <!--사용자 지정 패턴  -->
		<fmt:formatDate value="${now}" pattern="yyyy.MM.dd. H:mm:ss"/> <br>
		<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 H시 mm분 "/> <br>
		<!-- NAVER 양식 : 2019.06.28. 13:03 -->
		
		

	</h3>
</body>
</html>
