<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<form action="login.jsp" method="post" id="loginform">
		아이디 <input type="text" name="id" size="10" id="id"> 
		암호 <input type="password" name="password" size="10"> 
		자동로그인 <input type="checkbox" name="autologin" value="saveId" id="autologin" >
		<input type="submit" value="로그인">
	</form>

</body>
<script>
$(document).ready(function(){
	
	var getCookie = function(name){
		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value? value[2] : null;
	};
	$('#id').attr('placeholder',  '왜안나와');
	alert(getCookie(ID));

});
</script>

</html>