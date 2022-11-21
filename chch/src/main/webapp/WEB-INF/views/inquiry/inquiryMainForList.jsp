<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>

<style type="text/css">
@import url("/chch/resources/css/inquiry.css");
</style>

<script type="text/javascript">
	
	$(document).ready(function() {
		showPage('inquiryList.do?inquiryNumber=3');
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
		<div class="inquiry-top">
			<c:if test="${inquiryNumber==1 }">
				<button class="inquiryMenuBtn1" style="background-color: ##5055b1" onclick="showPage('faq.do?inquiryNumber=1')">FAQ</button>
				<button class="inquiryMenuBtn2"  onclick="showPage('inquirySelect.do?inquiryNumber=2')">1:1 문의하기</button>
				<button class="inquiryMenuBtn2"  onclick="showPage('inquiryList.do?inquiryNumber=3')">문의답변 확인</button>
			</c:if>
			<c:if test="${inquiryNumber==2 }">
				<button class="inquiryMenuBtn2" style="background-color: ##5055b1" onclick="showPage('faq.do?inquiryNumber=1')">FAQ</button>
				<button class="inquiryMenuBtn1"  onclick="showPage('inquirySelect.do?inquiryNumber=2')">1:1 문의하기</button>
				<button class="inquiryMenuBtn2"  onclick="showPage('inquiryList.do?inquiryNumber=3')">문의답변 확인</button>
			</c:if>
			<c:if test="${inquiryNumber==3 }">
				<button class="inquiryMenuBtn2" style="background-color: ##5055b1" onclick="showPage('faq.do?inquiryNumber=1')">FAQ</button>
				<button class="inquiryMenuBtn2"  onclick="showPage('inquirySelect.do?inquiryNumber=2')">1:1 문의하기</button>
				<button class="inquiryMenuBtn1"  onclick="showPage('inquiryList.do?inquiryNumber=3')">문의답변 확인</button>
			</c:if>
		</div>
		<div class="content">
		
			<div id="showPage">
				
			</div>
			
		</div>
	</div>
	
</body>
</html>