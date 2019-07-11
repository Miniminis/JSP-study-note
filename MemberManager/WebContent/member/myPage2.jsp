<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//2-0. jdbcUrl
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	try {
		//1. 드라이버 로드 
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		//2. 데이터베이스 연결 
		conn = DriverManager.getConnection(jdbcUrl, "SCOTT", "tiger");
		
		//3. 데이터 조회 
		String sql = "select * from memberinfo";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="../static/default.css" rel="stylesheet" type="text/css">

<style>
	.mb-auto {
		margin-bottom: 50px!important;
	}
	.table {
		width: 100%;
		max-width: 330px;
		margin: 0 auto;
		color: #fff;
	}
	.profile-img {
		width: 150px;
		height: 150px;
		margin-bottom: 50px;
		border-radius: 100px;
		border: 10px solid #FAD02C;
	}
	
</style>
</head>
<body class="text-center">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">

		<!-- header start -->
		<%@ include file="../frame/header.jsp"%>
		<!-- header end -->
				
		<!-- content start -->
		<div id="content" role="main" class="inner cover">
		<%
			while(rs.next()) {
				if() {
					
				}
			}
		%>
			<img src="<c:url value='../image/zootopia_1.jpg'/>" class="profile-img"><br>
			<h3>내정보 보기</h3>
			<table class="table">
			    <tr>
			      <th scope="col">아이디</th>
			      <td>${sessionScope.LOGININFO.userid}</td>
			    </tr>
			    <tr>
			      <th scope="row">이름</th>
			      <td>${sessionScope.LOGININFO.username}</td>
			    </tr>
			    <tr>
			      <th scope="row">가입일</th>
			      <td>${sessionScope.LOGININFO.regDate}</td>
			    </tr>	 
			</table>
			<script>
				alert('로그인이 필요한 페이지입니다!');
				location.href="login.jsp";
			</script>
			<!-- content end -->
		</div>
	</div>
</body>
</html>

<%

	while(rs.next()) {
		if(rs.getString("userid").equals(userid) && rs.getString("userpw").equals(userpw)) {
			response.sendRedirect(""+request.getContextPath()+"/member/myPage2.jsp");
		} else {
			out.print("<script>alert('아이디 혹은 비밀번호가 틀립니다.'); history.go(-1);</script>");
		}
	}
	
	} catch(ClassNotFoundException ce) {
	ce.printStackTrace();
	} catch (SQLException se) {
	se.printStackTrace();
	} finally {
	//데이터베이스 연결 종료
	rs.close();
	stmt.close();
	conn.close();
	}
%>





<%-- <c:if test="${sessionScope.LOGININFO ne null}">
	<img src="<c:url value='../image/zootopia_1.jpg'/>" class="profile-img"><br>
	<h3>내정보 보기</h3>
	<table class="table">
	    <tr>
	      <th scope="col">아이디</th>
	      <td>${sessionScope.LOGININFO.userid}</td>
	    </tr>
	    <tr>
	      <th scope="row">이름</th>
	      <td>${sessionScope.LOGININFO.username}</td>
	    </tr>
	    <tr>
	      <th scope="row">가입일</th>
	      <td>${sessionScope.LOGININFO.regDate}</td>
	    </tr>	 
	</table>
</c:if>
<c:if test="${sessionScope.LOGININFO eq null}">
	<script>
		alert('로그인이 필요한 페이지입니다!');
		location.href="login.jsp";
	</script>
</c:if> --%>