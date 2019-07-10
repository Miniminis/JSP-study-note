<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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

	<h1>EMP LIST</h1>
	<hr>
	<table>
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>사원직급</td>
		</tr>
		
		<%
		//3. 데이터베이스 안의 데이터를 읽거나 쓰기 - statement 객체를 통해!
		
		//3-1. 사원 리스트를 구하기 위한 sql 문 작성
		String sql = "select * from emp order by ename";
		
		//3-2. statement 객체 생성 
		stmt = conn.createStatement();
		
		//3-3. select sql 문의 결과 받기 - resultset 객체를 통해서! 
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			do {%>
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><a href="p04viewEMP.jsp?empno=<%= rs.getInt(1)%>"><%= rs.getString(2) %></a></td>
				<td><%= rs.getString(3) %></td>
			</tr>
		<%} while(rs.next()); 
		}		
		%>
	</table>
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
