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

	<div align="right">
		<h1>"${keyword}" 신작 검색 결과</h1>
	</div>
	<div id="line"></div>
	
	<div align="center">
		<c:if test="${empty searchList}">
		검색 결과가 없습니다
		</c:if>
		<c:if test="${not empty searchList}">
			<c:forEach var="book" items="${searchList }">
				<div class="btn" style="width: 45%; margin-top: 5px">
					<a href="newDetail.do?book_no=${book.book_no }">
					<img src="/chch/resources/images/${book.book_image}">
						<p>${book.book_title }</p>
						<p><fmt:formatNumber value="${book.book_price }" pattern="#,###" />원</p>
						<div class="star_avg">
							<c:if test="${book.star_avg <= 0.4}">☆☆☆☆☆</c:if>
							<c:if test="${book.star_avg >= 0.5 && book.star_avg < 1.4}">★☆☆☆☆</c:if>
							<c:if test="${book.star_avg >= 1.5 && book.star_avg < 2.4}">★★☆☆☆</c:if>
							<c:if test="${book.star_avg >= 2.5 && book.star_avg < 3.4}">★★★☆☆</c:if>
							<c:if test="${book.star_avg >= 3.5 && book.star_avg < 4.4}">★★★★☆</c:if>
							<c:if test="${book.star_avg >= 4.5}">★★★★★</c:if>
							 &nbsp;(${book.review_cnt })
						</div>
					</a>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<div id="line2"></div>
	
	<div>
		<h1>"${keyword}" 중고 검색 결과</h1>
	</div>
	<div id="line"></div>
	<div class="products">

		<c:if test="${empty usedSearchList}">
		검색 결과가 없습니다
		</c:if>
		<c:if test="${not empty usedSearchList}">
			<c:forEach var="used" items="${usedSearchList }">
				<div class="btn" style="width: 24%; height: auto; margin-top: 5px">
					<a href="usedDetail.do?used_no=${used.used_no }&book_no=${used.book_no }">
						<img style="width: 50%; height: auto;" src="/chch/resources/images/${used.used_image}">
						<p>
							<c:if test="${ used.used_status=='y'}">[판매완료]</c:if>
							<c:if test="${ used.used_status=='r'}">[예약중]</c:if>
							${used.used_subject }
						</p>
						<p class="price"><fmt:formatNumber value="${used.used_price }" pattern="#,###"/>원</p>
					</a>
				</div>
			</c:forEach>
		</c:if>
	</div> 

	<div id="line2"></div>
	
	
</body>
</html>