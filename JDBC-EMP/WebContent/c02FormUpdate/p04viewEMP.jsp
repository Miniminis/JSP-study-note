<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String empno = request.getParameter("empno");
	//int eno = Integer.parseInt(empno);

	//connection --> statement --> result 
	Connection conn=null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//jdbcUrl, userid, userpw 
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid = "SCOTT";
	String userpw = "tiger";
	
	try {
		
		//1. 드라이버 로드 
		Class.forName("oracle.jdbc.driver.OracleDriver");

		//2. 데이터베이스에 연결 
		conn = DriverManager.getConnection(jdbcUrl, userid, userpw);
	
%>
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

	<h1>EMP INFO</h1>
	<hr>

		<%
		//3. 데이터베이스 안의 데이터를 읽거나 쓰기 - statement 객체를 통해!
		
		//3-1. 특정 사원 정보만 표현하기 위한 sql 문 작성 
		//- empno 파라미터를 통해 특정 사원의 정보만 표현
		String sql = "select * from emp where empno="+empno;
		
		//3-2. statement 객체 생성 
		stmt = conn.createStatement();
		
		//3-3. select sql 문의 결과 받기 - resultset 객체를 통해서! 
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {%>
		
			<ul>
				<li>사원번호: <%= rs.getInt("empno") %></li>
				<li>사원이름: <%= rs.getString("ename") %></li>
				<li>담당직무: <%= rs.getString("job") %></li>
				<li>사원급여: <%= rs.getInt("sal") %></li>
			</ul>
			
		<%}; 		
		%>
		
		<a href="p04emplist.jsp">전체 사원목록 바로가기</a>
</body>
</html>

<%
	} catch(ClassNotFoundException ce) {
	ce.printStackTrace();
	} catch(SQLException se) {
	se.printStackTrace();
	} finally {
	//4. 데이터베이스 연결 종료 - close();
		if(rs != null) {
			try {
				rs.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
		if(stmt != null) {
			try {
				stmt.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
%>
