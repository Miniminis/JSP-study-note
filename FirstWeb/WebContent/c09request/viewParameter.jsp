<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
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

	<h1>요청 파라미터 출력</h1>
	<h3>request.getParameter() 이용</h3>
	<ul>
		<li>name parameter: <%=request.getParameter("name")%></li>
		<li>address parameter: <%=request.getParameter("address")%></li>
		<li>pet parameter: <%=request.getParameter("pet")%></li>
		<!-- 같은 name을 가진 여러개의 파라미터를 받을 때 getParameter()를 쓰게되면 배열의 가장 첫번쨰 값만 전달된다.  -->
	</ul>

	<h3>request.getParameterValues() 이용</h3>
	<%
		String[] values = request.getParameterValues("pet");
		/*체크된 값이 없다면 --> null, 배열요소가 0개 이상일때만 반복문 실행  */
		if (values != null && values.length > 0) {
	%>
	<ul>
		<%
			for (int i = 0; i < values.length; i++) {
		%>
		<li><%=values[i]%></li>
		<%
			}
		%>
	</ul>
	<%
		}
	%>

	<h3>request.getParameterNames() 이용</h3> 
	<%
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()) {

			String pName = (String) params.nextElement();
			/* object type String 으로 형변환 */
	%>
	<%=pName%>

	<%
		}
	%><br>

	<h3>request.getParameterMap(): String[] 형태로 저장됨</h3>
	<%
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[]) parameterMap.get("pet");
		if (nameParam != null) {
	%>
	name =
	<%=nameParam[0]%>
	<%
		}
	%>

</body>
</html>