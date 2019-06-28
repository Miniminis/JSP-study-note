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
	<h1>fmt 태그의 사용 - number</h1>
	<h3>

		<c:set var="price" value="100000" />

		<fmt:formatNumber value="${price}" type="number" var="numberType" groupingUsed="false"/>
		<!-- 순서대로: 대상 숫자, 숫자의 타입, 변환된 숫자를 담을 변수, 세자리수 구분자 사용여부 -->
		기본 number type 표현 : ${numberType } <br>
		
		currency type 표현: <fmt:formatNumber value="${price }" type="currency" currencySymbol="\\"/><br>
		<!-- 순서대로: 대상숫자, 숫자표현타입, 통화의 종류 -->
		
		<c:set var="pi" value="3.141592"/>
		percent type 표현 : <fmt:formatNumber value="${price }" type="percent" groupingUsed="false" /> /
							<fmt:formatNumber value="${pi }" type="percent" /><br>
		
		
		pattern type 표현: <fmt:formatNumber value="${price}" pattern="00,000,000.00" /> /
		 					<fmt:formatNumber value="${pi}" pattern="00,000,000.00" />
		<!-- 개발자 정의 표현: pattern - 특정 자리수 (ex. 소숫점 둘째자리까지 표현 등) -->
	</h3>
</body>
</html>
