<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--1. id, pw 데이터 받아오기
2. id와 pw 가 같은지 인증하기
3. 세션에 사용자 데이터 저장: 속성을 이요해서 데이터 저장 
4. 응답처리: 로그인 되었습니다 or 로그인 실패! (이전 페이지 이동)   -->
<%
	//사용자 요청을 받아올때 한글 처리를 위한 encoding 과정
	request.setCharacterEncoding("utf-8"); 
	
	//사용자 데이터 가져오기: id, pw
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//로그인 성공 여부 확인을 위한 boolean 변수 
	boolean loginChk = false;
	
	//아이디와 비밀번호 로그인 확인
	if (id != null && id.equals(pw)) {
		//session.setAttribute("LOGIN", "SUCCESS");
		//session.setAttribute("ID", id);
		
		LoginInfo loginfo = new LoginInfo(id);
		session.setAttribute("LOGININFO", loginfo);
		
		loginChk = true;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<%
		if(loginChk) {
			out.println(id+" 님 환영합니다!");
			
			//페이지 이동 방법1) a 태그로 링크 잡기
			out.print("<a href=\"loginCheck.jsp\">로그인 확인</a>");
			out.print("<a href=\"logout.jsp\">로그아웃</a>");
			
			//페이지 이동 방법 2) <script> 내부의 location 객체 사용! 
			//out.println("<script>location.href=\"loginCheck.jsp\"</script>");
			//out.println("<script>location.href=\"logout.jsp\"</script>");
			
		} else {
			out.print("<script>alert('아이디 혹은 비밀번호를 확인해주세요!'); history.go(-1);</script>");
			//history.go(-1); 한단계 전으로 이동이지 로그인 페이지로 이동하는 것은 아니다! 
			//response.sendRedirect("loginForm.jsp"); //script에서 alert 메시지 팝업 띄우기 전에 바로 페이지가 이동해버림 
		}
	%>
</body>
</html>