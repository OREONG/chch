<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chackcheckPrac/resources/css/member.css");</style>

</head>
<body>
<main>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<div class="sub-container">
			<div>
				회원님의 아이디는 <span>${member.id }</span>입니다
			</div>

			<a href="loginForm.do">로그인하기</a>
		</div>
	</div>
</main>
</body>
</html>