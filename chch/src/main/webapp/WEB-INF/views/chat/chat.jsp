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
<script type="text/javascript">
	//	var websocket;

	$(document).ready(function() {
		$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
	});

	$(function() {

		$('#sendBtn2').click(function() {
			sendChat();
		});

		$('#message').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				sendChat();
			}
		});
	});
</script>
</head>
<body>

	<div class="main-container">
		<div class="content">
		<input type="hidden" id="lastSender" value="">
			<div class="chat-top">
				<button class="chat-back-btn" onclick="location.href='chatMemberList.do'">채팅 목록</button>
			</div>
		
			<div id="showPage">
				<div>${room_name }</div>
				<div class="content chatcontent">
					<div id="chatMessage">
						<c:if test="${empty firstChatList }"></c:if>
						<c:set var="preDate"></c:set>
						<c:set var="lastSender"></c:set>
						<fmt:formatDate var="nowDate" value="${date }" pattern="yyyyMMdd" />

						<c:if test="${not empty firstChatList }">
							<c:forEach var="message" items="${firstChatList }">
								<c:set var="i" value="${i+1 }" />
								<fmt:formatDate var="sendDate" value="${message.send_time }" pattern="yyyyMMdd" />
								<fmt:formatDate var="changeDate" value="${message.send_time }" pattern="yyyy년 MM월 dd일" />
								<c:if test="${message.sender != id }">
									<div class="" class="changeDate" align="center">
										<c:if test="${nowDate-sendDate!=0 && preDate-(nowDate-sendDate)!=0  }">
											${changeDate}
										<c:set var="preDate" value="${nowDate-sendDate }"></c:set>
										</c:if>
										<c:if test="${nowDate-sendDate==0 && preDate-(nowDate-sendDate)!=0}">
											${changeDate}
										<c:set var="preDate" value="${nowDate-sendDate }"></c:set>
										</c:if>
									</div>
									<div class="from">
											<div>
										<c:if test="${message.sender != lastSender }">
												<div class='sender'>${message.sender }</div>
										</c:if>
												<div class="flex-row">
													<div class="content1">${message.chat_content }</div>
													<div class="sendTime">
														<fmt:formatDate value="${message.send_time }" type="time" pattern="a hh:mm" />
													</div>
												</div>
										</div>
										<br>
									</div>
								</c:if>
								<c:if test="${message.sender == id }">
									<div class="changeDate" align="center">
										<c:if test="${nowDate-sendDate!=0 && preDate-(nowDate-sendDate)!=0  }">
											${changeDate}
										<c:set var="preDate" value="${nowDate-sendDate }"></c:set>
										</c:if>
										<c:if test="${nowDate-sendDate==0 && preDate-(nowDate-sendDate)!=0}">
											${changeDate}
										<c:set var="preDate" value="${nowDate-sendDate }"></c:set>
										</c:if>
									</div>
									<div class="to">
										<div class="sendTime">
											<fmt:formatDate value="${message.send_time }" type="time" pattern="a hh:mm"></fmt:formatDate>
										</div>
										<div class="content2">${message.chat_content }</div>
										<br>
									</div>
								</c:if>
								<c:set var="lastSender" value="${message.sender }"></c:set>
							</c:forEach>
						</c:if>
					</div>
					<div class="alert-popup">
						<div id="alertK" onclick="moveDown();" class="alert alert-success" role="alert">
							<strong></strong>
						</div>
					</div>
					<div>
						<div class="send-container">
							<div class="chat-input-area">
								<input type="text" name="msg" id="message" class="form-control col-sm-8" style="resize: none;">
							</div>
							<div>
								<button type="button" id="sendBtn2" class="chat-send-btn">보내기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>