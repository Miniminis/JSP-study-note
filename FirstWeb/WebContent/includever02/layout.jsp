<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

/*카테고리받기  */
String category = request.getParameter("category"); 

if(category==null) {
	category="1";

/* 방법 2: 아예 본 페이지에 대한 카테고리를 지정 */
/* category = 2; */
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

#mainwrap {
	margin: 20px auto;
	border: 1px solid black;
	width: 800px;
	padding: 10px;
	border: 1px solid black;
}

#wrap {
	overflow: hidden;
}

#wrap>div {
	float: left;
}

#menu {
	width: 200px;
	background-color: aqua;
}

#aside {
	width: 200px;
	height: 200px;
	background-color: pink;
}

#footer {
	border: 1px solid black;
}
</style>
</head>
<body>
	<div id="mainwrap">
		<div id="header">
			<h1>title</h1>
		</div>
		<div id="wrap">
			<div id="menu">
				<jsp:include page="menu.jsp">
					<jsp:param name="category" value="<%= category %>" />
				</jsp:include>
			</div>
			<div id="aside">사이드바</div>
		</div>
		<div id="footer">footer</div>
	</div>
</body>
</html>

<!-- 데이터 공유
1. 간단한 데이터: param으로 공유 
2. 데이터 양이 많을떄: setAttribute, getAttribute 이용 -->