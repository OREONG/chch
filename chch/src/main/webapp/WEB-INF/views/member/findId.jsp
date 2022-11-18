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
		<div class="sub-container">
			<div class="idInfo-text">
				<div class="text-wrap">
					<span id="info-main-text">아이디 찾기</span>
				</div>
				회원님의 아이디는 <span class="id-show">${member.id }</span>입니다
			</div>
			<div class="find-idLogin-div">
			<a href="loginForm.do" class="find-idLogin">로그인하기</a><br>
			<a href="findPasswordForm.do" class="find-idfindPass">비밀번호 찾기</a>
			</div>
		</div>
	</div>
</main>
</body>
</html>