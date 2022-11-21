<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/chch/resources/css/chat.css");
</style>
</head>
<body>
	<fmt:formatDate var="nowDate" value="${date }" pattern="yyyyMMdd" />

	<div class="main-container">
		<div class="content">
					<div class="main-text-div">
						<span id="main-text">내 대화방 리스트</span>
					</div>
			<div id="showPage">
				<div id="chat-container">
				
					<div>
						<c:if test="${empty selectMyRoom}"> 참여한 대화방이 존재하지 않습니다</c:if>
					</div>
				
					<c:forEach var="list" items="${selectMyRoom }">
						<fmt:formatDate var="sendDate" value="${list.send_time }" pattern="yyyyMMdd" />
						<div id="room${list.room_no}" onclick="location.href='chat.do?room_no=${list.room_no}&room_name=${list.room_name }'" style="cursor: pointer;">
							<div>
								<div>${list.room_name }</div>
								<div id="room_no${list.room_no}">
									<c:if test="${list.unread != 0}">${list.unread }</c:if>
								</div>
							</div>
							<div id="msgRoom_no${list.room_no}">${list.chat_content }</div>
							<div>
								<c:if test="${list.diffDays != 0 }">
									<fmt:formatDate var="sendDate" value="${list.send_time }" pattern="MM월 dd일" />
										${sendDate }
								</c:if>
								<c:if test="${list.diffDays == 0 }">
									<fmt:formatDate var="sendDate" value="${list.send_time }" pattern="a hh:mm" />
									${sendDate }
								</c:if>
							</div>
							<hr>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
	</div>



</body>
</html>