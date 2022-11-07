<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chackcheckPrac/resources/css/member.css");</style>

<script type="text/javascript">
	//이메일 '전송'버튼을 눌렀을 때 실행하는 메서드
	function emailChkShow() {
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
			if($('#email').val() == "") {
			alert("이메일 주소를 입력해주세요");
			frm.email.focus(); 
			return false;
		} 
			else if($('#email').val() != ""){
		 		if(!regExp.test($('#email').val())){
					alert("이메일 형식으로 입력해주세요");
					frm.email.focus(); 
					return false;
				}else {
					$.post('${path }/emailChkFindPass.do', "email="+frm.email.value+"&id="+frm.id.value, function(data) {
							if(data == "y"){
				 			alert("인증번호가 전송되었습니다");
				 			//$("#emailChk-container").show();			
							}else if(data == "null"){
								alert("존재하지 않는 이메일 입니다")
							}else if(data == "n"){
								alert("이메일을 확인해주세요");
							}
					});
				};
			};
	};
	
	//이메일 인증번호 '확인'버튼을 눌렀을 때 실행하는 메서드
	function emailConfirmFun(){
			$.post('${path }/emailConfirm.do', "emailConfirm="+frm.emailConfirm.value, function(data) {
				if(data == 'y'){
					alert("인증번호가 일치합니다");
					//일치 할 경우 비밀번호 재설정 폼으로 이동
					location.href="inputPasswordForm.do?id=${member.id}";
				}else if(data == 'n'){
					alert("인증번호가 일치하지 않습니다");
					return false;
				}
					
			});		
	};
	
	function chk() {
		//이메일 인증번호 확인 여부
		if(!$("#email").is('[readonly]')){
			alert("이메일 인증번호를 확인해주세요");
			frm.emailConfirm.focus();
			return false;
		}
	}
</script>
</head>
<main>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<form action="findId.do" name="frm" onsubmit="return chk()">
				<input type="hidden" name="id" value="${member.id }">
				<span id="">이메일 인증을 진행합니다</span>
				
	            <!-- 이메일 -->
	            <div class="join-wrap" >
	            	<div class="row-div">
		            	<input id="email" type="email" name="email" placeholder="이메일주소를 입력해주세요" class="input1">
		            	<input type="button" name="emailSend" class="btn" onclick="emailChkShow()" id="emailChk-button" value="인증번호&#10;전송"/>
	            	</div>
	            	<div id="email-msg"></div>
	            </div>
	            <!-- 이메일 인증번호 -->                                                 
	            <div class="join-wrap" id="emailConfirmHidden">
	            	<div class="row-div">
		            	<input id="emailChk-input" type="text" name="emailConfirm" placeholder="인증번호를 입력해주세요" class="input1"/>
		            	<input type="button" name="emailConfirmBtn" class="btn" onclick="emailConfirmFun()" id="emailConfirm-button" value="인증번호&#10;확인"/>
	            	</div>
	            	<div id="emailChk-msg"></div>
	            </div>
		</form>
	</div>
</main>
</body>
</html>