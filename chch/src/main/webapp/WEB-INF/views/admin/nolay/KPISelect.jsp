<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>

<style type="text/css">
	.table-li { padding: 10px; }
</style>

<script type="text/javascript">

	

	function movePage(page) {
		
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
				+ $('#cycle option:selected').val()
				+"&pageNum="+page;
		$('#searchView').load(url);
	}
</script>


</head><body>
	<div>
			<div align="center">
				<ul>
					<li class="table-li">
						<div>번호</div>
					</li>
					<li class="table-li">
						<div>날짜</div>
					</li>
					<li class="table-li">
						<div>판매액</div>
					</li>
				</ul>
			</div>
			<c:if test="${empty KPI }">
				<div>데이터가 없습니다</div>
			</c:if>
			<c:if test="${not empty KPI }">
				<c:forEach var="list" items="${KPI }">
					<ul>
						<li class="table-li">
							<div>${list.rn }</div>
						</li>
						<li class="table-li">
							<div>${list.s_date }</div>
						</li>
						<li class="table-li">
							<div>${list.total_sales }</div>
						</li>
					</ul>
				</c:forEach>
			</c:if>
		</div>
		
		<div align="center">
			<c:if test="${startPage > PAGE_PER_BLOCK }">
				<button type="button" onclick="movePage('${startPage - 1}')" >이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${currentPage == i }">
					<button type="button" onclick="movePage('${i}')" >${i }</button>
				</c:if>
				<c:if test="${currentPage != i }">
					<button type="button" onclick="movePage('${i}')">${i }</button>
				</c:if>
			</c:forEach>
			<c:if test="${totalPage > endPage }">
				<button type="button" onclick="movePage('${endPage + 1}')" >다음</button>
			</c:if>
		</div>
		
</body>
</html>