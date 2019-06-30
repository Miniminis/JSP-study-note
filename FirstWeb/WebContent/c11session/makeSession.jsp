<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>

	<h1>Session을 이용한 데이터 저장</h1>

	<%
		//KING - object 타입 
		//--> name, id, isLogin, age 를 포함하는 클래스를(UserInfo) 생성해서 Object를 넣어주는 방식으로 사용하게 됨
		session.setAttribute("name", "KING");
		session.setAttribute("id", "tiger");
		session.setAttribute("isLogin", true);
		session.setAttribute("age", 20);
	%>
	
	<h3>세션에 데이터를 저장했습니다.</h3>
	
	<a href="viewSession.jsp">viewSession in session folder</a><br>
	<a href="../response/viewSession.jsp">viewSession in response folder</a><br>
	<a href="logout.jsp">logout session</a><br>

</body>
</html>