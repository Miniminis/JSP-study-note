<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="empinfo" class="member.MemberReg" scope="session"/>
<jsp:setProperty property="*" name="empinfo"/>


<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	
	//jdbcUrl 
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	try {
	//1. 드라이버 로드 --> web.xml 을 통해서 초기화 설정: JDBC 드라이버 로드 
	//Class.forName("oracle.jdbc.driver.OracleDriver");

	//2. 데이터베이스 연결 
	conn = DriverManager.getConnection(jdbcUrl, "SCOTT", "tiger");
	
	//3. 데이터 조회 및 변경 
	String sql = "insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) values(?, ?, ?, ?, ?, ?, ?, ?)";	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, empinfo.getEmpno());
	pstmt.setString(2, empinfo.getEname());
	pstmt.setString(3, empinfo.getJob());
	pstmt.setInt(4, empinfo.getMgr());
	pstmt.setString(5, empinfo.getHiredate());
	pstmt.setInt(6, empinfo.getSal());
	pstmt.setInt(7, empinfo.getComm());
	pstmt.setInt(8, empinfo.getDeptno());
	
	resultCnt = pstmt.executeUpdate();
	
	} //catch(ClassNotFoundException ce) {
		//ce.printStackTrace();
	//} 
	catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//5. 데이터베이스 연결 종료 
		if(pstmt!=null) {
			try {
				pstmt.close();
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
	};
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
<%-- <%= empinfo.getEmpno() %> --%>

	<!--//4. 결과 출력  -->
	<h1><%=resultCnt%>개의 행이 추가되었습니다. </h1>
	<a href="p04emplist.jsp">전체 사원리스트 확인하기</a>

</body>
</html>