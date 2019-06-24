<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userData" class="web.UserInfo" scope="request"/>
<jsp:setProperty property="*" name="userData"/> <!-- *: 모든 property 받아오기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
<h1><%= userData %></h1>
<jsp:forward page="viewUser.jsp"/>
<!--viewUser.jsp 페이지와 userinfo 객체 공유  -->
</body>
</html>