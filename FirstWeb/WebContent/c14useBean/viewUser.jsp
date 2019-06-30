<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="userData" class="web.UserInfo" scope="request"/>
<!-- scope="request" 라면, request.getAttribute("userdata")를 통해 데이터를 받아오고 있다. 
하지만 a page의 scope이 session으로 바뀐다면 현재 페이지에서는 request 영역에 있는 데이터가 없기 때문에 null로 표시될 것
- 이 페이지도 session으로 scope을 바꾼다면 다시 데이터를 받을 수 있다.  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<h1>
		regUser.jsp로부터 forward 된 페이지 입니다!<br>
		useBean을 통해서 데이터가 공유되고 있습니다.<br>
		<%=userData%>
	</h1>
	<a href="logout.jsp">로그아웃하기</a>
</body>
</html>