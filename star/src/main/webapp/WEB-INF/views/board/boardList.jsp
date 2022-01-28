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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardList.css">


</head>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid boardMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">

				</div>
				<div class="row myPlace">

<!-- 						<h5>존재하는 게시글이 없습니다.</h5> -->

							<div class="col-md-3">
								<div class="row"  id="boardArea">
									<div class="card">

									</div>
								</div>
							</div>
				</div>

				<div class="row">
					<div class="col-md-12 insert-btn">
							<a class="btn ehsheYellow float-right writeBtn" 
								href="${contextPath}/board/insertBoard">글쓰기</a>
					</div>
				</div>
				
				<%-- ----------------------------페이지 네이션 --------------------------------- --%>
				<div class="row">
					<div class="col-md-12">
					
						<div class="pagination-area">
							<ul class="pagination">
								<%-- 주소 조합 작업 --%>
								
								<c:choose>
									<%-- 검색이 된 경우  --%>
									<c:when test="${!empty sv }">
									
									<%-- 검색이 된 내용이 있다면  --%>
										<c:if test="${!empty sv }">
											<c:set var="searchStr" value="sk=${sk }&sv=${sv }"/>
										</c:if>
										
										<c:url var="pageUrl" value="search?${searchStr }&"/>
										<c:set var="returnListURL" 
												value="${contextPath}/board/${pageUrl}cp=${pInfo.currentPage}"
												scope="session"/>
									</c:when>
									
									<%-- 검색이 되지 않은 경우  --%>
									<c:otherwise>
										<c:url var="pageUrl" value="?"/>
											<c:set var="returnListURL" 
												value="${contextPath}/board/boardList${pageUrl}cp=${pInfo.currentPage}"
												scope="session"/>
									</c:otherwise>
								</c:choose>
	
								<!-- 화살표에 들어갈 주소를 변수로 생성 -->
								<c:set var="firstPage" value="${pageUrl}cp=1" />
								<c:set var="lastPage" value="${pageUrl}cp=${pInfo.maxPage}" />

								<fmt:parseNumber var="c1"
									value="${(pInfo.currentPage - 1) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="prev" value="${ c1 * 10 }"
									integerOnly="true" />
								<c:set var="prevPage" value="${pageUrl}cp=${prev}" />

								<fmt:parseNumber var="c2"
									value="${(pInfo.currentPage + 9) / 10 }" integerOnly="true" />
								<fmt:parseNumber var="next" value="${ c2 * 10 + 1 }"
									integerOnly="true" />
								<c:set var="nextPage" value="${pageUrl}cp=${next}" />

								<c:if test="${pInfo.currentPage > pInfo.pageSize}">
									<li><a class="page-link" href="${firstPage}">&lt;&lt;</a></li>

									<li><a class="page-link" href="${prevPage}">&lt;</a></li>
								</c:if>

								<!-- 페이지 목록 -->
								<c:forEach var="page" begin="${pInfo.startPage}"
									end="${pInfo.endPage}">
									<c:choose>
										<c:when test="${pInfo.currentPage == page }">
											<li><a class="page-link ehsheYellow" id="white">${page}</a></li>
										</c:when>

										<c:otherwise>
											<li><a class="page-link" href="${pageUrl}cp=${page}">${page}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${next <= pInfo.maxPage}">
									<li><a class="page-link" href="${nextPage }">&gt;</a></li>

									<li><a class="page-link" href="${lastPage }">&gt;&gt;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					
				</div>
				<div class="row">
					<div class="col-md-12">
						<form action="search" class="form-inline selectBox">
							<select class="form-control mr-sm-2 search-bottom"  name="sk" type="text">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="category">카테고리</option>
								<option value="location">위치</option>
							</select> <input id="search-input" class="form-control mr-sm-2" name="sv"
								type="text" />
							<button class="btn ehsheYellow my-2 my-sm-0">
								검색</button>
						</form>
					</div>
				</div>
				
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
	

	<script>
	
	$(document).ready(function(){
	
		$.ajax({
			url:"boardArea",
			type:"post",
			data: { 
				
			},
			success:function(data){
				var temp = "";
				$.each(data, function(index,item){
					temp += '<div><div class="card-block">'+
					'<input class="card-title" value="'+item.WRITE_NUM+'"></input>'+
					 	'<input class="card-writer" value="'+item.WRITE_TITLE+'"></input>'+
				      '<input class="card-writer" value="'+item.WRITE_MAX_PRICE+'"></input><br>'+
				      '<input class="card-writer" value="'+item.HB_CATEGORY_NM+'"></input>'+
				      '<input class="card-writer" value="'+item.HB_CATEGORY_NM+'"></input>'+
				      '</div></div><br><br>'; 
				}) 

			     $("#boardArea").empty().append(temp);
			},
			error: function(){
				
			}
		
		})
		
	})
	
	
	</script>




</body>
</html>