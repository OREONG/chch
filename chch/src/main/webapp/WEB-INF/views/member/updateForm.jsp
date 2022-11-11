<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/member_update.css");</style>
<script type="text/javascript">
	function backBtn() {
		location.href="main.do";
	}
</script>
<style type="text/css">
	.row-div{
		display: flex;
		flex-direction: row;
	}
</style>


<script type="text/javascript">
	//페이지 로딩 시 email input과 인증번호 전송 버튼 비활성화
	$(function(){
		$('#email').attr('readonly',true);
		$("#emailChk-button").hide();
		$("#emailChk-input").attr("disabled",true); 
		$("#emailChk-input").hide();
		$("#emailConfirm-button").hide();
		$("#emailChk-div").hide();
		
		//파일 선택을 div로 대체하기 위해 file input 숨김
		$(".real-upload").hide();
	});
	
	//다른 이메일로 전송 버튼 클릭 시 버튼 -> 인증번호 전송으로 변경, input 공백으로
	function anoEmail(){
		$('#email').css("border-color","#091b50");
		frm.email.value="";
		frm.email.focus();
		$("#anoEmail-btn").hide();
		$("#emailChk-button").show();
		$('#email').attr('readonly',false);
		
	}
	
	//이메일 '전송'버튼을 눌렀을 때 실행하는 메서드
	function emailChkShow() {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

 		if($('#email').val() == "") {
 			$('#email-msg').html('이메일을 입력해주세요');
			frm.email.focus(); 
			return false;
		} 
  		else if($('#email').val() != ""){
  			$('#email-msg').html('');
 	 		if(!regExp.test($('#email').val())){
 	 			$('#email-msg').html("이메일 형식으로 입력해주세요");
 				frm.email.focus(); 
 				return false;
 			}else {
 				$.post('emailChk.do', "email="+frm.email.value, function(data) {
 					var msg = data;
   					if(msg == ""){
		 				$('#email').css("border-color","#d5d5d5");
   						$("#emailChk-div").show();		
		 				$('#email').attr('readonly',true);
		 				$("#emailChk-button").attr("disabled",true); 
		 				$("#emailChk-input").attr("disabled",false); 
		 				$("#emailChk-input").show();
		 				$("#emailConfirm-button").show();
		 				alert("인증번호가 전송되었습니다");		
	 					frm.emailConfirm.focus();
	 					$('#emailChk-input').css("border-color","#091b50");
	 					
 					}else {
 						$('#email-msg').html(msg);
 						frm.email.focus(); 
 					}
 				});
 			};
 		};
	};	
	//이메일 인증번호 '확인'버튼을 눌렀을 때 실행하는 메서드
	function emailConfirmFun(){
			$.post('emailConfirm.do', "emailConfirm="+frm.emailConfirm.value, function(data) {
				if(data == 'y'){
					//이메일 입력 input
					$('#email').attr('readonly',true);
					$('#email').css("color","gray");
					$('#email').css("background-color","white");
					$('#email').hover(function (){
						$(this).css('border-color', "#d5d5d5");
					})
					//인증번호 전송 button
					$('#emailChk-button').attr('disabled',true);
					$('#emailChk-button').hover(function (){
						$(this).css("background-color","white");
					})
					
					//인증번호 확인 input
					$('#emailChk-input').attr('readonly',true);
					$('#emailChk-input').css("color","gray");
					$('#emailChk-input').hover(function (){
						$(this).css('border-color', "#d5d5d5");
					})
					//인증번호 확인 버튼
					$('#emailConfirm-button').attr('disabled',true);
					$('#emailConfirm-button').hover(function (){
						$(this).css("background-color","white");
					})
					
					$('#emailChk-msg').html("");
					
				}else if(data == 'n'){
					$('#emailChk-msg').html("인증번호가 일치하지 않습니다");
					frm.emailConfirm.focus();
					frm.emailConfirm.value="";
					return false;
				}
					
			});		
	};
</script>
</head>
<body>
<main>
	<div class="main-container">
	
		<div class="update-container">
		
			<form action="update.do" method="post"  name="frm" enctype="multipart/form-data" onsubmit="return chk()">
				
				<input type="hidden" name="id" value="${member.id }">
				
					<div>
					
				    <!-- 사진 -->
					<div id="img-wrap">
						<!-- input type="file"은 숨겨져서 보이지 않음 -->
						<input type="file" name="file"  id="file" class="real-upload" accept="image/*" >	
						<!-- type="file"대신 div가 보임 -->
						<div class="proImg" id="profileImg">
							<!-- 프로필 사진이 없을 경우 기본 프로필 사진 띄움 -->
							<c:if test="${member.fileName == null }">
								<img id="img" src="/chch/resources/images/memberImg/profileImg.png">
							</c:if>
							<!-- 프로필 사진이 있을 경우 db에서 불러옴 -->
							<c:if test="${member.fileName != null }">
								<img id="img" src="/chch/resources/images/memberImg/${member.fileName }">
							</c:if>
						</div>
						<!-- 카메라 이미지 div -->
						<div id="cameraImgDiv">
							<img id="cameraImg" alt="" src="/chch/resources/images/memberImg/camera1.png">
						</div>
					</div>
					<script type="text/javascript" src="/chch/resources/js/image.js"></script>
				
					<!-- 아이디 -->
					<div class="row-div2">
					<span class="item-text">아이디</span> 
					<div class="div1">
					</div>
						${member.id }
					</div>
					
					<!-- 이메일 -->
	            	<div class="row-div">
	            	<span class="item-text">이메일</span>
		            	<div class="div1">
			            	<input id="email" type="email" class="input3" name="email" required="required" class="form-control" value="${member.email }">
			            	<input type="button" class="btn" onclick="anoEmail()" id="anoEmail-btn" value="다른 이메일 인증"/>
			            	<input type="button" class="btn" name="emailSend" value="인증번호 전송" onclick="emailChkShow()" id="emailChk-button"/>
		            	</div>
	            	</div>
	            	
	            	<!-- 인증번호 -->
	            	<div class="row-div" id="emailChk-div">
	            		<span class="item-text">인증번호</span>
		            		<div class="div1">
			            	<input id="emailChk-input" type="text" class="input1" name="emailConfirm" required="required" class="form-control"/>
			            	<input type="button" class="btn" name="emailConfirmBtn" value="인증번호 확인" onclick="emailConfirmFun()" id="emailConfirm-button"/>
	            			<div id="emailChk-msg"></div>
	            			</div>
	            	</div>
	            	
	
	
					<!-- 이름 -->
					<div class="row-div">
					<span class="item-text">이름</span>
						<div class="div2">
						<input type="text" class="input2" name="name" value="${member.name }">
						</div>
					</div>
					
					<!-- 휴대폰 번호 -->
					<div class="row-div">
		            	<span class="item-text">휴대폰 번호</span>
							<div class="div2">
		                	<input type="tel" class="input2" name="phone" value="${member.phone }" pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{3,4}">
							</div>
					</div>
					
	 				<!-- 생년월일 -->
					<div class="row-div">
		            	<span class="item-text">생년월일</span>
						<div class="div2">
						<input type="date" class="input2" name="birth" value="${member.birth }">
		            	</div>
					</div>
					
					<!-- 성별 -->
					<div class="row-div">
		            	<span class="item-text">성별</span>
						<div class="div2">
		            	
						<select name="gender"  class="input2">
							<c:if test="${member.gender == null }">
								<option value="" hidden="true">성별</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
							</c:if>
							<c:if test="${member.gender == '여성' }">
								<option value="${member.gender}">${member.gender}</option>
								<option value="남성">남성</option>
							</c:if>
							<c:if test="${member.gender == '남성' }">
								<option value="${member.gender}">${member.gender}</option>
								<option value="여성">여성</option>
							</c:if>
						</select>
						</div>
					</div>
					
					<hr>
					<span id="deleteLink">회원님, 너무 아쉬워요<br>
					회원 탈퇴는 <a href="deleteForm.do">여기</a>를 클릭하세요</span>
					
	       		</div> 
	       		<!-- 수정하기 submit -->
	            <input type="submit" class="updateBtn" value="수정">
	                  
			</form>
		
		
			<div class="backBtn-div">
				<button class="backBtn" onclick="backBtn()">돌아가기</button>
			</div>
		</div>
		<!-- //update 컨텐츠 컨테이너 끝 -->
		
		
	</div>
</main>
</body>
</html>