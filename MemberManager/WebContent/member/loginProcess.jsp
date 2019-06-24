<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- request로 form 값을 전달받기 전에   -->
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session" />
<jsp:setProperty property="*" name="loginInfo" />
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
	<%-- <%
	
		String userid = request.getParameter("uid");
		String userpassword = request.getParameter("upw");

		if (userid != null && userpassword != null 
				&& userid.equals("admin") && userpassword.equals("admin")) {
			response.sendRedirect(request.getContextPath()); //  /mm
		}
	%> --%>
	<div class="container">

		<!-- header start -->
		<%@ include file="../frame/header.jsp"%>
		<!-- header end -->

		<!-- content start -->
		<div id="content" class="inner">
			<form class="formwrap">
				<h3><%=loginInfo.getUserid()%>님, 환영합니다! </h3>
				<input type="text" name="userid" placeholder="아이디" 
					value="<%=loginInfo.getUserid()%>" class="form-control"> 
				<input type="text" name="userpw" placeholder="비밀번호"
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