<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String userid = request.getParameter("userid");
	String pw = request.getParameter("pw");
 	
	System.out.println(userid+":"+pw);

	String str = "";
	
	if (userid == null || pw == null) {		
		str = "N";
	} else if (userid.equals("admin")){
		str = "A";
	} else{
		//str = userid + "와" + pw+"는 사용가능합니다!";	
		str = "Y";
	}

	out.print(str);
%>

