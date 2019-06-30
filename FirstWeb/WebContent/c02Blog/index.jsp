<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- container start -->
	<div id="container">
		<!-- header start -->
		<%@ include file="frame/header.jsp"%>
		<!-- header end -->

		<!-- navbar start -->
		<%@ include file="frame/navbar.jsp"%>
		<!-- navbar end-->

		<!-- content start -->
		<div id="content">
			<!-- main-content start -->
			<div id="main-content">
				<h2>HTML5 개요와 활용</h2>
				<p>2019년 6월 4일</p>
				<img src="../image/zootopia_1.jpg">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Nulla maiores, aliquid saepe dolore suscipit iusto fugit dolores,
					magnam enim ipsa qui expedita delectus totam sapiente dolorum vel,
					modi culpa quisquam praesentium! Doloremque ab, eaque earum eveniet
					laudantium laboriosam repellendus error molestiae. Beatae similique
					ratione porro veniam unde eum incidunt, voluptatibus cupiditate,
					recusandae vero voluptate magnam ipsam assumenda numquam vitae
					dolor nobis eligendi dolorum deleniti voluptatem repellat magni?
					Similique fugiat suscipit, consectetur illo maiores, atque
					laboriosam numquam recusandae. Laboriosam beatae eum animi quia!
					Cumque vero, doloremque eius ullam corrupti. Molestias quia quis
					repellendus ipsum deleniti eveniet nam id fugit excepturi aut.</p>
				<hr>
				<h2>HTML5 응용과 실습</h2>
				<p>2019년 6월 4일</p>
				<img src="../image/zootopia_2.jpg">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Nulla maiores, aliquid saepe dolore suscipit iusto fugit dolores,
					magnam enim ipsa qui expedita delectus totam sapiente dolorum vel,
					modi culpa quisquam praesentium! Doloremque ab, eaque earum eveniet
					laudantium laboriosam repellendus error molestiae. Beatae similique
					ratione porro veniam unde eum incidunt, voluptatibus cupiditate,
					recusandae vero voluptate magnam ipsam assumenda numquam vitae
					dolor nobis eligendi dolorum deleniti voluptatem repellat magni?
					Similique fugiat suscipit, consectetur illo maiores, atque
					laboriosam numquam recusandae. Laboriosam beatae eum animi quia!
					Cumque vero, doloremque eius ullam corrupti. Molestias quia quis
					repellendus ipsum deleniti eveniet nam id fugit excepturi aut.</p>
			</div>
			<!-- main-content end -->

			<!-- asidebar start-->
			<%@ include file="frame/asidebar.jsp"%>
			<!-- aside end -->

		</div>
		<!-- content end -->

		<!-- footer start  -->
		<%@ include file="frame/footer.jsp"%>
		<!-- footer end -->
	</div>
	<!-- container end -->
</body>
</html>