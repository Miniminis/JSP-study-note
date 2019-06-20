<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Manager</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style></style>
</head>
<body>
	<!-- header start -->
	<%@ include file="../frame/header.jsp"%>
	<!-- header end -->

	<!-- navbar start -->
	<%@ include file="../frame/navbar.jsp"%>
	<!-- navbar end  -->

	<!-- content start -->
	<div id="content">
		<h3>로그인 페이지</h3>
		<hr>
		<form action="loginProcess.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
			</tr>
			<tr>
				<td><input type="text" name="uid" placeholder="아이디"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" name="upw" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td><input type="submit"value="로그인하기"></td>
			</tr>
		</table>
		
		</form>
	</div>
	<!-- content end -->

	<!-- footer start  -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer end -->
</body>
</html>