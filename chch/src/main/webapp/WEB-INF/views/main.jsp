<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		반가워요 ${id }
	</div>
	<div>
		<button onclick="location.href='chatMemberList.do'" class="btn btn-info">채팅방</button>
	</div>
	<br>
	<div>
		<button onclick="location.href='faq.do'" class="btn btn-success">고객센터</button>
	</div>
	<br>
	<div>
		<button onclick="location.href='adminMain.do'" class="btn btn-info">관리자</button>
	</div>
	<br>
	<div>
		<button onclick="location.href='communityMain.do'" class="btn btn-success">커뮤니티</button>
	</div>
	<br>
	<div>
		<button onclick="location.href='notice.do'" class="btn btn-info">알림</button>
	</div>
	<br> <br>
	<div>
		<button onclick="location.href='loginForm.do'" class="btn btn-dark">로그인</button>
	</div>
</body>
</html>