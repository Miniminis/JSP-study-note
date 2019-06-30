<%@page import="web.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List <Member> list = new ArrayList<Member>();
	
	list.add(new Member("플래시", "flash", "010-1111-2222"));
	list.add(new Member("플래시2", "flash2", "000-0000-0000"));
	list.add(new Member("플래시3", "flash3", ""));
	list.add(new Member("플래시4", "flash4", null));
	list.add(new Member("플래시5", "flash5", "010-1111-2222"));
	list.add(new Member("플래시6", "flash6", "010-1111-2222"));
	
	application.setAttribute("members", list);
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
	<h3>
		1: <c:out value="flash" /><br>
		2: <c:out value="${param.code }" default="judy" /><br>
		3: <c:out value="${param.code }" escapeXml="false">
			<span style="color: red">lion</span>
		</c:out><br>
		<!-- escapeXml="false" 
		-c:out 태그 사이에 있는 값을 태그로 인식한다! 
		true는 텍스트로 인식, default 는 true; -->
		<!-- param.code == null -> default 값으로 출력됨  -->
	</h3>
	<hr>
	
	<table>
		<tr>
			<td>index/count</td>
			<td>이름</td>
			<td>아이디</td>
			<td>전화번호</td>
		</tr>
		<c:forEach var="member" items="${members}" varStatus="status" begin="0" end="3">
		<!-- member: 각각의 맴버 객체(name, id, phnum 을 가지는!)를 가리킨다. -->
		<tr>
			<td>${status.index} / ${status.count}</td> <!--count는 1부터 시작, index는 0부터 시작  -->
			<td>${member.name }</td> <%-- <c:out value="${member.name}"/> --%>
			<td>${member.id }</td>
			<td>
				<c:out value="${member.pnum }" escapeXml="false">
					<!--default 값 정의  -->
					<span style="color: red">존재하는 전화번호가 없습니다.</span>
				</c:out>
			</td>
			<!--만약 이름과 아이디는 필수사항이고, 이메일은 선택사항이면
				이름, 아이디는 EL을 이용해서 간단히 출력하고 
				이메일은 존재하지 않을 수 있으므로 out 객체를 이용해서 default 값 설정 및 출력을 해준다.  -->
		</tr>
		</c:forEach>
		
		<!-- forTokens -->
		<c:forTokens items="홍길동, 010-1111-2222,서울" delims="," var="sel">
			${sel}<br>
		</c:forTokens>		
	</table>
</body>
</html>