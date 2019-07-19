<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<ul>
	<li><a href="#">FOOD</a></li>
	<li><a href="#">ACTICITY</a></li>
	<li><a href='<c:url value="/movie/movieMain.jsp"/>'>MOVIE</a></li>
	<li><a href="${ pageContext.request.contextPath }/message/messageList.jsp">MESSAGE</a></li>
</ul>

