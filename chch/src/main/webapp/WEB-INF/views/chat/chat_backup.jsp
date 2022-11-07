<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.from { display: flex; margin-right: auto; flex-wrap: wrap; }
	.to { display: flex; margin-left: auto; flex-wrap: wrap; }
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
	.changeDate { font-size: 10pt; }
	/* li{ list-style-type:none; } */
	#list-guestbook { display: flex; flex-flow: column;}
	.chatcontent {
		height: 700px;
		width : 50%;
		overflow-y: scroll;
	}
	
	#alertK{
		display : none;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
	
		$(function() {
			
			var chatBox = $('.box');
			var messageInput = $('textarea[name="msg"]');
			var room_no = "${room_no}";
			var member = $('.content').data('member');
			var sock = new SockJS(
					"${pageContext.request.contextPath}/endpoint");
			var client = Stomp.over(sock);
			
			//대화시
			$('.send').click(function() {
				sendmsg();
			});
			
			function sendmsg() {
				var message = messageInput.val();
				alert("메시지 "+message);
				if (message == "") {
					return false;
				}
				//insertChat();
				client.send('/app/hello/' + room_no, {},
						JSON .stringify({
							chat_content : message,
							sender : "${id}",
							room_no : "${room_no}"
						}));
				messageInput.val('');
			}
		
			client.connect({},function() {
				// 여기는 입장시
				//	           일반메세지 들어오는곳         
				client.subscribe('/subscribe/chat/'+ room_no,function(chat) {
					//받은 데이터
					var content = JSON.parse(chat.body);
					console.log(content);
					var endNo = content.no;
					var html = renderList(content,endNo);
					$("#list-guestbook").append(html);
					newAlerts(content,endNo);
				});
	
			});
		});
		
		
		var renderList = function(vo,endNo) {
			//alert("아뭐냐구");
			// 리스트 html을 정의
			var date = moment(vo.send_time).format('yyyyMMdd');
			var html = "";
			if(endNo==0) endNo = vo.no;
			
			//내가 보낸 채팅일 경우
			if(vo.memberId=="${id}"){
				//신고된 채팅일 경우
				var content ="";
					content = "<p class='myChat text-left p-2'>"+vo.chatContent+"</p>";
			
			html = 	"<li class='me pr-2' data-no='"+ endNo +"'>"
					+ "<strong>" + vo.memberId + "</strong>"
					+"<div class='me'>"
					+ "<strong style='display : inline;' class='align-self-end'>" + date + "</strong>"
					+ content
					+"</div>"
					+ "</li>";

			}
			//남이 보낸 채팅일 경우
			else{
				var content = "<p class='otherChat bg-light p-2'>"+vo.chatContent+"</p>";
				}
				html = "<li class='pl-2' data-no='"+ vo.no +"'>"
					+ "<strong>" + vo.memberId + "</strong>"
					+"<div class='row ml-0'>"
					+ content
					+ "<strong class='align-self-center'>" + date + "</strong>"
					+"</div>"
					+ "</li>";
			return html;

		}
	});
	
</script>
</head>
<body>
	<div class="content chatcontent">
		<div id="list-guestbook">
			<c:if test="${empty firstChatList }">데이터가 없습니다.</c:if>
			<c:set var="preDate"></c:set>				
			<fmt:formatDate var="nowDate" value="${date }" pattern="yyyyMMdd"/>
		
			<c:if test="${not empty firstChatList }">
				<c:forEach var="message" items="${firstChatList }">
					<fmt:formatDate var="sendDate" value="${message.send_time }" pattern="yyyyMMdd"/>
					<c:if test="${message.sender != id }">
							<div class="changeDate" align="center">
								<c:if test="${nowDate-sendDate!=0 && preDate-(nowDate-sendDate)!=0  }">
									${message.send_time }
									<c:set var="preDate" value="${nowDate-sendDate }" ></c:set>
								</c:if>
								<c:if test="${nowDate-sendDate==0 && preDate-(nowDate-sendDate)!=0}">
									${message.send_time }
									<c:set var="preDate" value="${nowDate-sendDate }" ></c:set>
								</c:if>
							
							</div>
							<div class="from">
								
								<div class="content1">${message.chat_content }</div>
								<div class="sendTime"><fmt:formatDate value="${message.send_time }"
									type="time" pattern="a hh:mm"/> </div><br>
								
							</div>
					</c:if>
					<c:if test="${message.sender == id }">
							<div class="changeDate" align="center">
								<c:if test="${nowDate-sendDate!=0 && preDate-(nowDate-sendDate)!=0  }">
									${message.send_time }
									<c:set var="preDate" value="${nowDate-sendDate }" ></c:set>
								</c:if>
								<c:if test="${nowDate-sendDate==0 && preDate-(nowDate-sendDate)!=0}">
									${message.send_time }
									<c:set var="preDate" value="${nowDate-sendDate }" ></c:set>
								</c:if>
							</div>
							<div class="to">
								<div class="sendTime" ><fmt:formatDate value="${message.send_time }"
									type="time" pattern="a hh:mm"/></div>
								<div class="content2">${message.chat_content }</div><br>
							</div>
					</c:if>
				</c:forEach>
			</c:if>
			<div class="chat-fixK">
				<div id="alertK" onclick="moveDown();" class="alert alert-success" role="alert">
					<strong></strong> 
				</div>
				<div class="fix_btn row">
					<textarea name="msg" id="msgi" rows="2" class="form-control col-sm-8"></textarea>
					<button type="button" class="send col-sm-4 btn btn-secondary">보내기</button>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>