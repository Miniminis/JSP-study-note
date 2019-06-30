<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="list.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	img {
		width: 200px;
		height: 200px;
	}
</style>
<!--js code ver  -->
<!-- <script>
	$(document).ready(function(){
		alert('회원 가입페이지 입니다.');
	});
</script> -->

<!--JSP code ver: 
- 자바로 처리할 수 있는 다양한 데이터의 처리를 가능하게 해준다.
- html 문서로 표시되지 않는다: 페이지 소스보기에서도 보이지 않는다.
- 기본 템플릿을 기준으로 확장하여 사용자마다/메뉴마다 다른 페이지를 보내줄 수 있다. - 동적인 페이지 구성 
-->
<%
	String str = new String("회원가입 페이지");
%>

</head>
<body>
	<h1><%= str %></h1>
	<a href="/web/member/list.jsp">회원리스트</a><br> <!-- 절대경로로 표현: 서버 기준!!!   -->
	<img alt="이미지" src="../image/zootopia_1.jpg">
</body>
</html>

<!-- FirstWeb: localhost:8080/web/ ~ 
절대경로 표현: 서버기준 -> /web/member/list.jsp 
- 서버기본주소를 기준으로 context 표시 후에 폴더부터 표시해주어야함
-->