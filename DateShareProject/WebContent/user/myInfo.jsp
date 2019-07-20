<%@page import="dateShare.Model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session = request.getSession(false);

	LoginInfo user = (LoginInfo) session.getAttribute("userInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	
</script>
</head>
<body>
<div id="wrap">
    <div id="main_wrap">
        <div id="header">
            <%@include file="../frame/header.jsp" %>
        </div>
        <div id="content">
		<div id="login_form_wrap">
					<h1>내정보보기</h1>
					<form action="insertMember.jsp" method="post">
						<div>
							ID<input class="input_t" type="text" name="u_id" value="<%= user.getU_id() %>">
						</div>
						<div>
							PW<input class="input_t" type="password" name="u_pw" value="<%= user.getU_pw() %>">
						</div>
						<div>
							이름<input class="input_t" type="text" name="u_name" value="<%= user.getU_name() %>">
						</div>
						<div>
							<a href="../main.jsp" class="input_ba">이전으로</a>
						</div>
					</form>
		</div>
</div>
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>