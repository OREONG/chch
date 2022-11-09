<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var socket  = null;
	$(document).ready(function(){
	    // 웹소켓 연결
	    sock = new SockJS("<c:url value="/echo.do"/>");
	    socket = sock;
	    
	    sock.onopen = function() {
		    console.log('open ws')
	    };
	
	    // 데이터를 전달 받았을때 
	    sock.onmessage = onMessage; // toast 생성
	    
	    $('#close').click(function() { disconnect(); });
	    $('#loadStatus').click(function() { loadStatus(); });
	
	    function loadStatus() {
			var msg = "status, ${id}";

			// ajax로 채팅 내용 저장
			websocket.send(JSON.stringify(option));
			$('#message').val(""); // 메세지로 입력한 글 지우기
		}

	function disconnect() {
		console.log("ws 종료");
		sock.close();
	}
})

</script>
</head>
<body>
	<div id="popUp"></div>
	<div>
		<button type="button" id="loadStatus" class="col-sm-4 btn btn-secondary">접속자 확인</button>
	</div>
	

</body>
</html>