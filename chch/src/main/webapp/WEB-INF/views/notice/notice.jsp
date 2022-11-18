<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = "menu">
		<input type="text" name="userId" id="userId" class="col-sm-8" style="resize: none;">
		<input type="text" name="notice" id="notice" class="col-sm-8" style="resize: none;">
		<button type="button" id="sendBtn1" class="col-sm-4 btn btn-info">메세지 보내기</button>
		<button type="button" id="loadStatus" class="col-sm-4 btn btn-info">접속자 확인</button>
	</div>
	<div class = "menu" id="PopUp" style="display: flex; flex-direction: column;"></div>
</body>
</html>