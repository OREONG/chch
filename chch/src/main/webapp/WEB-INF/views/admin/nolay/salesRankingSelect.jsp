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
		
		if ($('#book_kind option:selected').val() == null || $('#book_kind option:selected').val() == "" || $('#dateFrom').val() == null || $('#dateFrom').val() =="" || $('#dateTo').val() == null || $('#dateTo').val() =="" || $('#sort option:selected').val() == null || $('#sort option:selected').val() == "") {
			alert("값을 입력하고 조회하세요");
			return false;
		}
		
		var url = "salesRankingSelect.do?book_kind="
				+ $('#book_kind option:selected').val()
				+"&dateFrom="
				+ $('#dateFrom').val()
				+"&dateTo="
				+ $('#dateTo').val()
				+"&sort="
				+ $('#sort option:selected').val()
				+"&pageNum="+page;
		$('#searchView').load(url);
	}
</script>


</head><body>
	<div>
			<div align="center">
				<ul>
					<li class="table-li">
						<div>책번호</div>
					</li>
					<li class="table-li">
						<div>제목</div>
					</li>
					<li class="table-li">
						<div>분야</div>
					</li>
					<li class="table-li">
						<div>작가</div>
					</li>
					<li class="table-li">
						<div>출판사</div>
					</li>
					<li class="table-li">
						<div>출간일</div>
					</li>
					<li class="table-li">
						<div>판매량</div>
					</li>
					<li class="table-li">
						<div>판매금액</div>
					</li>
				</ul>
			</div>
			<c:if test="${empty salesRanking }">
				<div>데이터가 없습니다</div>
			</c:if>
			<c:if test="${not empty salesRanking }">
				<c:forEach var="list" items="${salesRanking }">
					<ul>
						<li class="table-li">
							<div>${list.book_no }</div>
						</li>
						<li class="table-li">
							<div>${list.book_title }</div>
						</li>
						<li class="table-li">
							<div>${list.book_kind }</div>
						</li>
						<li class="table-li">
							<div>${list.book_author }</div>
						</li>
						<li class="table-li">
							<div>${list.book_publisher }</div>
						</li>
						<li class="table-li">
							<div>${list.book_publish_date }</div>
						</li>
						<li class="table-li">
							<div>${list.deal_count }</div>
						</li>
						<li class="table-li">
							<div>${list.deal_price }</div>
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