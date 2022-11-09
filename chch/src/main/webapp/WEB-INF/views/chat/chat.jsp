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
.from {
	display: flex;
	margin-right: auto;
	flex-wrap: wrap;
}

.to {
	display: flex;
	margin-left: auto;
	flex-wrap: wrap;
}

.content1 {
	max-width: 200px;
	border-radius: 10px;
	border: 1px solid;
	padding: 7px;
	margin: 4px;
	text-align: left;
}

.content2 {
	max-width: 200px;
	border-radius: 10px;
	border: 1px solid;
	padding: 7px;
	margin: 4px;
	text-align: left;
	background-color: #f5f5f5;
}

.sendTime {
	font-size: 4pt;
	align-self: flex-end;
}

.changeDate {
	font-size: 10pt;
}
/* li{ list-style-type:none; } */
#chatMessage {
	display: flex;
	flex-flow: column;
}

.chatcontent {
	width: 50%;
}

#chatMessage {
	height: 600px;
	overflow-y: scroll;
}

#alertK {
	display: none;
}
</style>
<script type="text/javascript">
//	var websocket;

	$(document).ready(function() {
		$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
	});
	
</script>
</head>
<body>
	<div>
		${room_name }
	</div>
	<div class="content chatcontent">
		<div id="chatMessage">
			<c:if test="${empty firstChatList }">데이터가 없습니다.</c:if>
			<c:set var="preDate"></c:set>
			<fmt:formatDate var="nowDate" value="${date }" pattern="yyyyMMdd" />

			<c:if test="${not empty firstChatList }">
				<c:forEach var="message" items="${firstChatList }">
					<fmt:formatDate var="sendDate" value="${message.send_time }" pattern="yyyyMMdd" />
					<fmt:formatDate var="changeDate" value="${message.send_time }" pattern="yyyy년 MM월 dd일" />
					<c:if test="${message.sender != id }">
						<div class="changeDate" align="center">
							<c:if
								test="${nowDate-sendDate!=0 && preDate-(nowDate-sendDate)!=0  }">
									${changeDate}
									<c:set var="preDate" value="${nowDate-sendDate }"></c:set>
							</c:if>
							<c:if
								test="${nowDate-sendDate==0 && preDate-(nowDate-sendDate)!=0}">
									${changeDate}
									<c:set var="preDate" value="${nowDate-sendDate }"></c:set>
							</c:if>

						</div>
						<div class="from">
							<div class='sendTime'>${message.sender }</div>
							<div class="content1">${message.chat_content }</div>
							<div class="sendTime">
								<fmt:formatDate value="${message.send_time }" type="time"
									pattern="a hh:mm" />
							</div>
							<br>

						</div>
					</c:if>
					<c:if test="${message.sender == id }">
						<div class="changeDate" align="center">
							<c:if
								test="${nowDate-sendDate!=0 && preDate-(nowDate-sendDate)!=0  }">
									${changeDate}
									<c:set var="preDate" value="${nowDate-sendDate }"></c:set>
							</c:if>
							<c:if
								test="${nowDate-sendDate==0 && preDate-(nowDate-sendDate)!=0}">
									${changeDate}
									<c:set var="preDate" value="${nowDate-sendDate }"></c:set>
							</c:if>
						</div>
						<div class="to">
							<div class="sendTime">
								<fmt:formatDate value="${message.send_time }" type="time"
									pattern="a hh:mm"></fmt:formatDate>
							</div>
							<div class="content2">${message.chat_content }</div>
							<br>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
		<div class="chat-fixK">
			<div id="alertK" onclick="moveDown();" class="alert alert-success"
				role="alert">
				<strong></strong>
			</div>
			<div class="fix_btn row">
				<input type="text" name="msg" id="message"
					class="form-control col-sm-8" style="resize: none;">
				<button type="button" id="sendBtn2"
					class="col-sm-4 btn btn-secondary">보내기</button>
			</div>
		</div>
	</div>
</body>
</html>