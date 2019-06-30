<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		request 영역의 name01 : ${requestScope.name01}<br> 
								<%= request.getAttribute("name01") %><br>
								<!--EL: null 값을 아예 표현하지 않음 
									JSP 표현식: null이라고 표현!   -->
		session 영역의 name02 : ${sessionScope.name02}<br>
							<!-- 세션은 브라우저가 닫히고 다른 브라우저에서 로드하면 값이 표현 되지 않음. 
								세션 종료하면서 정보의 생명주기도 종료되었기 때문  -->
		application 영역의 name03 : ${applicationScope.name03}
	</h3>
</body>
</html>