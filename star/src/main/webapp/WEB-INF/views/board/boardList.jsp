<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>나만의 장소</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">


</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid boardMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row"></div>
				<div class="row myPlace">

					<table border="1" width="50%" height="200" cellspacing="5">
						<thead>
							<tr align="center" bgcolor="white">
								<th>게시글번호</th>
								<th>제목</th>
								<th>금액</th>
								<th>카테고리</th>
							</tr>
						</thead>

						<tbody  align="center" bgcolor="white" id="boardArea">

						</tbody>
					</table>

					<div class="row">
						<div class="col-md-12 insert-btn">
							<a class="btn ehsheYellow float-right writeBtn"
								href="${contextPath}/board/insertBoard">글쓰기</a>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">

							<div class="pagination-area">
								<ul class="pagination">
								</ul>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-md-12">
							<form action="search" class="form-inline selectBox">
								<select class="form-control mr-sm-2 search-bottom" name="sk"
									type="text">
									<option value="all">전체</option>
									<option value="title">제목</option>
									<option value="category">카테고리</option>
									<option value="location">위치</option>
								</select> <input id="search-input" class="form-control mr-sm-2" name="sv"
									type="text" />
								<button class="btn ehsheYellow my-2 my-sm-0">검색</button>
							</form>
						</div>
					</div>

				</div>
				<div class="col-md-2"></div>
			</div>
		</div>

		<jsp:include page="../common/footer.jsp" />

		<script>
			$(document).ready(function() {
				$.ajax({
						url : "boardArea",
						type : "post",
						dataType : "json",
						success : function(data) {
							ajaxData(data);
						},
						error : function() {

						}

					})

		function ajaxData(data) {
					var temp = "";
					$.each(data,function(index,item) {
						console.log(data)
						 temp += '<tr>'
								+ '<th>'+item.WRITE_NUM+'</th>'
								+ '<th><a href="${contextPath}/board/boardDetail?board_idx='+item.WRITE_NUM+'">'+item.WRITE_TITLE+'</a></th>'
								+ '<th>'+item.WRITE_MAX_PRICE+'</th>'
								+ '<th>'+item.HB_CATEGORY_NM+'</th>'
								+ '</tr>'; 
					})
		
					$("#boardArea").empty().append(temp);
		}
				
				
				})
		</script>
</body>
</html>