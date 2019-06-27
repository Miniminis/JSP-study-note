<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//브라우저가 요청할때, 모든 쿠키 정보를 함께 서버로 전송한다. 
	Cookie[] cookies = request.getCookies();
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
	<h1>Cookie Data using EL</h1>
	
	<h3>
		EL을 이용한 Cookie 참조<br>
		title: ${cookie.title.value}<br>
		id: ${cookie.id.value}<br>
		username: ${cookie.username.value}<br>
		code: ${cookie.code.value}<br>
	</h3>
	
	<hr>
	<h1>Cookie 값을 가져오기 위한 반복문</h1>
	<%
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {

				//if (cookies[i].getName().equals("title")) {
					out.println("<h3>쿠키이름: " + cookies[i].getName() + "<br> 쿠키값: " + cookies[i].getValue()
							+ "</h3><br>");
				//} else {
				//out.println("<h3>쿠키가 존재하지 않습니다.<h3>");
				//return; 
				//}				
			}
		}
	%>

	<a href="editCookie.jsp">쿠키 edit 결과 바로가기</a><br>
	<a href="deleteCookie.jsp">쿠키 delete 결과 바로가기</a>


</body>
</html>