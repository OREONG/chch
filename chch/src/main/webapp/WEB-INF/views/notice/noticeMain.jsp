<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>

<style type="text/css">
@import url("/chch/resources/css/notice.css");
</style>

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
	<div class="main-container">
		<div class="content">
			<div id="showPage">
				<div id="notice-box">
					<div class="notice-title">
						알림
					</div>
					<div style="cursor: pointer;" OnClick="location.href ='chatMemberList.do'">
						<div>대화방에 
							<input type="text" name="unreadChat" id="unreadChat" class="unreadInput" readonly="readonly">
						 개의 새로운 메세지가 있습니다
						<hr>
						</div>
					</div>
					
					<div style="cursor: pointer;" OnClick="location.href ='inquiryMainForList.do'">
						<div>
							<input type="text" name="unreadInquiry" id="unreadInquiry" class="unreadInput" readonly="readonly">
							개의 읽지 않은 문의 답변이 있습니다
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>