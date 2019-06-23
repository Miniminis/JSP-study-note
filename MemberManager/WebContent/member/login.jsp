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
	<div class="container">
		<!-- header start -->
		<%@ include file="../frame/header.jsp"%>
		<!-- header end -->

		<!-- content start -->
		<div id="content" class="inner">
			<form action="loginProcess.jsp" method="post" class="formwrap">
			<h3>로그인</h3>
				<div>
					<input type="text" name="uid" placeholder="아이디"
						class="form-control">
				</div>
				<div>
					<input type="password" name="upw" placeholder="비밀번호"
						class="form-control">
				</div>
				<div>
					<input type="checkbox" class="form-check-input" id="exampleCheck1">자동로그인
				</div>
				<div>
					<input type="submit" value="로그인하기"
						class="btn btn-warning btn-block">
				</div>
			</form>
		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="../frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>