<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--1순위 에러 페이지 지정  -->
<%@ page errorPage="errorPage/defaultErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>스토리 아프리카 관리자 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<style></style>
</head>
<body class="text-center">
	<div class="container">
		<!-- header start -->
		<%@ include file="frame/header.jsp"%>
		<!-- header end -->

		<!-- content start -->
		<div id="content" class="inner">
			<h3>당신의 아프리카 이야기를 들려주세요</h3>
			<p>mainpagemainpagemainpagemainpagemainpagemainpagemainpagemainpage
			mainpagemainpagemainpagemainpagemainpagemainpagemainpagemainpagemainpage
			mainpagemainpagemainpagemainpagemainpagemainpagemainpagemainpage</p>
		</div>
		<input type="button" value ="더 알아보기" class="btn btn-warning btn-lg"/>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>