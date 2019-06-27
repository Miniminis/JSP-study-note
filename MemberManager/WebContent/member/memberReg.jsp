<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="regData" class="member.MemberInfo" scope="request" />
<jsp:setProperty property="*" name="regData" />

<%
	if (regData.getUphoto() == null) {
		regData.setUphoto(""+request.getContextPath()+"/image/noImg.jpg");
	}

	//어플리케이션 객체에 저장
	application.setAttribute(regData.getUserid(), regData);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입결과</title>
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
				<input type="email" name="uid" placeholder="아이디"
					value="${regData.userid}" class="form-control"> 
				<input type="password" name="upw" placeholder="비밀번호"
					value="${regData.userpw }" class="form-control"> 
				<input type="text" name="uname" placeholder="이름"
					value="${regData.username}" class="form-control">
				<div>
					사진 <input type="file" name="uphoto">
				</div>
				<a href="${pageContext.request.contextPath}/member/login.jsp"
					class="btn btn-warning btn-lg">로그인 하기</a>
				<a href="<%=request.getContextPath()%>/index.jsp"
					class="btn btn-warning btn-lg">홈으로 돌아가기</a>
			</form>
		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="../frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>