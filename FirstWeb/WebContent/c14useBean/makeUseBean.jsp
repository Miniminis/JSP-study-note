<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="userinfo" class="web.UserInfo" scope="page" />
<!--scope default: page  -->
<!--1. 해당 영역에 userinfo이름의 web.UserInfo 타입의 객체가 있는지 확인  
2. 있다면, 현재 저장되어있는 객체를 반환 -- 있으면 기존의 것을 가져다가 쓴다!
3. 없다면, 새로운 객체 생성 UserInfo ui = new web.UserInfo();
	3-1. pageContext.setAttribute("userinfo",  ui);
-->

<jsp:setProperty property="name" value="hot" name="userinfo" />
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
		userinfo.setId("speedy");
	%>

	<%=userinfo.getId()%><br>
	<%=userinfo.getUsername()%>
	
	<!-- 에러이유: 매개변수를 받는 생성자 -- 요구되는 모든 매개변수를 입력해주어야함 -->
	
	<%= userinfo %>
</body>
</html>