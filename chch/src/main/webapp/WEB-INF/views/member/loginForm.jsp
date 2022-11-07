<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">body{margin-top: 100px;}</style>
<style type="text/css">
	div{
		width: 200px;
		margin: 20px;
	}
</style>
</head>
<body>
	<div class="container">
		<form action="login.do">
			<input type="text" name="id" required="required" autofocus="autofocus" class="form-control" placeholder="아이디를 입력해주세요"><p>
			<input type="password" name="password" required="required" class="form-control" placeholder="비밀번호를 입력해주세요"><p>
			<input type="submit" value="로그인" class="btn btn-success" align="center">
		</form>
	</div>
</body>
</html>