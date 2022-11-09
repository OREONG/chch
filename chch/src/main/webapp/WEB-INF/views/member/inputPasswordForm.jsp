<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/member.css");</style>

<script type="text/javascript">
	function chk() {
		//암호, 암호 확인 일치 여부
		if(frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.password.focus();
			frm.password.value="";
			frm.confirmPass.value="";
			return false;
		}
	
	}
</script>
</head>
<body>
<main>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
	<form action="inputPassword.do" onsubmit="return chk()" name="frm">
		<input type="hidden" name="id" value="${member.id }">
		<span id="">비밀번호를 다시 설정해 주세요</span>
		<!-- 비밀번호 -->
		<div class="join-wrap" >
		    <div>
		    <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요" class="input2">
		    </div>
		</div>
		    <!-- 비밀번호 확인 -->
		<div class="join-wrap" id="passConfimHidden">
		 	<div>
		    <input type="password" id="passConfirm" name="confirmPass" placeholder="비밀번호 확인을 입력해주세요" class="input2">
		    </div>
		</div> 
		<input type="submit" value="비밀번호 변경" class="joinBtn">
	</form>
</div>
</main>
</body>
</html>