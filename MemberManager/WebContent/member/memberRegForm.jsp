<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style></style>
</head>
<body class="text-center">
	<div class="container">
		<!-- header start -->
		<%@ include file="../frame/header.jsp"%>
		<!-- header end -->

		<!-- content start -->
		<div id="content" class="inner">
			<form action="memberReg.jsp" method="post" class="formwrap">
				<h3>회원가입</h3>
				<input type="email" name="userid" placeholder="아이디(이메일)" class="form-control" required> 
				<input type="password" name="userpw" placeholder="비밀번호" class="form-control" required>
				<input type="text" name="username" placeholder="이름" class="form-control" required> 
				<div>사진 <input type="file" name="uphoto"></div> 
				<input type="submit" value="회원가입" class="btn btn-warning btn-block">
			</form>
		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="../frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>