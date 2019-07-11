<%@page import="guestBook.service.WriteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. form으로부터 데이터 받기 
	//2. 받은 데이터는 Message 객체에 저장 : useBean 액션태그 사용 
	//3. WriteMessageService 객체생성
	//4. write 매서드 실행 : 1/0
%>

<%

	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="message" class="guestBook.Model.Message" scope="request"/>
<jsp:setProperty property="*" name="message"/>

<%
	WriteMessageService service = WriteMessageService.getInstance();
	int cnt = service.write(message);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style></style>
</head>
<body>

	<h1>
	<%= message.getGname() %>
	<!-- cnt 값 여부에 따라서 삼항연산자로 결과 분기처리  -->
	<%= cnt>0?"방명록에 메시지를 남겼습니다.":"메시지 등록에 실패하였습니다."%>
	</h1>
	<a href="formList.jsp">목록보기</a>
	
	
</body>
</html>