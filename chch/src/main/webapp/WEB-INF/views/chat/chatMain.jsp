<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/chch/resources/css/chat.css");
@import url("/chch/resources/css/pagingOnclick.css");
</style>

<script type="text/javascript">

$(document).ready(function() {
	showPage('chatMemberList.do');
});

	function showPage(data) {
		var addr = data;
		
		console.log(addr);

		var ajaxOption = {
			url : addr,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};

		$.ajax(ajaxOption).done(function(data) {
			$('#showPage').children().remove();
			$('#showPage').html(data);
		});
	};
</script>

</head>
<body>

	<div class="main-container">
		<div class="content">
			<div id="showPage">
			</div>
		</div>
	</div>

</body>
</html>