<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
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
	var websocket;
	var nickname;

	$(document).ready(function() {

		$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);

		connect();

	});

	$(function() {
		$('#sendBtn').click(function() {
			send();
		});

		$('#message').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				send();
			}
		});
	});

	// 입장

	var id = '${id}';

	function connect() {
		//                             server ip          servlet-context에 등록된 이름
		
		websocket = new SockJS("<c:url value="/echo.do"/>");
		
		websocket.onmessage = onMessage;

		nickname = '${nickName}';

	}

	function disconnect() {
		websocket.close();
	}

	function onMessage(event) {
		var msg = event.data; // 메세지는 event의 data속성에 들어 있음
		
		appendMessage(msg);
	}

	function send() {
		var msg = $('#message').val(); // 입력한 메세지 글 읽기
		
		if (msg==null || msg=="") {
			alert("메세지를 입력하세요!");
			return false;
		}
		
		var date = new Date();

		// ajax로 채팅 내용 저장
		$(function() {
			console.log(id+' ${room_no} '+msg);
			$.ajax({
				url : "saveMessage.do?id=${id}&msg="+msg+"&room_no=${room_no}",
				async : true,
				type : "POST",
				dataType : "html",
				cache : false
			});
		});

		var option = {
			type : 'message',
			sender : '${id}',
			room_no : '${room_no}',
			msg : $('#message').val(),
			send_time : date
		}

		websocket.send(JSON.stringify(option));
		$('#message').val(""); // 메세지로 입력한 글 지우기
	}

	function onClose() {
		appendMessage(id + "님이 퇴장하였습니다");
	}

	function appendMessage(msg) {
		
		if (msg != null && msg.trim() != '') {
			console.log(msg);
			var d = JSON.parse(msg);
			console.log(d);
				
			var s_time = moment(d.send_time).locale('ko').format('a hh:mm');
			
			if (d.type == "message" && d.room_no== "${room_no}") {
				if (d.sender == "${id}") {
					$('#chatMessage').append(
							"<div class='to'>"
								+ "<div class='sendTime'>" + s_time + "</div>"
								+ "<div class='content2'>" + d.msg + "</div>"
							+ "</div>");
					// 자기 메세지일 때는 최하단으로 이동
					var objDiv = document.getElementById("chatMessage");
					objDiv.scrollTop = objDiv.scrollHeight;
					
				} else {
					$('#chatMessage').append(
							"<div class='from'>"
								+ "<div class='sendTime'>" + d.sender + "</div><br>"
								+ "<div class='content1'>" + d.msg + "</div>"
								+ "<div class='sendTime'>" + s_time + "</div><br>"
							+ "</div>");
					// 남의 메세지일 때는 알림이 뜬다, 뜬 알림 누르면 최하단으로 이동 
					
				}
			}
		} else {
			alert("잘못된 메세지 타입입니다.");
		}

		// 채팅창에 글이 꽉찬 경우에 최신글이 하단에 보이게, scrollbar를 아래로 내려라

	}
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
				<button type="button" id="sendBtn"
					class="col-sm-4 btn btn-secondary">보내기</button>
			</div>
		</div>
	</div>
</body>
</html>