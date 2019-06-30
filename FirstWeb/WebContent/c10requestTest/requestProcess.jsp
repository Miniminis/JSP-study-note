<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="default.css" rel="stylesheet" type="text/css">
<style></style>
</head>
<body>
	<!-- form으로부터 전달받은 parameter를 String 변수에 담아서 사용  -->
	<%  
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
		String[] jobValues = request.getParameterValues("job");
		String[] intValues = request.getParameterValues("interest");
	%>

	<div id="container">
		<h2>requestForm 으로부터 전달받은 값</h2>
		<hr>
		<table>
			<tr>
				<td>이름</td>
				<td><%=name%></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><%if (jobValues != null && jobValues.length > 0) {
				for (int i = 0; i < jobValues.length; i++) {
					out.print(jobValues[i] + "\t");
				}
			}%></td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>
					<%
						if (intValues != null && intValues.length > 0) {
							for (int i = 0; i < intValues.length; i++) {
								out.print(intValues[i] + "\t");
							}
						}
					%>
				</td>
			</tr>
			<tr></tr>
		</table>
	</div>
</body>
<h3></h3>
<br>
</html>