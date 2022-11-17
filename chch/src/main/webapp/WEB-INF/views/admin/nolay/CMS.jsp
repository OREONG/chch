<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>

<script type="text/javascript">

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
	<div class="cms-top">
		<c:if test="${cms==0 }">
			<button class="cmsMenuBtn2" style="background-color: ##5055b1" onclick="showPage('KPI.do?cms=1')">판매 실적</button>
			<button class="cmsMenuBtn2"  onclick="showPage('salesRanking.do?cms=2')">판매 순위</button>
			<button class="cmsMenuBtn2"  onclick="showPage('salesHistory.do?cms=3')">구매 내역</button>
		</c:if>
		<c:if test="${cms==1 }">
			<button class="cmsMenuBtn1" style="background-color: ##5055b1" onclick="showPage('KPI.do?cms=1')">판매 실적</button>
			<button class="cmsMenuBtn2"  onclick="showPage('salesRanking.do?cms=2')">판매 순위</button>
			<button class="cmsMenuBtn2"  onclick="showPage('salesHistory.do?cms=3')">구매 내역</button>
		</c:if>
		<c:if test="${cms==2 }">
			<button class="cmsMenuBtn2" style="background-color: ##5055b1" onclick="showPage('KPI.do?cms=1')">판매 실적</button>
			<button class="cmsMenuBtn1"  onclick="showPage('salesRanking.do?cms=2')">판매 순위</button>
			<button class="cmsMenuBtn2"  onclick="showPage('salesHistory.do?cms=3')">구매 내역</button>
		</c:if>
		<c:if test="${cms==3 }">
			<button class="cmsMenuBtn2" style="background-color: ##5055b1" onclick="showPage('KPI.do?cms=1')">판매 실적</button>
			<button class="cmsMenuBtn2"  onclick="showPage('salesRanking.do?cms=2')">판매 순위</button>
			<button class="cmsMenuBtn1"  onclick="showPage('salesHistory.do?cms=3')">구매 내역</button>
		</c:if>
	</div>
	
	<div>
	
	</div>
</body>
</html>