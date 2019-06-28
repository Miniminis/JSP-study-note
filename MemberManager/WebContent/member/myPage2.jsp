<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style></style>
</head>
<body class="text-center">
	<div class="container">

		<!-- header start -->
		<%@ include file="../frame/header.jsp"%>
		<!-- header end -->

		<!-- content start -->
		<div id="content" class="inner">
			<form class="formwrap">		
				<c:if test="${LOGININFO ne null}">		
					<img src="../image/${LOGININFO.uphoto}"><br>
					아이디 <input type="text" value="${sessionScope.LOGININFO.userid}" class="form-control"><br>	
					이름 <input type="text" value="${LOGININFO.username}" class="form-control"><br>
					가입일 <input type="text" value='<fmt:formatDate value="${LOGININFO.regDate}" pattern="yyyy.MM.dd. H:mm" />' class="form-control"><br>					
				</c:if>
					
				<c:if test="${LOGININFO eq null }">
					<script>
						alert('로그인이 필요한 페이지입니다!'); 
						location.href="login.jsp";
					</script>
				</c:if>
			</form>
		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="../frame/footer.jsp"%>
		<!-- footer end -->
	</div>
</body>
</html>