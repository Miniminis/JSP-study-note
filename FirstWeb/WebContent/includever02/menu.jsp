<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");
	if (category.equals("1")) {
%>
<ul>
	<li>회사소개</li>
	<li>회사위치</li>
</ul>
<%
	} else if(category.equals("2")) {
%>
<ul>
<li>메뉴소개</li>
<li>메뉴위치</li>
<li>메뉴소개</li>
<li>메뉴위치</li>
</ul>
		
<%
	}
%>