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
	<h1>javascript 를 이용한 쿠키 관리 페이지</h1>

	쿠키이름 <input type="text" id="cName">, 
	쿠키 데이터 <input type="text" id="cValue">
	<input type="button" id="createCookie" value="쿠키 생성하기!">
	<input type="button" id="deleteCookie" value="쿠키 삭제">

	<hr>
	<input type="button" id="viewCookie" value="쿠키 값 확인!">
	<div id="view"></div>

		<script>
			$(document).ready(function() {
	
				//var name = 'speedy'; //임의로 설정한 값
				
				//쿠키의 존재 여부를 확인하기 위한 함수
				$('#viewCookie').click(function() {
					
					name = $('#cName').val();
	
					var value = document.cookie.match('(^|;)?'+ name + '=([^;]*)(;|$)');
					value = value?value[2]:null;
					alert(value);
	
					$('#view').html('name=' + value);
				});
	
				
				$('#createCookie').click(function() {
	
					var cName = $('#cName').val();
					var cValue = $('#cValue').val();
	
					setCookie(cName, cValue, 1);
					alert("쿠키가 생성되었습니다.");
	
				});
				
				var setCookie = function(name, value, day) {
					
					var date = new Date();
					date.setTime(date.getTime() + day * 60 * 60 * 24 * 1000);
					document.cookie = name + '=' + value +';expires='
							+ date.toUTCString() + ';path=/';
				};
				
				
				$('#deleteCookie').click(function(){
					
					var cName = $('#cName').val();
					deleteCookie(cName);
					alert("쿠키가 삭제되었습니다.");
				});
				
				var deleteCookie = function(name){
					
					var date = new Date();
					document.cookie=name+"="+";expires="+date.toUTCString()+";path=/";
				}
	
			});

		</script>
</body>
</html>