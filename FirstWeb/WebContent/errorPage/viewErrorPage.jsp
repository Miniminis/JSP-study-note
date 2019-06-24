<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%> <!--에러처리 페이지에서만 사용  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>

	<h1>
		요청하신 내용을 처리 중에 오류가 발생했습니다. <br> 빠른 시간안에 해결하겠습니다.
	</h1>
	<br> 에러 타입:<%=exception.getClass().getName()%>
	<br> 에러 메시지:
	<b><%=exception.getMessage()%></b>

	<a href="<%=request.getContextPath()%>/people.jsp">조약돌 키보드</a>
	<!-- 404에러 발생시키면 viewErrorPage404.jsp로 바로 이동됨 -->

</body>
</html>
<!--
만약 에러 페이지의 길이가 513 바이트보다 작다면,인터넷 익스플로러는 이 페이지가 출력하는 에러 페이지
를 출력하지 않고 자체적으로 제공하는 'HTTP 오류 메시지' 화면을 출력할 것이다. 만약 에러 페이지의 길이
가 513 바이트보다 작은데 에러 페이지의 내용이 인터넷 익스플로러에서도 올바르게 출력되길 원한다면, 응
답 결과에 이 주석과 같은 내용을 포함시켜서 에러 페이지의 길이가 513 바이트 이상이 되도록 해 주어야 한
다. 참고로 이 주석은 456바이트이다.
-->