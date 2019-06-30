<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	h1 {
		text-align: center;
		color: red;
	}
	div {
		width: 45%;
		float: left;
		padding: 10px;
	}
	#footer {
		width: 100%;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>include 지시어와 액션</h1>
	<hr>
	<!-- 메뉴시작  -->
	<%@ include file="top.jsp" %>
	<!-- 메뉴끝 -->
	
	<!-- 뉴스영역 -->
	<%@ include file="news.jsp" %>
	<!-- 뉴스 끝  -->
	
	<!-- 쇼핑영역  -->
	<%@ include file="shopping.jsp" %>
	<!-- 쇼핑 끝 -->

	
	<!-- include 액션  -->
	<!-- footer start  -->
	<jsp:include page="footer.jsp">
		<jsp:param value="010-3030-3333" name="tel" />
		<jsp:param value="test@test.com" name="email" />
	</jsp:include>
	<!-- footer start  -->
</body>
</html>