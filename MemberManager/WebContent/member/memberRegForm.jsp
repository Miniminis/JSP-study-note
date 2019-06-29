<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="../static/login.css" rel="stylesheet" type="text/css">
<style>
	.form-signin input[type="password"] {
	  margin-bottom: -1px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	.form-signin input[type="text"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
</style>
</head>


<body class="text-center">
	<!-- content start -->
	<form action="memberReg.jsp" method="post" class="form-signin">
		<img class="profile-img" src="../image/zootopia_1.jpg">
		<h1 class="h3 mb-3 font-weight-normal">회원가입</h1>

		<label for="inputEmail" class="sr-only">이메일 주소(아이디)</label>
		<input type="email" name="userid" id="inputEmail" class="form-control" placeholder="이메일 주소(아이디)" required autofocus>
		
		<label for="inputPassword" class="sr-only">비밀번호</label>
		<input type="password" name="userpw" id="inputPassword" class="form-control" placeholder="비밀번호" required>
		
		<label for="inputUsername" class="sr-only">이름</label>
		<input type="text" name="username" id="inputUsername" class="form-control" placeholder="이름" required>
		
		<label class="sr-only">
			사진 
			<input type="file" name="uphoto" class="form-control">
		</label>
		
		<input type="submit" value="회원가입" class="btn btn-lg btn-primary btn-block" >
	   	<a href="../index.jsp"><input type="button" value="홈으로" class="btn btn-lg btn-primary btn-block" ></a>
 		<p class="mt-5 mb-3 text-muted">&copy; 2019</p>				
		
	</form>
	<!-- content end -->
</body>
</html>