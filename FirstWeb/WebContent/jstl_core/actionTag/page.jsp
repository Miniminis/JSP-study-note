<%@page import="web.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--@ page.jsp 의 용도: 응답페이지 컨트롤 A or B or C @-->
	
	<!-- 
	pType 파라미터 값을 가져온 뒤-> null 값을 비교 
	no 파라미터 값을 가져온 뒤-> null 값을 비교
	username 파라미터 값을 가져온 뒤-> null 값을 비교
	-->	
	
	<c:set value="${param.type}" var="pageType" scope="request"/>
	<c:if test="${pageType eq null or pageType == ''}">
		<c:set value="a" var="pageType"/>	
	</c:if>
	
	<c:set value="${param.no}" var="pNo" scope="request"/>
	<c:if test="${pNo eq null or pNo == ''}">
		<c:set value="0" var="pNo"/>
	</c:if>
	
	<c:set value="${param.username}" var="username" scope="request"/>
	<c:if test="${username eq null or username == ''}">
		<c:set value="noname" var="username"/>
	</c:if>

	<!-- /* pageType에 따라 분기처리  */ -->
	<%-- <c:if test="${pageType eq 'a' }">
		<c:set value="a.jsp" var="uri" />
	</c:if>
	<c:if test="${pageType eq 'b' }">
		<c:set value="b.jsp" var="uri" />
	</c:if>
	<c:if test="${pageType eq 'c' }">
		<c:set value="c.jsp" var="uri" />
	</c:if> --%>
	
	<%-- <c:choose>
		<c:when test="${pageType eq 'a' }">
			<c:set value="a.jsp" var="uri" />
		</c:when>
		<c:when test="${pageType eq 'b' }">
			<c:set value="b.jsp" var="uri" />
		</c:when>
		<c:when test="${pageType eq 'c' }">
			<c:set value="c.jsp" var="uri" />
		</c:when>
		<c:otherwise>
			<c:set value="a.jsp" var="uri" />
		</c:otherwise>
	</c:choose> --%>
	<!-- 외부에 uri 를 공유할 필요 없음! 따라서 default 값인 page로 설정 -->
	<!-- 페이지에 다른 파라미터 값이 들어와도  default page인 a page로 이동함! -->
	
	<%-- <jsp:forward page="${uri}"/> --%>
	<jsp:forward page="${pageType}.jsp"/>
	
	