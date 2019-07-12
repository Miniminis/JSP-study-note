<%@page import="guestBook.Model.Message"%>
<%@page import="guestBook.Model.MessageListView"%>
<%@page import="guestBook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터로 전달받은 message_id 에 맞는 게시물 삭제 처리 
	//삭제를 위해 비밀번호 다시 입력받기 --> 파라미터로 메시지 삭제 처리 페이지로 넘겨주기 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
	body {
		margin: 200px;
		text-align: center;
	}
	
</style>
</head>
<body>
	<h2>방명록 삭제</h2>
	<hr>
	<form action="p04deleteMessage.jsp" method="post">
		<h3>게시물을 삭제하려면 비밀번호를 입력해주세요.</h3>
		<input type="hidden" name="messageId" value='<%= request.getParameter("messageId")%>'>
		<input type="password" name="passwordConfirm" required><br>
		<input type="submit" value="삭제하기">
	</form>	
</body>
</html>