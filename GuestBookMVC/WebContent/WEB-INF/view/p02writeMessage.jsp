<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
	body {
		margin: 200px;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>서비스 페이지에서 입력 처리 결과 resultCnt: ${resultCnt}</h1>
	
	<%-- <h1>
		<c:if test="${resultCnt == 1}">
			정상적으로 입력되었습니다. 
		</c:if>
		<c:if test="${resultCnt != 0}">
			입력실패 ㅠㅠㅠ 0
		</c:if>
	</h1> --%>
	
	<a href='<c:url value="guestList"/>'>방명록 리스트 바로가기</a>
</body>
</html>