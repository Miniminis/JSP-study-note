<%@page import="guestBook.service.InvalidMessagePasswordException"%>
<%@page import="guestBook.service.MessageNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="guestBook.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//p03confirmDeletion 페이지에서 받아온 게시글 아이디, 비밀번호 변수에 받기 
	String messageId = request.getParameter("messageId");
	int mid = Integer.parseInt(messageId);
	String password = request.getParameter("passwordConfirm");
	
	//서비스 실행 결과를 나타낼 resultCnt 
	int resultCnt = 0;
	
	//실행 결과가 정상적으로 이루어졌다면, true 값으로 변경! 
	boolean chk = false;
	//예외 발생시 처리할 메시지 
	String msg = "";
	
	
	//서비스 객체 생성 
	DeleteMessageService dservice = DeleteMessageService.getInstance(); 
	
	try {
		resultCnt = dservice.deleteMessage(mid, password);
		chk = true;
	} catch(SQLException e) {
		msg = e.getMessage();	
	} catch(MessageNotFoundException e) {
		msg = e.getMessage();
	} catch(InvalidMessagePasswordException e) {
		msg = e.getMessage();
	}
	
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
		<%
			if(chk) {
				out.println(resultCnt+"개의 행이 삭제되었습니다.");
			} else {
				out.print(msg);
			}
		%>
	</h1>
	
	<a href="p01formList.jsp">메인 페이지로 이동하기</a>
</body>
</html>