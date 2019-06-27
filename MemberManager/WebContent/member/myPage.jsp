<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	LoginInfo loginInfo = (LoginInfo)session.getAttribute("LOGININFO");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
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
			${sessionScope.LOGININFO}
			<!-- Map.get("LOGININFO")  -->
			<%
				//out.println(loginInfo.getUserid());
				if(loginInfo != null) {			
					out.print("<img src=\"../image/"+loginInfo.getUphoto()+"\"<br>");
					out.print("<h4>"+loginInfo.getUserid()+"</h4><br>");
					out.print("아이디 <input type=\"text\" value="+loginInfo.getUserid()+" class=\"form-control\"><br>");
					out.print("이름 <input type=\"text\" value="+loginInfo.getUsername()+" class=\"form-control\"><br>");
				} else {
					out.print("<script>alert('로그인이 필요한 페이지입니다!'); location.href=\"login.jsp\";</script>");
				}
			%>
			${sessionScope.LOGININFO.uphoto}<br>
			${sessionScope.LOGININFO.userid }<br>
			${LOGININFO.username }<br>
			</form>
		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="../frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>