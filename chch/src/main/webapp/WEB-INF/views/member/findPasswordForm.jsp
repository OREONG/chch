<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/member.css");</style>

</head>
<body>
<main>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<form action="findPassword.do">
			<div class="text-wrap">
				<span id="info-main-text">비밀번호 찾기 step.1</span><br>
				<span id="info-text">회원님의 아이디를 입력해주세요</span>
			</div>
			
				<!--아이디 -->
				<div class="login-wrap" >
		            <input type="text" name="id" placeholder="아이디를 입력해주세요" >
	            </div>  
	            
			<input type="submit" value="다음" class="joinBtn">
		</form>
	</div>
</main>
</body>
</html>