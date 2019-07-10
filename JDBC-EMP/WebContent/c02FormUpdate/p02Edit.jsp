<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 한글 인코딩 
	request.setCharacterEncoding("utf-8");

	//2. form.jsp 로부터 파라미터(name 값) 통해 입력값 받기 
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	
	//2-1. 데이터베이스에서 자료형 타입에 맞게 사용하기 위해 사원번호 int 형으로 변환! 
	int eno = Integer.parseInt(empno);
	//예외 처리: 
	//a. form.jsp 에서 null 값 입력 방지를 위해 required 설정
	//b. 숫자형 데이터 입력을 위해 input type="number" 처리 
	
	//4-0. 연결을 위해 필요한 객체들 생성 및 초기화 
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	
	//jdbcUrl
	String jdbcUrl="jdbc:oracle:thin:@localhost:1521:orcl";
	
	try {
		//3. jdbc 드라이버 로드 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//4. 데이터베이스 연결 - Connection
		conn = DriverManager.getConnection(jdbcUrl, "SCOTT", "tiger");
		
		//5. 데이터 읽거나 쓰기 - statement 
		//5-1. 실행하고자 하는 sql 문 작성, preparedStatmenet 객체 생성
		String sql = "update emp set ename=? where empno=?";
		pstmt = conn.prepareStatement(sql);
		
		//5-2. pstmt 를 통해 사용자로부터 입력받는 데이터를 데이터베이스에 삽입 
		pstmt.setString(1, ename);
		pstmt.setInt(2, eno);
		
		//5-3. 5-2의 실행 결과를 받음 
		resultCnt = pstmt.executeUpdate();
		
	} catch(ClassNotFoundException ce) {
		ce.printStackTrace();
	} catch(SQLException se) {
		se.printStackTrace();
	} finally {
		//7. 데이터베이스 연결종료 - close();
		if(pstmt != null) {
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
	}
	
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
	
	<!-- 6. 데이터 처리 결과 - resultset or resultCnt -->
	<h1>사원이름 수정 결과</h1>
	<h3><%= resultCnt %>개의 행이 수정되었습니다.</h3>

</body>
</html>