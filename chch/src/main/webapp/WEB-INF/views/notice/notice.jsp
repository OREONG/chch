<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
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
	    $('#sendBtn').click(function() { send(); });
		
	    $('#notice').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				send();
			}
		});
	    
		// toast생성 및 추가
		function onMessage(evt){
		    if (evt.data.substr(0,6)=="notice") {
			    view = evt.data.substr(7);
		    	$("#noticePopUp").children().remove();
			    $("#noticePopUp").val(view);
		    	
		    } else {
		    	
			    var list = evt.data;
			    
			    var list1 = list.substr(1);
			    var list2 = list1.substr(-0, list1.length-1);
			    
			    var splitList = list2.split(",");
			    
			    splitList[0]
			    
			    var view ="";
			    for (i = 0; i < splitList.length; i++ ) {
			    	var splitList2 = splitList[i].split("\"");
			    	view = view+"<div>"+splitList2[1]+"</div>";
			    }
			    
			    $("#popUp").children().remove();
			    $("#popUp").append(view);
		    }
		};
		
		function loadStatus() {
			var status = "status,${id}";
			sock.send(status);
		}
		
		function send() {
			var userId = $('#userId').val();
			var notice = $('#notice').val();
			
			var notice = "notice,"+userId+","+notice;
			sock.send(notice);
			$('#notice').val("");
		}
	});

	function disconnect() {
		console.log("ws 종료");
		sock.close();
	}


</script>
</head>
<body>
<div>
	<div id="popUp"></div>
	
	<div>
		<button type="button" id="close" class="col-sm-4 btn btn-secondary">ws종료</button>
	</div>
	
	<div>
		<button type="button" id="loadStatus" class="col-sm-4 btn btn-info">접속자 확인</button>
	</div>
	
	<div>
		<br>
		<input type="text" name="userId" id="userId" class="form-control col-sm-8" style="resize: none;">
		<input type="text" name="notice" id="notice" class="form-control col-sm-8" style="resize: none;">
		<button type="button" id="sendBtn" class="col-sm-4 btn btn-info">메세지 보내기</button>
		<br><hr>
	</div>
	
	
	<div>
		<br>
		<input type="text" name="noticePopUp" id="noticePopUp" class="form-control col-sm-8" style="resize: none; border: none;">
	</div>
</div>
	

</body>
</html>