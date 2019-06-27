<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<h3>
		수치연산:<br>
		10-1: ${10-1 }<br>
		10+1: ${10+1 }<br>
		10*10: ${10*10 }<br> 
		10/3: ${10/3 }<br>
		10/2: ${10/2 }<br>
		10%3: ${10%3 } <br>
		
		<hr>
		키워드로 나눗셈, 나머지 연산:<br>
		10 div 3: ${10 div 3 }<br>
		10 div 2: ${10 div 2 }<br>
		10 mod 3: ${10 mod 3 } <br>
		
		<hr>
		비교연산: <br>
		1 ==1 : ${1 ==1 }<br>
		10 != 10 : ${10 != 10 }<br>
		10 > 1 : ${10 > 1 }<br>
		10 < 1 : ${10 < 1 }<br>
		10 >= 1 : ${10 >= 1 }<br>
		10 <= 1 : ${10 <= 1 }<br>
		
		<hr>
		키워드로 비교연산: <br>
		1 eq 1 : ${1 eq 1 }<br>
		10 ne 10 : ${10 ne 10 }<br>
		10 gt 1 : ${10 gt 1 }<br>
		10 lt 1 : ${10 lt 1 }<br>
		10 ge 1 : ${10 ge 1 }<br>
		10 le 1 : ${10 le 1 }<br>
		
		<hr>
		${true && true }<br>
		${true || true }<br>
		${!true }<br>
		${true and true }<br>
		${true or true }<br>
		${not true }<br>
		
	</h3>
</body>
</html>