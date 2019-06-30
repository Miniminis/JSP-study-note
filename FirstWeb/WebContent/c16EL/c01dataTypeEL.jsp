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
	<h2>
		boolean: ${true }/ ${false }<br> 
		정수/ 실수: ${256 } / ${3.141592 }<br> <!--특정 데이터의 연산 결과가 정수, 실수타입이 나오더라도 표현 가능하다는 것을 증명  -->
		문자열: ${'작은 따옴표' } / ${"큰따옴표" }<br>
		<a href="${'url'}">href 속성 표현을 위해 url은 ' ' 사용</a><br>
		null은 표현안됨: ${null} <br> <!-- null 값은 표현이 되지 않음!  -->
	</h2>
</body>
</html>