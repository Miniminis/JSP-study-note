<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="navbar">
	<a href="<%=request.getContextPath() %>">홈</a>
	<a href="<%=request.getContextPath() %>/member/login.jsp">로그인</a> 
	<a href="<%=request.getContextPath() %>/member/memberRegForm.jsp">회원가입</a>
	<a href="<%=request.getContextPath()%>/member/myPage.jsp">내정보보기</a>	
	<a href="#">회원리스트</a>
	<a href="<%=request.getContextPath()%>/member/logout.jsp">로그아웃</a>
</div>

<!-- 네비게이션 바를 include 를 통해서 불러올때에는 
절대경로를 사용해야 각각의 페이지의 서로 다른 위치에서도 올바른 주소로 
접근할 수 있다.  -->
