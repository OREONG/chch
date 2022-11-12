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
			<form action="login.do">
					<!-- 이전 페이지 주소 -->
					<input type="hidden" name="targetPage" value="${targetPage}">
					<!-- 로고 이미지 -->
					<div class="img-div">
						<img alt="" src="/chch/resources/images/chackcheckCheckLogo2-1.png">
					</div>
					<!-- 아이디 -->
					<div class="login-wrap" >
						<input type="text" name="id" required="required" autofocus="autofocus" class="form-control" placeholder="아이디를 입력해주세요">
					</div>
					<!-- 비밀번호 -->
					<div class="login-wrap" >
						<input type="password" name="password" required="required" class="form-control" placeholder="비밀번호를 입력해주세요">
					</div>
					
					<!-- 로그인 버튼 -->
					<input type="submit" value="로그인" class="loginBtn">
					
					<div>
					<ul>
						<li><a href="joinForm.do">회원가입</a></li>
						<li>&nbsp;|&nbsp;</li>
						<li><a href="findIdForm.do">아이디 찾기</a></li>
						<li>&nbsp;|&nbsp;</li>
						<li><a href="findPasswordForm.do">비밀번호 찾기</a></li>
					</ul>
					</div>
			</form>


	</div>
</main>
</body>
</html>