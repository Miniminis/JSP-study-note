<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="regData" class="member.MemberInfo" scope="request" />
<jsp:setProperty property="*" name="regData" />

<%
	if (regData.getUphoto() == null) {
		regData.setUphoto("<c:url value='/image/noimg.png'/>");
	}
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	
	//jdbcUrl
	String jdbcUrl = "jdbc:mysql://localhost:3306/testdb";
	//String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";


	try {
		//1. JDBC driver 로드 
		Class.forName("com.mysql.jdbc.Driver"); 
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//2. 데이터베이스 연결 
		conn = DriverManager.getConnection(jdbcUrl, "bit", "bit");
		//conn = DriverManager.getConnection(jdbcUrl, "SCOTT", "tiger");
		
		//3. 데이터 읽기 및 수정 
		/* 이름        널?       유형           
		IDX       NOT NULL NUMBER(7)    
		USERID    NOT NULL VARCHAR2(12) 
		USERPW    NOT NULL VARCHAR2(16) 
		USERNAME  NOT NULL VARCHAR2(20) 
		USERPHOTO          VARCHAR2(30) 
		REGDATE            DATE
		 */		
		
		String sql01 = "insert into memberinfo (userid, userpw, username, userphoto) values (?,?,?,null)";
		//String sql01 = "insert into memberinfo (idx, userid, userpw, username, userphoto) values (memberinfo_idx.nextval,?,?,?,null)";
		pstmt = conn.prepareStatement(sql01);
		
		pstmt.setString(1, regData.getUserid());
		pstmt.setString(2, regData.getUserpw());
		pstmt.setString(3, regData.getUsername());

		resultCnt = pstmt.executeUpdate();
		
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} finally {
		//4. 데이터 연결 종료
		pstmt.close();
		conn.close();	
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입결과</title>
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
	.form-signin input[type="button"] {
	  margin-bottom: 5px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
</style>
</head>

<body class="text-center">
<%-- <h1><%= resultCnt %>개의 행이 추가되었습니다</h1> --%>
	<!-- content start -->
	<form class="form-signin">	
		<img class="profile-img" src="../image/zootopia_1.jpg" alt="" width="72" height="72">
		<h4 class="mb-3 font-weight-normal"><%= resultCnt %>명의 회원님이 회원가입을 완료하였습니다.</h4>
		
		<label for="inputEmail" class="sr-only">이메일 주소(아이디)</label>
		<input type="email" value="${regData.userid}" class="form-control">
		
		<label for="inputPassword" class="sr-only">비밀번호</label>
		<input type="password" value="${regData.userpw}" class="form-control" >
		
		<label for="inputUsername" class="sr-only">이름</label>
		<input type="text" value="${regData.username}" class="form-control">
		
		<label class="sr-only">
			사진 
			<input type="file" name="uphoto" class="form-control">
		</label>
		
	   	<a href="<c:url value='/member/login.jsp'/>"><input type="button" value="로그인하기 " class="btn btn-lg btn-primary btn-block" ></a>
 		<a href="<c:url value='/'/>"><input type="button" value="홈으로 " class="btn btn-lg btn-primary btn-block" ></a>
 		
 		<p class="mt-5 mb-3 text-muted">&copy; 2019</p>	
	</form>
	<!-- content end -->		
</body>
</html>