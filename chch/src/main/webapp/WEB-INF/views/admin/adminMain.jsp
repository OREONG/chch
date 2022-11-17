<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/chch/resources/css/admin.css");
@import url("/chch/resources/css/pagingOnclick.css");
</style>

<script type="text/javascript">

/* $(document).ready(function() {
	showPage('adminMemberList.do');
}); */

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
			<div class="side-menu">
				<button class="menuBtn" onclick="showPage('adminMemberList.do')">회원관리</button>
				<button class="menuBtn" onclick="showPage('adminBookList.do')">책관리</button>
				<button class="menuBtn" onclick="showPage('adminInquiryBeforeList.do?inquiryNumber=1')">문의사항관리</button>
				<button class="menuBtn" onclick="showPage('CMS.do?cms=0')">CMS</button>
				<button class="menuBtn" onclick="showPage('notice.do')">접속 현황</button>
			</div>
			<div id="showPage">
				
			</div>
		</div>
	</div>

</body>
</html>