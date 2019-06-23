<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Manager</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style></style>
</head>
<body class="text-center">
	<%
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("uid");
		String userpassword = request.getParameter("upw");
		String username = request.getParameter("uname");
	%>
	<div class="container">

		<!-- header start -->
		<%@ include file="../frame/header.jsp"%>
		<!-- header end -->

		<!-- content start -->
		<div id="content" class="inner">
			<h3>회원가입 요청 처리페이지</h3>
			<table>
				<tr>
					<td><input type="email" name="uid" placeholder="아이디"
						value="<%=userid%>" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="password" name="upw" placeholder="비밀번호"
						value="<%=userpassword%>" class="form-control"></td>
				</tr>
				<tr>
					<td><input type="text" name="uname" placeholder="이름"
						value="<%=username%>" class="form-control"></td>
				</tr>
				<tr>
					<td>사진</td>
				</tr>
				<tr>
					<td><input type="file" name="uphoto"></td>
				</tr>
			</table>
		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="../frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>