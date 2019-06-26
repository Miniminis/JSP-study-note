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

	<form action="login.jsp" method="post" id="loginForm">
		<h1>로그인</h1>
		<hr>
		아이디: <input type="text" name="id" id="id"><br> 
		비밀번호: <input type="password" name="pw"><br> 
		아이디 저장: <input type="checkbox" name="autologin" value="checked" id="saveID"><br>
		<input type="submit" value="로그인">
	</form>
	<br>

	<a href="loginCheck.jsp">로그인 체크하기</a>

	<script>
		$(document).ready(
				function() {
					
					//쿠키값을 가져오기 위한 자바스크립트 매서드
					var getCookie = function(name) {
						var value = document.cookie.match('(^|;)?' + name + '=([^;]*)(;|$)');
						return value ? value[2] : null;
					};
					
					//아이디 저장 체크되어있으면 --> 저장된 쿠키값 아이디를 로그인 폼에 value값으로 띄워줌
					//$('#id').attr('placeholder', getCookie("ID"));
					//alert(getCookie("AUTOLOGIN")==null);
					//alert($('#saveID').prop('checked','checked'););
					
					if(getCookie("AUTOLOGIN")!=null) {
						//아이디 저장 체크 --> 아이디 input 속에 쿠키에 저장된 아이디 표시 
						$('#id').attr('value', getCookie("ID"));
						
						//아이디 저장 체크 --> 값이 저장된 쿠키가 남아있는한 계속 체크 유지
						$('#saveID').prop('checked','checked');
					}
				});
	</script>

</body>
</html>