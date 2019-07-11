<%@page import="guestBook.Model.Message"%>
<%@page import="guestBook.Model.MessageListView"%>
<%@page import="guestBook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNumberstr = request.getParameter("page");
	
	//값이 전달 안되었을 경우를 대비하여 1페이지로 초기화 
	int pageNumber = 1; 
	
	//전달받은 페이지 번호 integer 로 형변환 
	if(pageNumberstr != null) {
		pageNumber = Integer.parseInt(pageNumberstr);
	}
	
	//핵심처리할 서비스 객체 
	GetMessageListService service = GetMessageListService.getInstance();
	
	//응답 데이터의 결과 
	MessageListView viewData = service.getMessageListView(pageNumber);

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
	table {
		margin: 0 auto;
	}
	
	div {
		margin: 5px auto;
		width: 500px;
		border: 2px solid #333;
	}
	
</style>
</head>
<body>
	<h2>방명록 글쓰기</h2>
	<hr>
	<form action="writeMessage.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="gname"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="gpassword"></td>
			</tr>
			<tr>
				<td>메시지</td>
				<td><textarea rows="3" cols="30" name="gmessage"></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="등록하기"></td>
			</tr>
		</table>
	</form>
	
	<hr>
	
	<%
	
		if(viewData.isEmpty()) {
			%>
			<h3>등록된 메시지가 없습니다.</h3>
			<%
		} else {
			for(Message message : viewData.getMessageList()) {
			%>
			<div>
				<table>
					<tr>
						<td>메시지번호 : <%= message.getMessage_id() %></td>
						<td>손님이름 : <%= message.getGname() %></td>
						<td>메시지 : <%= message.getGmessage() %></td>
						<td><a href="#">삭제하기</a></td>
					</tr>
				</table>
			</div>
			<%
			}
		}
	//[1] [2] [3] ...
	for(int i=1; i<= viewData.getPageTotalCnt(); i++) {
	
	%>
	<a href="formList.jsp?page=<%= i %>">[<%= i %>]</a>
	<%
		
	}
	%>
	
	
</body>
</html>