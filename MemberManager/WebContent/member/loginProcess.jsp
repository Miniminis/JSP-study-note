<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberInfo"%>
<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	 
	
	
	//4. 쿼리문 실행 결과 rs 가 존재 && 해당 행의 패쓰워드 == 사용자가입력한 password 
	//- 로그인 세션에 해당 로그인 데이터 저장 
	//- mypage.jsp 로 페이지 redirect 
	//5. 해당 행의 패쓰워드 != 사용자가입력한 password : 로그인 정보를 확인해주세요! 알림팝업 + 로그인 페이지로 redirect 
	
	
	
	//한글값 처리를 위한 encoding 과정
	request.setCharacterEncoding("utf-8");
	
	//1. login.jsp 에서 name 값 통해 입력 정보들 파라미터 전달받기
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	

%>

<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//jdbcUrl
	String jdbcUrl = "jdbc:mysql://localhost:3306/testdb";
	//String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	try {
		
		//2-1. JDBC 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//2-2. DB 연결 
		conn = DriverManager.getConnection(jdbcUrl, "bit", "bit");
		//conn = DriverManager.getConnection(jdbcUrl, "SCOTT", "tiger");
		
		
		//3. sql 문 통해서 DB에서 사용자 아이디와 일치하는 행 가져오기 
		String sql = "select * from memberinfo where userid=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			if(rs.getString("userpw").equals(userpw)) {
				
				//가져온 데이터 memberinfo 객체에 저장 --> 세션에도 저장 
				MemberInfo memberinfo = new MemberInfo();
				memberinfo.setUserid(rs.getString(1));
				memberinfo.setUserpw(rs.getString(2));
				memberinfo.setUsername(rs.getString(3));
				memberinfo.setUphoto(rs.getString(4));
				
				session.setAttribute("LOGININFO", memberinfo.toLoginInfo());
				response.sendRedirect(""+request.getContextPath()+"/member/myPage2.jsp");
			
			} else {
				out.println("<script>alert('아이디 혹은 비밀번호가 틀립니다.'); history.go(-1);</script>");
			}
		}
		
	} catch(ClassNotFoundException ce) {
		ce.printStackTrace();
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//데이터베이스 연결 종료
		rs.close();
		pstmt.close();
		conn.close();
	} 
	
%>


