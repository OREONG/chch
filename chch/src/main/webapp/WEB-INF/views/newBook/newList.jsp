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
</head>

<body>

	<div>
		<h1>신작 도서</h1>
	</div>
	<div id="line"></div>
	<div>
		<c:if test="${empty list}">
		등록된 책이 없습니다
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="list" items="${list }">
				<div class="btn btn-success">
					<a href="${path }/newBook/newDetail.do?book_no=${list.book_no }&pageNum=${pageNum}">
					<img src="">
						<p>${list.book_title }</p>
						<p><fmt:formatNumber value="${list.book_price }" pattern="#,###" />원</p>
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
				<li><a href="newList.do?pageNum=1">
						<span class="glyphicon glyphicon-fast-backward"></span>
				</a></li>
				<li><a href="newList.do?pageNum=${pb.startPage-1 }">
						<span class="glyphicon glyphicon-triangle-left"></span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
				<c:if test="${pb.currentPage == i }">
					<li class="active"><a href="newList.do?pageNum=${i }">${i }</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li><a href="newList.do?pageNum=${i }">${i }</a></li>
				</c:if>
			</c:forEach>
			<!-- endPage보다 totalPage가 크면 보여줄 것이 뒤에 남아 있다 -->
			<c:if test="${pb.endPage < pb.totalPage}">
				<li><a href="newList.do?pageNum=${pb.endPage+1 }">
						<span class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
				<li><a href="newlist.do?pageNum=${pb.totalPage }">
						<span class="glyphicon glyphicon-fast-forward"></span>
				</a></li>
			</c:if>
		</ul>
	</div>

</body>
</html>