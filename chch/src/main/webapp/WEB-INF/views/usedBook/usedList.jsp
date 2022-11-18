<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>책첵!</title>
<meta charset="utf-8" />
<script type="text/javascript" src="/chch/resources/js/jquery.js"></script>
<style type="text/css">@import url("/chch/resources/css/usedList.css");</style>
</head>
<body>

	<div>
		<h1>중고 도서</h1>
	</div>
	<div id="line"></div>
	
	<div class="selectBox">
		<a href="usedList.do?status=n">거래가능만 보기</a>&nbsp;|
		<a href="usedList.do">모두 보기</a>
	</div>
	
	<div class="products">
		<c:if test="${empty list}">
		등록된 책이 없습니다
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="list" items="${list }">
				<div class="btn" style="width: 24%; height: auto; margin-top: 5px">
					<a href="usedDetail.do?used_no=${list.used_no }&book_no=${list.book_no }">
						<img style="width: 50%; height: auto;" src="/chch/resources/images/${list.used_image}">
						<p>
							${list.used_subject }
						</p>
						<p class="price"><fmt:formatNumber value="${list.used_price }" pattern="#,###"/>원</p>
						<p>
							<c:if test="${ list.used_status=='n'}">[판매중]</c:if>
							<c:if test="${ list.used_status=='r'}">[예약중]</c:if>
							<c:if test="${ list.used_status=='y'}">[판매완료]</c:if>
							<c:if test="${ list.used_status=='f'}">[판매완료]</c:if>
						</p>
					</a>
				</div>
			</c:forEach>
		</c:if>
	</div> 

	<div id="line2"></div>


	<!-- 페이징 시작 -->
	<div align="center">
		<ul class="pagination">
			<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 것이 있다 -->
			<c:if test="${pb.startPage > pb.pagePerBlock}">
				<li><a href="usedList.do?pageNum=1"> <span
						class="glyphicon glyphicon-fast-backward"></span>
				</a></li>
				<li><a href="usedList.do?pageNum=${pb.startPage-1 }"> <span
						class="glyphicon glyphicon-triangle-left"></span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
				<c:if test="${pb.currentPage == i }">
					<li class="active"><a href="usedList.do?pageNum=${i }">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li><a href="usedList.do?pageNum=${i }">${i }</a></li>
				</c:if>
			</c:forEach>
			<!-- endPage보다 totalPage가 크면 보여줄 것이 뒤에 남아 있다 -->
			<c:if test="${pb.endPage < pb.totalPage}">
				<li><a href="usedList.do?pageNum=${pb.endPage+1 }"> <span
						class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
				<li><a href="usedlist.do?pageNum=${pb.totalPage }"> <span
						class="glyphicon glyphicon-fast-forward"></span>
				</a></li>
			</c:if>
		</ul>
	</div>
	

</body>
</html>