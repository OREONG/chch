<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>책첵!</title>
<meta charset="utf-8" />
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">@import url("/chch/resources/css/newList.css");</style>
</head>

<body>

	<div align="center">
		<h1>${book_kind} 신작 도서</h1>
	</div>
	<div id="line"></div>
	
	<div id="product_order_list">
			<p>
			<a href="newList.do?book_kind=${book_kind}&order=publish">출간순</a>&nbsp;|
<%-- 			<a href="newList.do?book_kind=${book_kind}&order=best">베스트셀러</a>&nbsp;| --%>
			<a href="newList.do?book_kind=${book_kind}&order=review">리뷰많은순</a>&nbsp;|
			<a href="newList.do?book_kind=${book_kind}&order=lowPrice">낮은가격순</a>&nbsp;|
			<a href="newList.do?book_kind=${book_kind}&order=highPrice">높은가격순</a>&nbsp;|
			<a href="newList.do?book_kind=${book_kind}&order=title">제목순</a> </p>
		</div>
	
	<div class="products">
		<c:if test="${empty bookList}">
		등록된 책이 없습니다
		</c:if>
		<c:if test="${not empty bookList}">
			<c:forEach var="book" items="${bookList }">
			<a href="newDetail.do?book_no=${book.book_no }">
				<div class="book_list">
					<div class="img-div"><img src="/chch/resources/images/${book.book_image}"></div>
					<div class="title">${book.book_title }</div>
					<div><fmt:formatNumber value="${book.book_price }" pattern="#,###" />원</div>
					
						<div class="star_avg">
							<c:if test="${book.star_avg <= 0.4}">☆☆☆☆☆</c:if>
							<c:if test="${book.star_avg >= 0.5 && book.star_avg < 1.4}">★☆☆☆☆</c:if>
							<c:if test="${book.star_avg >= 1.5 && book.star_avg < 2.4}">★★☆☆☆</c:if>
							<c:if test="${book.star_avg >= 2.5 && book.star_avg < 3.4}">★★★☆☆</c:if>
							<c:if test="${book.star_avg >= 3.5 && book.star_avg < 4.4}">★★★★☆</c:if>
							<c:if test="${book.star_avg >= 4.5}">★★★★★</c:if>
							 &nbsp;(${book.review_cnt })
						</div>
					
					</div>
				</a>
			</c:forEach>
		</c:if>
	</div>

	<div id="line2"></div>
	
	<!-- 페이징 -->
		<div class="paging-div">
 				<c:if test="${empty bookList }">
				</c:if> 
				<c:if test="${not empty bookList }">
					
					<ul class="pagination-ul">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="pre-btn">
								<a href="newList.do?pageNum=1&book_kind=${book_kind }&order=${order}">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>
							<li class="pre-btn">
								<a href="newList.do?pageNum=${pb.startPage-1 }&book_kind=${book_kind }&order=${order}">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active-btn">
									<a href="newList.do?pageNum=${i }&book_kind=${book_kind }&order=${order}">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="non-active-btn">
									<a href="newList.do?pageNum=${i }&book_kind=${book_kind }&order=${order}">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="next-btn">
								<a href="newList.do?pageNum=${pb.endPage }&book_kind=${book_kind }&order=${order}">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
							<li class="next-btn">
								<a href="newlist.do?pageNum=${pb.totalPage+1 }&book_kind=${book_kind }&order=${order}">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
						</c:if>
					</ul>
					
				</c:if>
		</div>
		<!-- 페이징 끝 -->
</body>
</html>