<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style></style>
</head>
<body>
	<h1>신규정보등록</h1>
	<hr>
	
	<form action="p04Insert.jsp" method="post">
		<table>
		
			<tr>
				<td>사원번호</td>
				<td><input type="number" name="empno" required></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" name="ename" required></td>
			</tr>
			<tr>
				<td>사원직무/직책</td>
				<td><input type="text" name="job" required></td>
			</tr>
			<tr>
				<td>상관번호</td>
				<td><input type="number" name="mgr"></td>
			</tr>
			<tr>
				<td>입사년도</td>
				<td><input type="text" name="hiredate"></td>
			</tr>
			<tr>
				<td>급여</td>
				<td><input type="number" name="sal"></td>
			</tr>
			<tr>
				<td>커미션</td>
				<td><input type="number" name="comm"></td>
			</tr>
			<tr>
				<td>부서번호</td>
				<td><input type="number" name="deptno"></td>
			</tr>		
			<tr>
				<td><input type="submit" value="등록하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>

<!-- 이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
 -->