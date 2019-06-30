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
	<!-- footer end -->
</body>
</html>

<%-- 
1. <%@ include file="" %> 
- 외부 페이지 가져와서 index.jsp 에서 한번에 인코딩 처리
 
2. <jsp:forward page="">
<jsp:param value="forward를 통해 전달할 값" name="value를 담을 명확한 이름"/>
</jsp:forward>

3. <%= request.getParameter("email") %>
- name 을 통해 다음 페이지에서는 name 에 담긴 value를 전달받는다.  
--%>