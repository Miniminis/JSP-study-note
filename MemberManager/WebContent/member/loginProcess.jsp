<%@page import="member.MemberInfo"%>
<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- request로 form 값을 전달받기 전에   -->
<%
	//한글값 처리를 위한 encoding 과정
	request.setCharacterEncoding("utf-8");

	//로그인 폼에서 사용자 입력정보 받아오기
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	//String autologin = request.getParameter("autologin");
	
	//boolean loginChk = false;	로그인 되면 바로 마이페이지로 보내기 때문에 불필요!
	
	//1. 사용자가 입력한 id로 회원 정보 검색 --> null값이면 if문 아예 시작 안하므로 loginChk = false
	MemberInfo memberInfo = (MemberInfo)application.getAttribute(userid);
	
	//2. 존재한다: 해당 객체를 받는다. `
			//해당 객체의 pw와 사용자가 입력한 pw를 비교 `
			//같다면 - 로그인 처리 : session에 회원정보를 저장
			//다르다 - 오류 메시지전달 --> 로그인 페이지로 이동 
	if(memberInfo != null && memberInfo.getUserpw().equals(userpw)) {
		//존재한다! && 비번이 일치한다!
		session.setAttribute("LOGININFO", memberInfo.toLoginInfo());
		
		//로그인 처리 후, 바로 메인페이지로 이동!
		response.sendRedirect(""+request.getContextPath()+"/member/myPage2.jsp");
		//loginChk = true;
	} else {
		//3. 존재하지 않는다: 오류메시지 전달 --> 로그인 페이지로 이동
		//memberInfo != null or 비밀번호가 다른 경우! 
				
		out.print("<script>alert('아이디 혹은 비밀번호가 틀립니다.'); history.go(-1);</script>");
	}
%>
<%-- <jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session" />
<jsp:setProperty property="*" name="loginInfo" /> --%>
