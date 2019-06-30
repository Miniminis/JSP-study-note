<%@page import="web.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- pType 파라미터 값을 가져온 뒤-> null 값을 비교  -->
	<c:set value="${param.type}" var="pageType" scope="request"/>
	<c:if test="${pageType eq null or pageType == ''}">
		<c:set value="a" var="pageType"/>	
	</c:if>
	
	<!--no 파라미터 값을 가져온 뒤-> null 값을 비교  -->
	<c:set value="${param.no}" var="pNo" scope="request"/>
	<c:if test="${pNo eq null or pNo == ''}">
		<c:set value="0" var="pNo"/>
	</c:if>
	
	<!-- username 파라미터 값을 가져온 뒤-> null 값을 비교 -->
	<c:set value="${param.username}" var="username" scope="request"/>
	<c:if test="${username eq null or username == ''}">
		<c:set value="noname" var="username"/>
	</c:if>

	<!-- /* pageType에 따라 분기처리  */ -->
	<!-- 방법 1) if 문 사용 - 페이지 타입에 따라 다른 값을 url 변수에 대입  -->
	<%-- <c:if test="${pageType eq 'a' }">
		<c:set value="a.jsp" var="uri" />
	</c:if>
	<c:if test="${pageType eq 'b' }">
		<c:set value="b.jsp" var="uri" />
	</c:if>
	<c:if test="${pageType eq 'c' }">
		<c:set value="c.jsp" var="uri" />
	</c:if> --%>
	
	
	<!-- 방법 2) choose-when 문 사용 - 페이지 타입에 따라 다른 값을 url 변수에 대입  -->	
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
	
	<!-- 방법 3) 페이지 선택지 eq jsp 파일 이름 이므로 바로 forward에 EL 사용하여 페이지 연결  -->
	<jsp:forward page="${pageType}.jsp"/>
	
	