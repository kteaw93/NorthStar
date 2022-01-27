<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bootStrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
</script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/5a7a3b1a34.js" crossorigin="anonymous"></script>

<!-- sweetalert : alert창을 꾸밀 수 있게 해주는 라이브러리 https://sweetalert.js.org/ -->
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Postcodify 오픈 소스 -->
<!-- https://www.poesis.org/postcodify/-->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<title>EHSHE</title>

<style>
	
.form-wrapper {
	margin: 50px 0px 120px 0px;
}	

	 
.title {
  font-size: 2rem; 
	font-weight:bold;
  text-align:center;
}

.title > a, .title > a:link{
 	text-decoration: none;
	color: #404040;
}

.hr {
	margin: auto; 
	width: 40%; 
	min-width: 350px; 
	text-align: center;
	border-top: 1px solid #e6e6e6; 
}

.form-container {
	margin: auto;
	height: 100%;
	max-width: 400px;
}

.form-control {
	height: 2.8rem !important;
	border-radius: 1rem !important;
}

/* 체크박스 css */
input[name="gender"] {
	display:none;
}

input[name="gender"] + label em { /* 인접요소 선택자 */
    display : inline-block;
    width:16px;
    height:16px;
    margin:0 5px 3px 0;
   
    vertical-align: middle;
}



label {
	font-size: 0.9rem !important;
	margin-top: 10px !important;
}

label > span {
	color:red;
}

#certifyBtn, #postcodify_search_button {
  height: 2.8rem !important;
  border: 1px solid #dbdbdb;
  border-radius: 1rem;
}

#certifyBtn:hover, #postcodify_search_button:hover {
	background-color: #dbdbdb !important;
}

.gender-radio {
	margin-top: 15px;
}

.signUpBtn-area {
	text-align: center;
}

.signUpBtn {
	border: none;
	width: 100%;
	height: 2.8rem;
	max-width: 350px;
	font-weight: 600;
	font-size: 15px;
	color: #191919;
	background-color: #f6f6f6;
	border-radius: 1rem;
}

.signUpBtn:hover {
	background-color : #dbdbdb;
}

.swal-button {
	background-color: #F5DF4D;
}

.swal-button:not([disabled]):hover {
	background-color: #f0d700;
}

.swal-button:focus {
	box-shadow: 0 0 0 3px #fff;
}

</style>
</head>
<body>
	<div class="form-wrapper">		
		<div class="title">
			<a href="${contextPath}/common/main">main으로</a>
		</div>

		<br>
		<div class="hr"></div>
			
		<br>
		<h5 style="text-align:center;">회원 정보 입력</h5>
		<div id="authKeyDiv"></div>
		<br>
		<%-- 회원 가입 form --%>
				<div class="form-container">
				<%-- 이메일 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberEmail">이메일(인증) <span>*</span></label>
					</div>
					<div class="col-md-7 mb-2">
						<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일 주소 입력" autocomplete="off" required>
					</div>
					<%-- 인증 버튼 --%>
					<button type="button" class="btn" id="memberEmailCk">&nbsp;인증&nbsp;</button>			
					<div class="col-md-9 offset-md-3">
						<span id="checkEmail">&nbsp;</span>
					</div>
				</div>
					
				<%-- 이메일 인증 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="certify">이메일 인증 번호<span>*</span></label>
					</div>
					<div class="col-md-7 mb-2">
						<input type="text" class="form-control" id="authKeyCheck" name="authKeyCheck" placeholder="인증번호를 입력해주세요." autocomplete="off" required>
					</div>
					<div class="col-md-9 offset-md-3">
						<span id="certificationCheck">&nbsp;</span>
					</div>
				</div>
				
								
				<%-- 아이디 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberId">닉네임 <span>*</span></label>
					</div>
					<div class="col-md-7 mb-2" id ="nickArea">
						<input type="text" class="form-control" name="memberNick" id="memberNick" placeholder="닉네임을 입력해주세요." autocomplete="off" required>
					</div>
					<button type="button" class="btn" id="memberNickCk">중복</button>			
				</div>

				<%-- 비밀번호 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberPw1">비밀번호  <span>*</span></label>
					</div>
					<div class="col-md-9 mb-2">
						<input type="password" class="form-control" id="memberPw1" name="memberPw" placeholder="비밀번호를 입력해주세요." required>
					</div>

				</div>

				<%-- 비밀번호 확인 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberPw2"></label>
					</div>
					<div class="col-md-9 mb-2">
						<input type="password" class="form-control" id="memberPw2" placeholder="비밀번호 재입력" required>
					</div>

					<div class="col-md-9 offset-md-3">
						<span id="checkPw">&nbsp;</span>
					</div>
				</div>

				<%-- 이름 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberNm">이름 <span>*</span></label>
					</div>
					<div class="col-md-9 mb-2">
						<input type="text" class="form-control" id="memberNm" name="memberNm" placeholder="이름을 입력해주세요." required>
					</div>

					<div class="col-md-9 offset-md-3">
						<span id="checkNm">&nbsp;</span>
					</div>
				</div>

				<%-- 휴대번호 --%>
				<div class="row mb-2 form-row">
					<div class="col-md-3">
						<label for="memberPhone">휴대번호 <span>*</span></label>
					</div>
					<div class="col-md-9 mb-2">
						<input type="text" class="form-control phone" id="memberPhone" name="memberPhone" placeholder=" - 없이 입력해주세요." maxlength="11" required>
					</div>
					<div class="col-md-9 offset-md-3">
						<span id="checkPhone">&nbsp;</span>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3">
						<label>등급 <span>*</span></label>
					</div>
					
					<br>	
					<div class="form-control phone"> 
						<select name="job"  name="memberGrade" id="memberGrade" >
						    <option value="">성별 선택</option>
						    <option value="G">일반</option>
						    <option value="B">판매자</option>
						</select>					
					</div>
						
<!-- 						<input class="gender-radio" type="radio" name="memberGrade" id="memberGrade" value ='B' checked>
						<label for="female">
							<em> 일반 </em>
						</label>
					</div>
					<div class="form-check">
						<input class="gender-radio" type="radio" name="memberGrade" id="memberGrade"  value='G'>
						<label for="male">
							<em> 판매자 </em>
						</label>
					</div> -->

				<br>
			</div>
			
			<div class="hr"></div>

			<br>
			<div class="signUpBtn-area">
				<button class="btn btn-lg signUpBtn" type="submit" id="memberSubmit">가입하기</button>
			</div>
	</div>

<script>

$(document).ready(function(){

	/*이메일 인증  */
	$("#memberEmailCk").click(function(){
		
		
		  $.ajax({
				url:"memberEmailCk",
				type:"post",
				data:{ 
					memberId :  $("#memberEmail").val()
					
				},
				success:function(data){
					console.log(data);
					if(data === "0"){
						alert("이미가입된 이메일입니다 확인 해주세요");
					}else{
					var temp = " ";
					temp += "<input type='hidden' id='authKeyInput' value='"+data+"'> ";					
					$("#authKeyDiv").empty().append(temp);
					}
				},
				error :function(){
					
				}
		
		  }) 
		
	})
	
	
	/*member e  */
	$("#memberNickCk").click(function(){
	
	  $.ajax({
			url:"memberNickCk",
			type:"post",
			data:{ 
				memberNick :  $("#memberNick").val()
				
			},
			success:function(data){
				if(data ==="1"){
					alert("중복된 닉네임입니다");
					var temp = " ";
					temp += "<input type='text' class='form-control' name='memberNick' id='memberNick' placeholder='닉네임을 입력해주세요.' autocomplete='off' required> ";
					
					$("#nickArea").empty().append(temp);
				}else{

					alert("사용가능한 닉네임입니다");
				}
				
			},
			error :function(){
				
			}
	
	  }) 
	
})

$("#memberSubmit").click(function(){
	
	var memberEmail = $("#memberEmail").val();
	var authKeyCheck = $("#authKeyCheck").val();
	var authKeyInput = $("#authKeyInput").val();
	var memberNick = $("#memberNick").val();
	var memberNm = $("#memberNm").val();
	var memberPhone = $("#memberPhone").val();
	var memberGrade = $("#memberGrade").val();
	var memberPw1 = $("#memberPw1").val();
	var memberPw2 = $("#memberPw2").val();
	
	if(memberPw1 != memberPw2){
		
	}
/* 	
	if(memberNm == ""){
		alert("asdasd");
		focus();
	}else{
		alert(' 이건되나')
	} */

	$.ajax({
		url:"memberSubmit",
		type:"post",
		data:{ 
			 memberEmail : $("#memberEmail").val(),
			 memberNick : $("#memberNick").val(),
			 memberNm : $("#memberNm").val(),
			 memberPhone : $("#memberPhone").val(),
			 memberGrade : $("#memberGrade").val(),
			 memberPw1 : $("#memberPw1").val()
			
		},
		success:function(data){
			if(data === 1){
			alert("가입완료");
			location.href="${contextPath}/common/main";
			}	
				
			
		},
		error :function(){
			
		}

  }) 
  
  
	
})


})
</script>

	<%-- footer --%>
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
