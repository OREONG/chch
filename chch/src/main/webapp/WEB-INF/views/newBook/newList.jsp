<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>책첵!</title>
<meta charset="utf-8" />
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">body{margin-top: 100px;}</style>
</head>

<body>

	<div align="center">
		<h1>${book_kind} 신작 도서</h1>
	</div>
	
	<div id="product_order_list">
			<p>
			<a href="${path }/newBook/newList.do?book_kind=${book_kind}&order=publish">출간순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${path }/newBook/newList.do?book_kind=${book_kind}&order=best">베스트셀러</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${path }/newBook/newList.do?book_kind=${book_kind}&order=review">리뷰많은순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${path }/newBook/newList.do?book_kind=${book_kind}&order=lowPrice">낮은가격순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${path }/newBook/newList.do?book_kind=${book_kind}&order=highPrice">높은가격순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${path }/newBook/newList.do?book_kind=${book_kind}&order=title">제목순</a> </p>
		</div>
	
	<div id="line"></div>
	<div align="center">
		<c:if test="${empty bookList}">
		등록된 책이 없습니다
		</c:if>
		<c:if test="${not empty bookList}">
			<c:forEach var="book" items="${bookList }">
				<div class="btn btn-outline" style="width: 45%; margin-top: 5px">
					<a href="${path }/newBook/newDetail.do?book_no=${book.book_no }">
					<img src="">
						<p>${book.book_title }</p>
						<p><fmt:formatNumber value="${book.book_price }" pattern="#,###" />원</p>
						<div>
							 ★★★★★ ${book.star_avg }&nbsp;리뷰(${book.review_cnt })
						</div>
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
				<li><a href="newList.do?pageNum=1&book_kind=${book_kind }&order=${order}">
						<span class="glyphicon glyphicon-fast-backward"></span>
				</a></li>
				<li><a href="newList.do?pageNum=${pb.startPage-1 }&book_kind=${book_kind }&order=${order}">
						<span class="glyphicon glyphicon-triangle-left"></span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
				<c:if test="${pb.currentPage == i }">
					<li class="active"><a href="newList.do?pageNum=${i }&book_kind=${book_kind }&order=${order}">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li><a href="newList.do?pageNum=${i }&book_kind=${book_kind }&order=${order}">${i }</a></li>
				</c:if>
			</c:forEach>
			<!-- endPage보다 totalPage가 크면 보여줄 것이 뒤에 남아 있다 -->
			<c:if test="${pb.endPage < pb.totalPage}">
				<li><a href="newList.do?pageNum=${pb.endPage+1 }&book_kind=${book_kind }&order=${order}">
						<span class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
				<li><a href="newlist.do?pageNum=${pb.totalPage }&book_kind=${book_kind }&order=${order}">
						<span class="glyphicon glyphicon-fast-forward"></span>
				</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>