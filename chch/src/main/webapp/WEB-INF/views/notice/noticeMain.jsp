<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>
<script type="text/javascript">

	$(document).ready(function(){
	    loadUnreadChat();
	    loadUnreadInquiry();
	});

	function loadUnreadChat() {
		
		var id = '${id}';
		
		$.post('loadUnreadChat.do', 'id='+id, function(data) {
			$("#unreadChat").val(data);
		});
	}
	
function loadUnreadInquiry() {
		
		var id = '${id}';
		
		$.post('loadUnreadInquiry.do', 'id='+id, function(data) {
			$("#unreadInquiry").val(data);
		});
	}
	
</script>
</head>
<body>
	<div style="cursor: pointer;" OnClick="location.href ='chatMemberList.do'">
		<div>대화방에</div>
		<div>
			<input type="text" name="unreadChat" id="unreadChat" style="resize: none; border: none; width: 50px; background-color: #ffffff; color: #808080;" readonly="readonly">
		</div>
		<div>개의 새로운 메세지가 있습니다</div>
		<hr>
	</div>
	
	<div style="cursor: pointer;" OnClick="location.href ='inquiryList.do?inquiryNumber=2'">
		<div>
			<input type="text" name="unreadInquiry" id="unreadInquiry" style="resize: none; border: none; width: 50px; background-color: #ffffff; color: #808080;" readonly="readonly">
		</div>
		<div>개의 읽지 않은 문의 답변이 있습니다</div>
		<hr>
	</div>
	
</body>
</html>