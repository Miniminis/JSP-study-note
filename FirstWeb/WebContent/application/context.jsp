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
	<%
		/* pageContext.getRequest() : httpservletrequest 보다 상위에 저장이 되어있기 때문에 형변환 필요  */
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
	%>
	<!--pageContext.getRequest() - 해당 매서드를 통해 받는 request 값과 내장객체의 request 값이 같은지 확인하는 작업!  -->
	<%=request == req%>
	<br>
	<%
		/* pageContext.getOut()의 매서드가 out 내장객체와 같음을 확인하는 작업 */
		out.print(123 + "<br>");
		pageContext.getOut().print("같은 객체를 사용합니다. ");
	%>

</body>
</html>