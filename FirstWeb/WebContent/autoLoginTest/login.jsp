<%@page import="test.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String autologin = request.getParameter("autologin");
	//out.println(autologin);
	
	boolean chk = false;
	
	if(id.equals(pw)) {
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCCESS", 60*60);
		response.addCookie(c1);
		
		Cookie c2 = CookieBox.createCookie("ID", id, 60*60);
		response.addCookie(c2);
		
		if(autologin != null && autologin.equals("saveId")){
			Cookie c3 = CookieBox.createCookie("autologin", autologin, 60*60);
			response.addCookie(c3);
		} else {
			Cookie c3 = CookieBox.createCookie("autologin", "", 0);
			response.addCookie(c3);
		}
		
		chk = true;
	}
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
<%
		if(chk){
			out.println("<h1>로그인 되었습니다.</h1>");
			out.println("<a href=\"form.jsp\">홈으로 돌아가기</a>");
		} else {
			out.println("<script>alert(\'로그인 실패\'); history.go(-1); </script>");
		}
	
	%>

</body>
</html>