<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="application" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/5a7a3b1a34.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>Header</title>
</head>

 
<body>
	<header>
		<nav>
			<div class="logo_area">
				<a href="${contextPath}/common/main"> main으로 이동하기 </a>
			</div>
			<ul class="menu_area">
				<li><a href="${contextPath}/place/placeMain">1</a></li>
				<li id="shop_category"><a href="${contextPath}/board/boardList">게시판</a>
					<ul class=plus_menu_area>
						<li><a href="${contextPath}/shop/shopList/1">게시판(종합)</a></li>
						<li><a href="${contextPath}/shop/shopList/2">1-2</a></li>
						<li><a href="${contextPath}/shop/shopList/3">1-3</a></li>
					</ul></li>
				<li><a href="${contextPath}/board/boardList">2</a></li>
			</ul>
			<div class="login_area" id="sessoinArea"></div>
		</nav>
	</header>
	<script>
		$(document)
				.ready(
						function() {
							var sessionId = "${memberSessionId}";
							var temp = " ";
							if (sessionId === "") {
								temp += '<span><a href="${contextPath}/member/loginView">로그인</a></span>';
							} else {
								temp += '<span><a href="#" id="logout">로그아웃</a></span>';
							}
							$("#sessoinArea").empty().append(temp);

						})
		$(document).ready(function() {

			/*이메일 인증  */
			$("#logout").click(function() {

				$.ajax({
					url : "${contextPath}/member/logout",
					type : "post",
					data : {

					},
					success : function(data) {
						location.href="${contextPath}/common/main";
					},
					error : function() {

					}

				})

			})

		})
	</script>
</body>
</html>