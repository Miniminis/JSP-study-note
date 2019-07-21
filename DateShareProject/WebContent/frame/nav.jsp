<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/744ccfa256.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<ul>
	<li><a href="#"><i class="fas fa-utensils"></i> FOOD</a></li>
	<li><a href="#"><i class="fas fa-snowboarding"></i> ACTICITY</a></li>
	<li><a href='<c:url value="/movie/movieMain.jsp"/>'><i class="fas fa-video"></i> MOVIE</a></li>
	<li><a href="${ pageContext.request.contextPath }/message/messageList.jsp"><i class="fas fa-envelope"></i> MESSAGE</a></li>
</ul>

