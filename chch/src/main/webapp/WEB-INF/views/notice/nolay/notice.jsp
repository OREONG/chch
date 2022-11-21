<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
	    $('#sendBtn1').click(function() { sendNotice(); });
	    $('#loadStatus').click(function() { loadStatus(); });
	    
	    $('#notice').keypress(function() { // enter키를 누르면 메세지 전송
			//  누른 key값(asscii)  IE ?      IE의 값         IE아닌 모든 web값
			var keycode = event.keyCode ? event.keyCode : event.which;
			if (keycode == 13) { // 13이 enter(assii값)
				sendNotice();
			}
		});
	}); 
	
	function sendNotice() {
		var userId = $('#userId').val();
		var notice = $('#notice').val();
		
		var notice = "notice,"+userId+","+notice;
		sock.send(notice);
		$('#notice').val("");
	}
	
	function loadStatus() {
		var status = "status,${id}";
		sock.send(status);
	}
	
</script>


</head>
<body>
	<div class = "menu">
		<input type="text" name="userId" id="userId" class="col-sm-8" style="resize: none;">
		<input type="text" name="notice" id="notice" class="col-sm-8" style="resize: none;">
		<button type="button" id="sendBtn1" class="col-sm-4 btn btn-info">메세지 보내기</button>
		<button type="button" id="loadStatus" class="col-sm-4 btn btn-info">접속자 확인</button>
	</div>
	<div class = "menu" id="PopUp" style="display: flex; flex-direction: column;"></div>
</body>
</html>