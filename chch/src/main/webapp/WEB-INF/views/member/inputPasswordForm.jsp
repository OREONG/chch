<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/member.css");</style>

<script type="text/javascript">

	//비밀번호 유효성 검사
	var passwordRegExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{4,16}$/;
	$(function(){
		$('#password').on("focusout", function() {
			if(!passwordRegExp.test($('#password').val())){  
				$('#password-msg').html('영문 대소문자와 숫자, 특수문자를 포함하여 5~16자리로 입력해야 합니다');
				frm.password.value = "";            
				frm.password.focus();     
				return false;          
			}else $('#password-msg').html('');
		});
	});
	//암호, 암호 확인 일치 여부
	$(function(){
		$('#passConfirm').on("focusout", function() {
			if(frm.password.value != frm.confirmPass.value){  
				$('#passChk-msg').html('암호와 암호 확인이 다릅니다');
				frm.confirmPass.focus();  
				frm.confirmPass.value = "";    
				return false;          
			}else $('#passChk-msg').html('');
		});
	});
</script>
</head>
<body>
<main>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
	<form action="inputPassword.do" onsubmit="return chk()" name="frm">
		<input type="hidden" name="id" value="${member.id }">
		<div class="text-wrap">
			<span id="info-main-text">비밀번호 찾기 step.3</span><br>
			<span id="info-text">보안을 위해 비밀번호를 재설정 해주세요</span>
		</div>
		<!-- 비밀번호 -->
		<div class="join-wrap" >
		    <div>
		    <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요" class="input2">
		    </div>
		    <div id="password-msg"></div>
		</div>
		    <!-- 비밀번호 확인 -->
		<div class="join-wrap" id="passConfimHidden">
		 	<div>
		    <input type="password" id="passConfirm" name="confirmPass" placeholder="비밀번호 확인을 입력해주세요" class="input2">
		    </div>
		    <div id="passChk-msg"></div>
		</div> 
		<input type="submit" value="비밀번호 변경" class="joinBtn">
	</form>
</div>
</main>
</body>
</html>