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
		<button onclick="location.href='communityInsertForm.do'" class="btn btn-info">커뮤니티 글 등록</button>
	</div>
	
	<br>
	
	<div>
		<button onclick="location.href='communityAllList.do'" class="btn btn-primary">전체 커뮤니티 목록</button>
	</div>
	
	<br>
	
	<div>
		<button onclick="location.href='communityMyList.do'" class="btn btn-success">가입한 커뮤니티 목록</button>
	</div>
	
</body>
</html>