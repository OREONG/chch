<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	$(function() {$('#searchBtn').click(function() { selectPage(); })});

	function selectPage() {
		
		if ($('#book_no').val() == null || $('#book_no').val()=="" || $('#dateFrom').val() == null || $('#dateFrom').val() =="" || $('#dateTo').val() == null || $('#dateTo').val() =="" ) {
			alert("값을 입력하고 조회하세요");
			return false;
		}
		
		var url = "salesHistorySelect.do?book_no="
				+ $('#book_no').val()
				+"&dateFrom="
				+ $('#dateFrom').val()
				+"&dateTo="
				+ $('#dateTo').val()
		$('#searchView').load(url);
	}
</script>


</head>
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
<body>
	<div>
		<ul class="kpi-sub-top">
			<li>
				<input type="text" id="book_no" class="input-text" required="required" onfocus="onfocus">
			</li>
			<li>
				<input type="date" id="dateFrom" class="input-date" required="required">
			</li>
			<li>
				<input type="date" id="dateTo" class="input-date" required="required">
			</li>
			<li>
				<button type="button" id="searchBtn" class="cms-action-btn">조회</button>
			</li>
		</ul>
	</div>
	
	<div id="searchView"></div>
</body>
</html>