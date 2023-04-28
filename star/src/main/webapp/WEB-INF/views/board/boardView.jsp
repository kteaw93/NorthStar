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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/board/boardView.css">


</head>

<style>
.markerImg {
	width: 148px;
	height: 85px;
} 

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>

<body>
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid" id="boardMain">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12 h-boardView">
							<img src="${contextPath}${firstFilePath}/${firstFileName}">
							<div class="h-textArea">
								<h3>${board.boardTitle}</h3>
								<h5>${board.categoryName}</h5>
								<c:set var="loca" value="${fn:split(board.location,',')[1]}" />
								<h4>${fn:split(loca,' ')[0]} ${fn:split(loca,' ')[1]}</h4>
								
								<div class="iLike">
								<c:if test="${(!empty loginMember ) && (board.memberNo != loginMember.memberNo)}">
			       			<c:choose>
			            <c:when test="${likeFl == 0 }">
			               <img src="${contextPath}/resources/pImages/h2.png" class="like">
			               <br>
			     					<span id="likeFl">좋아요 하기</span>
			            </c:when>
			         
			            <c:otherwise>
			              <img src="${contextPath}/resources/pImages/h1.png" class="like">
			              <br>
			     					<span id="likeFl">좋아요 취소</span>
			            </c:otherwise>
			         </c:choose>
							</c:if>
							</div>
							
							</div>
					</div>
				</div>
							

				


				<div class="row subInfoArea">
					<div class="col-md-12 subInfo">
						
					
						<span>작성자 : ${fn:substring(board.memberId,0,2)}****</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
						<fmt:formatDate var="createDate" value="${board.boardCreateDate }"
							pattern="yyyy-MM-dd" />
						<span>작성일 : ${createDate}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
					</div>
				</div>


				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="content-area">
						<% pageContext.setAttribute("newLine", "\n"); %>
						${fn:replace(board.boardContent, newLine, "<br>")}
						</div>
						<div class="map_wrap">
							<div id="map"
								style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
							<div class="hAddr">
								<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
							</div>
						</div>
					</div>

					<div class="col-md-1"></div>
				</div>

				<div class="row">
					<div class="col-md-12 btnBox">
						<div class="">

							<c:if test="${empty sessionScope.returnListURL}">
								<c:set var="returnListURL" value="../board/boardList" scope="session" />
							</c:if>
							<a class="btn ehsheYellow"
								href="${sessionScope.returnListURL}">목록으로</a>					
							<!-- href="../board/boardList">목록으로</a> -->

							<c:url var="updateUrl" value="${board.boardNo}/update" />

							<!-- 로그인된 회원이 글 작성자인 경우 -->
							<c:if
								test="${(loginMember != null) && (board.memberNo == loginMember.memberNo)}">
								<button id="deleteBtn" class="btn ehsheYellow">삭제</button>
								<a href="${updateUrl}" class="btn ehsheYellow ml-1 mr-1">수정</a>
							</c:if>

						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 replyArea">
						<jsp:include page="reply.jsp"/>
					</div>
				</div>
				
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>   

	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8adb912f319f193a5fe45f741e8466c&libraries=services"></script>
	<script>

   </script>



</body>
</html>