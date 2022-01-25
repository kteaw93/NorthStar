<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>EHSHE</title>


</head>

<body>	

	<div class="form-wrapper">
		<div class="loginTitle">
			<a href="${contextPath}/common/main">Main으로 </a>
		</div>	
		
		<br>
		<div class="hr"></div>
	
		<br>
		<div class="form-container">
				<div class="form-group">
					<input type="text" id="memberId" name="memberId"  class="form-control" placeholder="아이디를 입력해주세요."
								 value="${cookie.saveId.value}" required autofocus> 
				</div>	
				<div class="form-group">
					<input type="password" id="memberPw" name="memberPw" class="form-control" placeholder="비밀번호를 입력해주세요." required> 
				</div>

				<br>			
				<button class="btn btn-block loginBtn" id="loginBtn">로그인</button>			

			
			<br>		
			<div class="info-user">
				<ul class="list-user">
					<li>
						<a href="findIdView">아이디 찾기</a>									
					</li>
					<li>ㅣ</li>
					<li>
						<a href="findPwView">비밀번호 찾기</a>
					</li>
					<li>ㅣ</li>
					<li>
						<a href="tosView">회원가입</a>
					</li>
				</ul>								
			</div>			
		</div> 
		

		<br>

	</div> 
	

	<jsp:include page="../common/footer.jsp" />			

  <script>

  $( document ).ready(function() {
	  $("#loginBtn").click(function(){
		  var k = $("#memberId").val();
		  var k1 = $("#memberPw").val();
		  
		  console.log(k);
		  console.log(k1);
		   $.ajax({
				url:"loginCk",
				type:"post",
				data:{ 
					memberId :  $("#memberId").val(),
					memberPw :  $("#memberPw").val()	
				},
				success:function(data){
					console.log(data);
					if(data === 1){
						alert("로그인성공");
						
					}else{
						alert("로그인실패");
					}
				},
				error :function(){
					
				}
		
		  }) 
		  
		})
});
  
</script>
</body>
</html>

