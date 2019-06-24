<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="regData" class="member.MemberInfo" scope="request" />
<jsp:setProperty property="*" name="regData" />

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
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("uid");
		String userpassword = request.getParameter("upw");
		String username = request.getParameter("uname");
	%> --%>
	<div class="container">

		<!-- header start -->
		<%@ include file="../frame/header.jsp"%>
		<!-- header end -->

		<!-- content start -->
		<div id="content" class="inner">
			<h3>등록된 정보는 다음과 같습니다.</h3>
			<form class="formwrap">
				<input type="email" name="uid" placeholder="아이디" value="<%=regData.getUserid()%>" class="form-control"> 
				<input type="password" name="upw" placeholder="비밀번호" value="<%=regData.getUserpw()%>" class="form-control"> 
				<input type="text" name="uname" placeholder="이름" value="<%=regData.getUsername()%>" class="form-control">
				<div> 사진 <input type="file" name="uphoto"></div>
				<a href="<%= request.getContextPath()%>/index.jsp" class="btn btn-warning btn-lg">홈으로 돌아가기</a>
			</form>
		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="../frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>