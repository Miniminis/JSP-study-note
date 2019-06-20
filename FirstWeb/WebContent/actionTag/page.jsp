<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--@ page.jsp 의 용도: 응답페이지 컨트롤 A or B or C @-->
<%
	/* 각각의 input tag의 name 값을 통해 전달받은 parameters들을 
	String 변수에 담아준다.*/
	String pType = request.getParameter("type");
	String no = request.getParameter("no"); //no: 숫자, String no: 문자열 
	String username = request.getParameter("username");

	/* java.lang.NullPointerException 예방
	- 파라미터의 이름이 제대로 전달되지 않은 경우, 
	- pType == null이 되므로 */
	if (pType == null) {
		pType = "a";
	}
	if (no == null) {
		no = "0";
	}
	if (username == null) {
		username = "username";
	}

	/* page value에 따라 분기처리  */
	if (pType.equals("a")) {
%>

<jsp:forward page="a.jsp">
	<jsp:param value="<%=no%>" name="NO" />
	<jsp:param value="<%=username%>" name="USERNAME" />
</jsp:forward>
<%
	} else if (pType.equals("b")) {
%>
<jsp:forward page="b.jsp">
	<jsp:param value="<%=no%>" name="NO" />
	<jsp:param value="<%=username%>" name="USERNAME" />
</jsp:forward><%
	} else {
%>
<jsp:forward page="c.jsp">
	<jsp:param value="<%=no%>" name="NO" />
	<jsp:param value="<%=username%>" name="USERNAME" />
</jsp:forward><%
	}
%>