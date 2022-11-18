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
</head>
<body>
<main>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
			<form action="login.do">
					<!-- 이전 페이지 주소 -->
					<input type="hidden" name="targetPage" value="${targetPage}">
					<!-- 로고 이미지 -->
					<a href="main.do">
					<div class="img-div">
						<img alt="" src="/chch/resources/images/chackcheckCheckLogo2-1.png">	
					</div>
					</a>
					<!-- 아이디 -->
					<div class="login-wrap" >
						<input type="text" name="id" required="required" autofocus="autofocus" placeholder="아이디를 입력해주세요">
					</div>
					<!-- 비밀번호 -->
					<div class="login-wrap" >
						<input type="password" name="password" required="required" placeholder="비밀번호를 입력해주세요">
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