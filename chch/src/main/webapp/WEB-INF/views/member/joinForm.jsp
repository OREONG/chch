<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 이메일 인증 숨기기 삭제 금지 */
	/* #emailChk-container{
		display:none;
	} */
	
	div{
		margin :20px; 
	}
	.form-control{
		width:400px;
	}
	.row-div{
	    display: flex;
	}

</style>
<script type="text/javascript">
	//아이디 중복체크
	function idDepChkFun(){
		if(!frm.id.value) {
			alert("아이디를 입력한 후에 체크하시오");
			frm.id.focus(); return false;
		}
		$.post('${path}/idDepChk.do', "id="+frm.id.value, function(data) {
			$('#idChk-msg').html(data);
		});
	}
	
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
 				$.post('${path}/emailChk.do', "email="+frm.email.value, function(data) {
 					var msg = data;
   					if(msg == ""){
		 				alert("인증번호가 전송되었습니다");
		 				//$("#emailChk-container").show(); 						
 					}else alert(msg);
 				});
 			};
 		};
	};
	
	//이메일 인증번호 '확인'버튼을 눌렀을 때 실행하는 메서드
	function emailConfirmFun(){
			$.post('${path}/emailConfirm.do', "emailConfirm="+frm.emailConfirm.value, function(data) {
				if(data == 'y'){
					$("#emailChk-msg").html("인증번호가 일치합니다");
					$('#emailChk-button').attr('disabled',true);
					$('#email').attr('readonly',true);
					$('#emailChk-input').attr('readonly',true);
				}else if(data == 'n'){
					alert("인증번호가 일치하지 않습니다");
					frm.emailConfirm.focus();
					frm.emailConfirm.value="";
					return false;
				}
					
			});		
	};

	
	function chk() {
		//암호, 암호 확인 일치 여부
		if(frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.password.focus();
			frm.password.value="";
			frm.confirmPass.value="";
			return false;
		}
		//이메일 인증번호 확인 여부
		if(!$("#email").is('[readonly]')){
			alert("이메일 인증번호를 확인해주세요");
			frm.emailConfirm.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
	<h2 class="text-primary">회원가입</h2>
		<form action="join.do" name="frm" onsubmit="return chk()">
			<div>
            	아이디
            	<div class="row-div">
	            	<input type="text" name="id" required="required" placeholder="아이디를 입력하세요." class="form-control">
	            	<input type="button" name="idDepBtn" class="btn btn-info" value="중복검사" onclick="idDepChkFun()" id="idDepChk-button"/>
          			<div id="idChk-msg"></div>
          		</div>
            </div>            		
            <div>
            	이메일
            	<div class="row-div">
	            	<input id="email" type="email" name="email" required="required" placeholder="이메일주소를 입력하세요." class="form-control">
	            	<input type="button" name="emailSend" class="btn btn-info" value="전송" onclick="emailChkShow()" id="emailChk-button"/>
            	</div>
            </div>                                                 
            <div>
            	인증번호
            	<div class="row-div">
	            	<input id="emailChk-input" type="text" name="emailConfirm" required="required" placeholder="인증번호를 입력해주세요" class="form-control"/>
	            	<input type="button" name="emailConfirmBtn" class="btn btn-info" value="확인" onclick="emailConfirmFun()" id="emailConfirm-button"/>
            		<div id="emailChk-msg"></div>
            	</div>
            </div>
            <div>
            	비밀번호
            	<input type="password" name="password" required="required" placeholder="비밀번호를 입력하세요." class="form-control">
            </div>
 			<div>
            	비밀번호 확인
            	<input type="password" name="confirmPass" required="required" placeholder="비밀번호 확인을 입력하세요." class="form-control">
            </div>   
            
            <input type="submit" class="btn btn-sucess" value="회원가입">           
        </form>
</div>
</body>
</html>