<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<!-- % 자바 코드를 쓸 수 있는 영역! %  -->
<!-- %@ JSP 페이지의 초기 설정  %  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<h1>
		<%= new String("Test") %><br>
		<%= new java.util.Date() %>
	</h1> 
	
	<!-- %= println() %  -->
	<!-- JSTL에서는 ${}를 사용하여 print한다(=view page를 구성한다.) 더 빈번하게 사용됨 -->

</body>
</html>