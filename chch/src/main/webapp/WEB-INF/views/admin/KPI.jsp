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
		
		if ($('#book_kind option:selected').val() == null || $('#book_kind option:selected').val() == "" || $('#dateFrom').val() == null || $('#dateFrom').val() =="" || $('#dateTo').val() == null || $('#dateTo').val() =="" || $('#cycle option:selected').val() == null || $('#cycle option:selected').val() == "") {
			alert("값을 입력하고 조회하세요");
			return false;
		}
		
		var url = "KPISelect.do?book_kind="
				+ $('#book_kind option:selected').val()
				+"&dateFrom="
				+ $('#dateFrom').val()
				+"&dateTo="
				+ $('#dateTo').val()
				+"&cycle="
				+ $('#cycle option:selected').val();
		$('#searchView').load(url);
	}
</script>


</head>
<body>
	<div>
		<ul>
			<li>
				<select id="book_kind" required="required" onfocus="onfocus">
					<option value="" selected disabled hidden="">카테고리</option>
					<option value="문학">문학</option>
					<option value="경제">경제</option>
					<option value="역사">역사</option>
					<option value="과학">과학</option>
				</select>
			</li>
			<li>
				<input type="date" id="dateFrom" required="required">
			</li>
			<li>
				<input type="date" id="dateTo" required="required">
			</li>
			<li>
				<select id="cycle" required="required">
					<option value="" selected disabled hidden="">집계 주기</option>
					<option value="1">일별</option>
					<option value="2">주별</option>
					<option value="3">월별</option>
				</select>
			</li>
			<li>
				<button type="button" id="searchBtn">조회</button>
			</li>
		</ul>
	</div>
	
	<div id="searchView"></div>
</body>
</html>