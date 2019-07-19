<%@page import="dateShare.Model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session = request.getSession(false);
	
	LoginInfo user = (LoginInfo) session.getAttribute("userInfo");
%>
<div id="my">
	<span>
	<span id="my_info"><%= user.getU_name() %>(<%= user.getU_id() %>)님 환영합니다.</span>
	<a href="<%= request.getContextPath() %>/user/logout.jsp">로그아웃</a> | <a href="<%= request.getContextPath() %>/user/myInfo.jsp">내정보</a></span>
</div>
