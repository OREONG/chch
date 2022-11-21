<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
@import url("/chch/resources/css/list.css");
@import url("/chch/resources/css/gallery.css");
@import url("/chch/resources/css/paging.css");
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('#like_usedBook').hide();
	});

	function newBook() {
		$('#like_usedBook').hide();
		$('#like_newBook').show();
	}
	function usedBook() {
		$('#like_newBook').hide();
		$('#like_usedBook').show();
	}
</script>
</head>
<body>
<div id="board_wrap">
	<div class="board_name">찜목록</div>
	<div class="select_view">
		<!-- 리스트 갤러리 버튼 -->
		<input type="button" value="새책만" onclick="newBook()" id="new">
		<input type="button" value="중고만" onclick="usedBook()" id="old">
	</div>
	<!-- 새책 찜목록 -->
	<div class="board_list_wrap">
		<div class="board_list" id="like_newBook">
			<div class="board_list_head">
				<div class="books" id="like">

					<c:if test="${not empty Booklike_list }">
						<c:forEach var="like" items="${Booklike_list }">
							<a href="#"> <img alt="책 이미지"
								src="resources/images/${like.book_image }" >
								<br>${like.book_title} <br class="price"> <fmt:formatNumber
									value="${like.book_price }" pattern="#,###" />원 <br> <input
								type="button" value="삭제" name="like_no" class="del"
								onclick="location.href='like_listDelete.do?like_no=${like.like_no}'">
							</a>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<c:if test="${empty Booklike_list }">
				<div id="show">새책도서 찜목록이 비었습니다.</div>
			</c:if>
		<!-- 페이징 -->
		<div class="paging-div">
 				<c:if test="${empty Booklike_list }">
				</c:if> 
				<c:if test="${not empty Booklike_list }">
					
					<ul class="pagination-ul">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="pre-btn">
								<a href="like_list.do&pageNum=1">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>
							<li class="pre-btn">
								<a href="like_list.do&pageNum=${pb.startPage-1 }">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active-btn">
									<a href="like_list.do&pageNum=${i }">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="non-active-btn">
									<a href="like_list.do&pageNum=${i }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="next-btn">
								<a href="like_list.do&pageNum=${pb.endPage }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
							<li class="next-btn">
								<a href="like_list.do&pageNum=${pb.endPage+1 }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
						</c:if>
					</ul>
					
				</c:if>
		</div>
		<!-- 페이징 끝 -->
		</div>
	</div>
	<!-- 중고책 찜목록 -->
	<div class="board_list_wrap">
		<div class="board_list" id="like_usedBook">
			<div class="board_list_head">
				<div class="books">

					<c:if test="${not empty Usedlike_list }">
						<c:forEach var="like" items="${Usedlike_list }">
							<a href="#"> <img alt="책 이미지"
								src="resources/images/${like.used_image }">
								<br>${like.used_subject} <br class="price"> <fmt:formatNumber
									value="${like.used_price }" pattern="#,###" />원 <br> <input
								type="button" value="삭제" name="like_no" class="del"
								onclick="location.href='like_listDelete.do?like_no=${like.like_no}'">
							</a>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<c:if test="${empty Usedlike_list }">
				<div id="show">중고도서 찜목록이 비었습니다.</div>
			</c:if>
			<!-- 페이징 -->
		<div class="paging-div">
 				<c:if test="${empty Usedlike_list }">
				</c:if> 
				<c:if test="${not empty Usedlike_list }">
					
					<ul class="pagination-ul">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="pre-btn">
								<a href="like_list.do&pageNum=1">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>
							<li class="pre-btn">
								<a href="like_list.do&pageNum=${pb.startPage-1 }">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active-btn">
									<a href="like_list.do&pageNum=${i }">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="non-active-btn">
									<a href="like_list.do&pageNum=${i }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="next-btn">
								<a href="like_list.do&pageNum=${pb.endPage }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
							<li class="next-btn">
								<a href="like_list.do&pageNum=${pb.endPage+1 }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
						</c:if>
					</ul>
					
				</c:if>
		</div>
		<!-- 페이징 끝 -->
		</div>
	</div>
	
	
	<div class="board_mainbtns">
		<a href="cart.do"
			class="board_bigorderbtn left">장바구니 가기</a> 
			<a href="main.do" class="board_bigorderbtn right">메인으로</a>
	</div>

</div>
</body>
</html>