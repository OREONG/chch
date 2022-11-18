<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
<title>header</title>
<style type="text/css">@import url("/chch/resources/css/header.css");</style>

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<c:set var="ipAdd" value="//172.30.1.78:8080"></c:set>
<c:set var="ip" value="http:${ipAdd}/chch"></c:set>
<link rel="stylesheet" type="text/css"href="${path }/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${path}/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path}/resources/bootstrap/js/jquery1.js"></script>
<script type="text/javascript" src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/resources/bootstrap/js/sockjs.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style type="text/css">@import url("/chch/resources/css/font.css");</style>
<style type="text/css">@import url("/chch/resources/css/member.css");</style>

<script type="text/javascript">
	//이메일 인증번호 div
	$(document).ready(function(){
		$('#emailConfirmHidden').hide();
	});
	
	//아이디 중복체크
	function idDepChkFun(){
		if(!frm.id.value) {
			$('#idChk-msg').html('아이디를 입력해주세요');
			frm.id.focus(); 
			return false;
		}
		$.post('idDepChk.do', "id="+frm.id.value, function(data) {
			$('#idChk-msg').html(data);
		});
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
   						$("#emailConfirmHidden").show();
		 				alert("인증번호가 전송되었습니다");		
	 					frm.emailConfirm.focus();
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
	
	
	function chk() {
		//이메일 인증번호 확인 여부
		if($("#emailConfirmHidden").is('[show]') && !$("#email").is('[readonly]')){
			$('#emailChk-msg').html("이메일 인증번호를 확인해주세요");
			frm.emailConfirm.focus();
			return false;
		}
		//회원가입 버튼 클릭시 값이 null일 경우 처리(required 사용x)
		if(!frm.id.value){
			$('#idChk-msg').html('아이디를 입력해주세요');
			frm.id.focus();
			return false;
		}
		if(!frm.email.value){
			$('#email-msg').html('이메일을 입력해주세요');
			frm.email.focus();
			return false;
		}
		if(!frm.emailConfirm.value){
			$('#email-msg').html('이메일 인증을 진행해주세요');
			frm.emailConfirm.focus();
			return false;
		}
		if(!frm.password.value){
			$('#password-msg').html('비밀번호를 입력해주세요');
			frm.password.focus();
			return false;
		}
		if(!frm.confirmPass.value){
			$('#passChk-msg').html('비밀번호 확인을 입력해주세요');
			frm.confirmPass.focus();
			return false;
		}
}
	

</script>
</head>
<body>
<main>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<form action="join.do" name="frm" onsubmit="return chk()">
			<!-- 로고 이미지 -->
			<a href="main.do">
			<div class="img-div">
				<img alt="" src="/chch/resources/images/chackcheckCheckLogo2-1.png">
			</div>
			</a>
				<!--아이디 -->
				<div class="join-wrap" >
	            	<div class="row-div">
		            	<input type="text" name="id" placeholder="아이디를 입력해주세요" class="input1">
		            	<input type="button" name="idDepBtn" class="btn" onclick="idDepChkFun()" id="idDepChk-button" value="중복확인"/>
	          		</div>
	          		<div id="idChk-msg"></div>
	            </div>            
	            <!-- 이메일 -->
	            <div class="join-wrap" >
	            	<div class="row-div">
		            	<input id="email" type="email" name="email" placeholder="이메일주소를 입력해주세요" class="input1">
		            	<input type="button" name="emailSend" class="btn" onclick="emailChkShow()" id="emailChk-button" value="인증"/>
	            	</div>
	            	<div id="email-msg"></div>
	            </div>
	            <!-- 이메일 인증번호 -->                                                 
	            <div class="join-wrap" id="emailConfirmHidden">
	            	<div class="row-div">
		            	<input id="emailChk-input" type="text" name="emailConfirm" placeholder="인증번호를 입력해주세요" class="input1"/>
		            	<input type="button" name="emailConfirmBtn" class="btn" onclick="emailConfirmFun()" id="emailConfirm-button" value="확인"/>
	            	</div>
	            	<div id="emailChk-msg"></div>
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
	            
	            <input type="submit" class="joinBtn" value="회원가입">
	            
	            
                  
        </form>   
</div>
</main>
</body>
</html>