<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../errorPage/viewErrorPage.jsp" %> <!--에러 페이지 순위: 1순위  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>

name 파라미터 값: <%= request.getParameter("name").toUpperCase() %>
<!--위의 상황에서 name값이 전달되지 않으면 - nullpointexception 발생하게됨  -->
</body>
</html>


<%-- 1순위. page 디렉티브에서 errorpage 속성에서 에러페이지 지정해주기 
- <%@ page errorPage="에러페이지경로"%>
*** 모든 에러페이지에는 isError 속성을 표시해주어야 함
<%@ page isErrorPage="errorPage.jsp"%>
2순위: web.xml: 예외 타입 
- errorpage exception-type
3순위: web.xml: 에러 코드
- errorpage - errorcode 
4순위: default 에러페이지 출력 --%>