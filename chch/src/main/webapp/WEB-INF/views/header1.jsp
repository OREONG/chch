<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	var socket  = null;
	var id = '${id}';
	
	$(document).ready(function(){
	    // 웹소켓 연결
	    sock = new SockJS("<c:url value='/echo.do'/>");
	    socket = sock;
	    
	    sock.onopen = function() {
		    console.log('open ws')
	    };
		
	    // 데이터를 전달 받았을때 
	    sock.onmessage = onMessage; // toast 생성
	    
	});
	    
	$(function() {
	    $('#loadStatus').click(function() { loadStatus(); });
	    $('#sendBtn1').click(function() { sendNotice(); });
	    $('#sendBtn2').click(function() { sendChat(); });
	    $('#sendBtn3').click(function() { inquiryReply(); });
	    $('#sendBtn4').click(function() { joinRoom(); });
	    
	    $('#notice').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				sendNotice();
			}
		});
	    $('#message').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				sendChat();
			}
		});
	}); 
		
	function onMessage(evt){
		
		var msg = evt.data;
	
		console.log("header47 메세지 받음 : "+msg);
		
		appendMessage(msg);
	}	
		
	function appendMessage(msg) {
		var split1 = msg.split(',');
		
		console.log("header55 : "+msg);
		console.log("header56 : "+split1);
		
		if (msg != null && msg.trim() != '' && split1[0] == 'chat') {
			var check1;
			var check2;
			if (document.location.href.includes('?')) {
				check1 = document.location.href.split("?");
				check11 = check1[0].substr(-7);		// 해당 페이지의 주소 확인
				if (check1[1].includes('&')) {
					check2 = check1[1].split("&");
					check22 = check2[0];// 해당 페이지의 파라미터 값을 가져옴
					console.log(check2);
				} else {
					check22=0;
				}
			} else {
				check11=0;
				check22=0;;
			}
			
			if (check11 == 'chat.do' && check22 == 'room_no=${room_no}') {	//'chat.do'에 해당하는 주소이고 room_no가 동일할 때 메세지를 append
				console.log("header60 chat으로 시작하는 메세지 : "+msg);
				
				var sender = split1[1];
				var room_no = split1[2];
				var msg = split1[3]
				var send_time = split1[4];
				
				var s_time = timeChange(send_time);
				
				if (split1[0] == "chat" && room_no == "${room_no}") {
					if (sender == "${id}") {
						$('#chatMessage').append(
								"<div class='to'>"
									+ "<div class='sendTime'>" + s_time + "</div>"
									+ "<div class='content2'>" + msg + "</div>"
								+ "</div>");
						var objDiv = document.getElementById("chatMessage");
						objDiv.scrollTop = objDiv.scrollHeight;
						
					} else {
						$('#chatMessage').append(
								"<div class='from'>"
									+ "<div class='sendTime'>" + sender + "</div><br>"
									+ "<div class='content1'>" + msg + "</div>"
									+ "<div class='sendTime'>" + s_time + "</div><br>"
								+ "</div>");
					}
				}
			} else {						// 해당 채팅방 안에 있지 않을 때는 notice에 알림
				
				var sender = split1[1];
				// var room_no = split1[2];
				var msg = split1[3]
				// var send_time = split1[4];
				
				var view =sender+"님으로부터의 메세지 : "+msg;
			    				
				$("#noticePopUp").children().remove();
			    $("#noticePopUp").val(view);
				
			}
			
			
			
		} else if (msg != null && msg.trim() != '' && split1[0] == 'notice'){
			
			console.log("header122 notice으로 시작하는 메세지 : "+msg);
			
		    var view = split1[2];
	    	$("#noticePopUp").children().remove();
		    $("#noticePopUp").val(view);
	    	
	    } else if (msg != null && msg.trim() != '' && split1[0] == 'inquiryReply'){
			
			console.log("header133 inquiryReply으로 시작하는 메세지 : "+msg);
			
		    var view = "문의 "+split1[2]+"에 대한 답변이 완료되었습니다.";
	    	$("#noticePopUp").children().remove();
		    $("#noticePopUp").val(view);
	    	
	    } else if (msg != null && msg.trim() != '' && split1[0] == 'joinRoom'){
			
			console.log("header141 joinRoom으로 시작하는 메세지 : "+msg);
			
		    var view = split1[1]+"님이 "+split1[3]+" 대화방에 참여하였습니다.";
	    	$("#noticePopUp").children().remove();
		    $("#noticePopUp").val(view);
	    	
	    } else if (msg != null && msg.trim() != '' && split1[0] == 'status') {
	    	
	    	console.log("header149 notice으로 시작하는 메세지 : "+msg);
	    	
	    	var view="";
	    	console.log(split1.length);
	    	
			for (var i = 1; i < split1.length; i++) {
				view = view+"<div>"+split1[i]+"</div>";
			}
		    
			view = "<div>현재 접속자</div>"+view;
			
			
		    $("#PopUp").children().remove();
		    $("#PopUp").append(view);
	    }
	};
		
	function loadStatus() {
		var status = "status,${id}";
		sock.send(status);
	}
	
	function sendNotice() {
		var userId = $('#userId').val();
		var notice = $('#notice').val();
		
		var notice = "notice,"+userId+","+notice;
		sock.send(notice);
		$('#notice').val("");
	}
			
	function inquiryReply() {
		var userId = $('#userId').val();
		var inquirySubject = $('#inquiry_subject').val();
		
		var inquiryReply = "inquiryReply,"+userId+","+inquirySubject;
		sock.send(inquiryReply);
	}
	
	function joinRoom() {
		var userId = $('#userId').val();
		var room_name = $('#room_name').val();
		var room_no = $('#room_no').val();
		
		var joinRoom = "joinRoom,"+userId+","+room_no+","+room_name;
		sock.send(joinRoom);
	}
	
	function sendChat() {
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
		
		var chatMsg = $('#message').val();
		var chat = "chat,${id},${room_no},"+chatMsg+","+date;
		sock.send(chat);
		
		$('#message').val(""); // 메세지로 입력한 글 지우기
	}
	
	function timeChange(time) {
		
		var hour1 = time.substr(16, 2);
		var minutes = time.substr(19, 2);
		var ampm;
		if (hour1 <12) {
			ampm = '오전';
		} else {
			ampm = '오후'
			hour2 = String(hour1 -12);
		}
		
		var changedTime = ampm+" "+hour2+" "+minutes;
		
		return changedTime;
	}

</script>

<div class = "column">
	<div class = "menu">
	
	<c:if test="${not empty id || id != '' }">
		<div>
			반가워요 ${id }
		</div>
	</c:if>
		
		
		<div>
			<button onclick="location.href='chatMemberList.do'" class="btn btn-info">채팅방</button>
		</div>
		<div>
			<button onclick="location.href='faq.do'" class="btn btn-success">고객센터</button>
		</div>
		<div>
			<button onclick="location.href='adminMain.do'" class="btn btn-info">관리자</button>
		</div>
		<div>
			<button onclick="location.href='communityMain.do'" class="btn btn-success">커뮤니티</button>
		</div>
		<div>
			<button onclick="location.href='notice.do'" class="btn btn-info">알림</button>
		</div>
		
		<div>
			<button onclick="location.href='main.do'" class="btn btn-dark">메인으로 가기</button>
		</div>
		
		<div>
			<button onclick="location.href='loginForm.do'" class="btn btn-dark">로그인으로 돌아가기</button>
		</div>
	</div>
	<!-- <div class = "menu">
		<input type="text" name="userId" id="userId" class="col-sm-8" style="resize: none;">
		<input type="text" name="notice" id="notice" class="col-sm-8" style="resize: none;">
		<button type="button" id="sendBtn1" class="col-sm-4 btn btn-info">메세지 보내기</button>
		<button type="button" id="loadStatus" class="col-sm-4 btn btn-info">접속자 확인</button>
		
	</div> -->
	</div>
	<div class = "menu2">
		<input type="text" name="noticePopUp" id="noticePopUp" class="form-control col-sm-8" style="resize: none; border: none;">
		<!-- <div class = "menu" id="PopUp"></div> -->
	</div>
	
	
