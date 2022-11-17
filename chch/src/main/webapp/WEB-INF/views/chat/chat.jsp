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
		
		$("#chatMessage").scroll(function () {
			var scrT = $("#chatMessage").scrollTop();
			if ($("#chatMessage")[0].scrollHeight - scrT <= 605 ) {
				$('#alert').css('display','none');
			}
		});
		
	});
	
	function sendChat() {
		var msg = $('#message').val(); // 입력한 메세지 글 읽기
		
		var encodeMsg = encodeURIComponent(msg);
		
		if (msg==null || msg=="") {
			alert("메세지를 입력하세요!");
			return false;
		}
		
		var date = new Date();
	
		// ajax로 채팅 내용 저장
		$(function() {
			$.ajax({
				url : "saveMessage.do?id=${id}&msg="+encodeMsg+"&room_no=${room_no}",
				async : true,
				type : "POST",
				dataType : "html",
				cache : false
			});
		});
		
		var chatMsg = $('#message').val();
		var chat = "chat,${id},${room_no},"+encodeMsg+","+date;
		sock.send(chat);
		
		$('#message').val(""); // 메세지로 입력한 글 지우기
	}
	
	function moveDown(){
		$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
		$('#alert').css('display','none');
		
	}
	
	function openCloseChatMenu(){
	    let status = $('.hideChatMenu').css('display');
	    if (status =='block') {
	        $('.hideChatMenu').hide();
	    } else {
	        $('.hideChatMenu').show();
	    }
	}
	
	
</script>
</head>
<body>

	<div class="main-container">
		<div class="content">
		<input type="hidden" id="lastSender" value="">
			<div class="chat-top2">
				<div id="back_click"><span id="back" onclick="location.href='chatMemberList.do'">&lt; 돌아가기</span></div>
			</div>
		
			<div id="showPage">
				<div class="chat-top">
					<div class="room-name">${room_name }</div>
					<div>
						<button class="chatMenuBtn" onclick="openCloseChatMenu()"><img id="hamburger" alt="" src="/chch/resources/images/hamburger.png"> </button>
					</div>
				</div>
				<div class="hideChatMenu">
							<!-- 신작도서 bookMenu -->
							<div class="chatMenu">
									<!-- IT -->
											<ul class="submenu">
												<c:if test="${roomType == 'community' }">
													<li class="li-c"><a href="communityDetail.do?community_no=${community_no}" class="a">모임으로 이동</a></li>
												</c:if>
												<c:if test="${roomType == 'used' }">
													<li class="li-c"><a href="" class="a">중고 거래로 이동</a></li>
												</c:if>
												<li class="li-c"><a href="" class="a">채팅방 별칭 설정</a></li>
											</ul>
							</div>
				</div>
					
				<div class="chatcontent">
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
					
					<div>
						<div class="send-container" align="center">
							<div class="chat-input-area">
								<input type="text" name="msg" id="message" class="form-control col-sm-8" style="resize: none;">
							</div>
							<div>
								<button type="button" id="sendBtn2" class="chat-send-btn">보내기</button>
							</div>
						</div>
					</div>
					<div class="alert-popup">
						<div id="alert" onclick="moveDown();" class="alert alert-success" role="alert">
							<strong></strong>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>