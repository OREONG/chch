<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="id" id="userId" value="${id}">
	<input type="hidden" name="room_name" id="room_name" value="${room_name }">
	<input type="hidden" name="room_no" id="room_no" value="${community.room_no }">
	<div>
		<div>
			카테고리
		</div>
		<div>
			${community.community_category }
		</div>
	</div>
	
	<div>
		<div>
			제목
		</div>
		<div>
			${community.community_subject }
		</div>
	</div>
	
	<div>
		<div>
			활동 내용
		</div>
		<div>
			${community.community_content }
		</div>
	</div>
	
	<div>
		<div>
			인원
		</div>
		<div>
			${community.max_member }
		</div>
	</div>
	
	<div>
		<div>
			성별
		</div>
		<div>
			${community.community_gender }
		</div>
	</div>
	<div>
		<div>
			나이
		</div>
		<div>
			${community.min_age } ~ ${community.max_age }
		</div>
	</div>
	
	<div>
		<div>
			장소
		</div>
		<div>
			${community.community_location }
		</div>
	</div>
	
	<c:if test="${community.participation == 0 }">
	<div>
		<button onclick="location.href='joinRoom.do?room_no=${community.room_no}'" id="sendBtn4" class="btn btn-success">가입</button>
	</div>
	</c:if>
	
	<c:if test="${community.participation > 0 }">
	<div>
		<button onclick="location.href='chat.do?room_no=${community.room_no}&room_name=${community.room_name }'" class="btn btn-info">대화방으로</button>
	</div>
	</c:if>
		
</body>
</html>