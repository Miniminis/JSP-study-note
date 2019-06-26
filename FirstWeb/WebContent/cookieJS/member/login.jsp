<%@ page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String autologin = request.getParameter("autologin"); 
	//참고) checkbox에 value값을 주지 않으면 on or null 로 전달된다.

	boolean chk = false;
	
	//id 혹은 pw 값이 null 일 경우 nullpointerexception 발생 예방 
	if (id != null && pw != null && id.equals(pw)) {
		//로그인 폼에서 입력받은 정보를 바탕으로 쿠키생성 : 사용자 데이터를 저장한다. -1: 브라우저 종료시 쿠키 삭제/ 0: 쿠키 삭제
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCCESS", 60*60);
		response.addCookie(c1);

		Cookie c2 = CookieBox.createCookie("ID", id, 60*60);
		response.addCookie(c2);
		
		//체크박스가 체크되지 않으면 null 값이 전달되어 nullpointerexception 발생함
		if(autologin != null && autologin.equals("checked")) {
			Cookie c3 = CookieBox.createCookie("AUTOLOGIN", autologin, 60*60);
			response.addCookie(c3);
		} else {
			Cookie c3 = CookieBox.createCookie("AUTOLOGIN", "", 0);
			response.addCookie(c3);
		}
		
		chk = true;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style></style>
</head>
<body>
	<%
		if (chk) {
			out.println("<h3>로그인 되었습니다.</h3>");
			out.println("<a href=\"loginCheck.jsp\">로그인 체크하기</a><br>");
		} else {
			out.println("<script>alert(\'아이디 혹은 비밀번호를 확인해주세요!\'); </script>");
		}
	%>
	

<%-- <%= request.getParameter("autologin") %>
<%= request.getParameter("id") %>
<%= request.getParameter("pw") %> --%>
</body>
</html>