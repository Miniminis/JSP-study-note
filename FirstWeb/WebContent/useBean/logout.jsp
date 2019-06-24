<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//false 현재의 session을 invalidate() 해주어 세션 종료시키기 
	request.getSession(false).invalidate();

	//세션 종료 후에는 메인 페이지로 이동처리
	response.sendRedirect(request.getContextPath());
%>