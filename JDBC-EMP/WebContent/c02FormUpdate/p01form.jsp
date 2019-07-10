<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style></style>
</head>
<body>
	<h1>사원이름 수정</h1>
	<hr>
	
	<form action="p02Edit.jsp" method="post">
		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="number" name="empno" required></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" name="ename" required></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>