<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:formatDate var="nowDate" value="${date }" pattern="yyyyMMdd" />

<c:forEach var="list" items="${selectMyRoom }">
	<fmt:formatDate var="sendDate" value="${list.send_time }" pattern="yyyyMMdd" />
	<div onclick="location.href='chat.do?room_no=${list.room_no}&room_name=${list.room_name }'" style="cursor: pointer;">
		<div>
			${list.room_name } 
		</div>
		<div>
			${list.chat_content }
		</div>
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
</body>
</html>