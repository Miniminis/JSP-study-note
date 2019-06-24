<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<form class="formwrap">
				<h3><%=loginInfo.getUserid()%>님의 마이페이지입니다.</h3>
				<input type="text" name="userid" placeholder="아이디"
					value="<%=loginInfo.getUserid()%>" class="form-control"> <input
					type="text" name="userpw" placeholder="비밀번호"
					value="<%=loginInfo.getUserpw()%>" class="form-control">
			</form>
		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="../frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>