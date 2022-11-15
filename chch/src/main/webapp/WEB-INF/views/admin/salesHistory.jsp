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
<body>
	<div>
		<ul>
			<li>
				<input type="text" id="book_no" required="required" onfocus="onfocus">
			</li>
			<li>
				<input type="date" id="dateFrom" required="required">
			</li>
			<li>
				<input type="date" id="dateTo" required="required">
			</li>
			<li>
				<button type="button" id="searchBtn">조회</button>
			</li>
		</ul>
	</div>
	
	<div id="searchView"></div>
</body>
</html>