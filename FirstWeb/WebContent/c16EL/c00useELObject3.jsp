<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("name01", "requestData");
	session.setAttribute("name02", "sessionData");
	application.setAttribute("name03", "applicationData");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style></style>
</head>
<body>
	<h3>
		request 영역의 name01 : ${name01}<br> 
								<%= request.getAttribute("name01") %><br>
								<!-- 속성을 담고있는 객체는 생략이 가능! 
									EL: 기본 제공하는 객체가 없다고 인식! 
									page- request - session - applicaiton 순으로 탐색 시작 
									해당 속성을 만나는 순간 탐색 종료! -->
		session 영역의 name02: ${name02}<br>
							<!-- 세션은 브라우저가 닫히고 다른 브라우저에서 로드하면 값이 표현 되지 않음. 
								세션 종료하면서 정보의 생명주기도 종료되었기 때문  -->
		application 영역의 name03 : ${name03}<br>
		
		<!-- 속성을 담고있는 객체는 생략이 가능! 
		- pageScope, requestScope, sessionScope, applicationScope 모두! 
		- 기본 제공 객체가 없으므로 page, request, session, application 순서대로 EL 이 탐색을 시작한다. 
		- 일치하는 속성이 존재하면 그 순간 탐색을 종료!  -->
	</h3>
	<hr>
	<h5>
		request 영역의 name01 : ${name01}<br> 
								<%= request.getAttribute("name01") %><br>
		session 영역의 name02: ${name01}<br>
		application 영역의 name03 : ${name01}<br>
		
		<!-- 만약 속성의 이름이 같다면, 탐색 순서대로 표현하므로, 모두 request.name01를 가져오게 됨 -->
	</h5>
	<hr>
	<h3>
		code 파라미터: ${param.code} <br>
		<!-- url 뒤쪽에 ?code=a 하면 a 출력  -->
		code 파라미터: <%= request.getAttribute("code") %>
		<!-- url 뒤쪽에 ?code=a 해도 그대로 null 값 표현  -->
	</h3>
	<hr>
	<h3>
		contextPath: ${pageContext.request.contextPath} <br>
		contextPath: <%= request.getContextPath() %><br>
		<!--둘의 결과가 같다!  -->
		example: <a href="${pageContext.request.contextPath }/useElObject/useELObject.jsp">경로1</a><br>
		example: <a href="<%= request.getContextPath() %>/useElObject/useELObject.jsp">경로2</a>
	</h3>
</body>
</html>