<%@page import="member.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Enumeration<String> e = application.getAttributeNames();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원 목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style>
table {
	margin: 0 auto;
	width: 80%;
	border: 0;
	border-collapse: collapse;
}

table td {
	padding: 3px;
	border: 1px solid white:
}
</style>
</head>
<body class="text-center">
	<div class="container">
		<!-- header start -->
		<%@ include file="../frame/header.jsp"%>
		<!-- header end -->

		<!-- content start -->
		<div id="content" class="inner">
		<h3>회원 목록</h3>
			<table>
				<tr>
					<td>순번</td>
					<td>아이디</td>
					<td>이름</td>
					<td>비밀번호</td>
					<td>이미지</td>
					<td>관리</td>
				</tr>
				
				<!--회원 리스트의 반복 시작  -->
				
				<%
					int cnt = 0;
					while(e.hasMoreElements()) {
						String name = e.nextElement();
						Object obj = application.getAttribute(name);
						
						if(obj instanceof MemberInfo) {
							MemberInfo member = (MemberInfo)obj;
						
						%>
							<tr>
								<td><%= ++cnt %></td>
								<td><%= member.getUserid() %></td>
								<td><%= member.getUsername() %></td>
								<td><%= member.getUserpw() %></td>
								<td><img src="<%= request.getContextPath()%>/image/<%=member.getUphoto()%>"></td>
								<td><a>수정</a>	<a>삭제</a></td>
							</tr>
						<%}
					}
				%>
				<!--회원 리스트의 반복 끝-->
			</table>
		</div>
	</div>
	<!-- content end -->

	<!-- footer start  -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer end -->
	</div>
</body>
</html>