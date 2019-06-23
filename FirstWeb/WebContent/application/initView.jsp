<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<h1>
		<!-- 원래코드를 수정하고 다시 컴파일하지 않고 web.xml 파일만 수정하여 사용할 수 있도록  -->
		<%=application.getInitParameter("logEnabled")%><br>
		<!--결과: false  -->
		<%=application.getInitParameter("debugLevel1")%><br>
		<!--10  -->

		<%
			Enumeration initparams = application.getInitParameterNames();

			while (initparams.hasMoreElements()) {
				out.print(initparams.nextElement() + "<br>");
				/*print: object 매개변수를 대입해도 toString 매서드 같이 호출하여 string type으로 출력됨
				- 하지만 만약 string XXX 참조변수에 넣어서 사용하고 싶다면: (String) 타입으로 형변환하여 사용하여야 한다. */
			}
		%>

		<!-- logEnabled
				debugLevel1 -->
	</h1>
</body>
</html>