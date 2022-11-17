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
<style type="text/css">
@import url("/chch/resources/css/list.css");
@import url("/chch/resources/css/gallery.css");
@import url("/chch/resources/css/paging.css");
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#chkAll").click(function() {
				if ($("#chkAll").is(":checked"))
					$("input[name=chk]").prop("checked", true);
				else
					$("input[name=chk]").prop("checked", false);
			});

			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;

				if (total != checked)
					$("#chkAll").prop("checked", false);
				else
					$("#chkAll").prop("checked", true);
			});
		});
		function delSelect() {
			var purchase_Select = "";
			$('input[name=chk]:checked').each(function() {
				purchase_Select += $(this).next('.no').val() + ",";
			});
			/* alert(purchase_Select); */
			location.href = "purchase_DelAll.do?purchase_Select="
					+ purchase_Select;
		}

		$(document).ready(function() {
			$('#gallery_Area').hide();
		});

		function list() {
			$('#gallery_Area').hide();
			$('#list_Area').show();
		}
		function gallery() {
			$('#list_Area').hide();
			$('#gallery_Area').show();
		}
	</script>
	<div id="board_wrap">
		<div class="board_name">구매목록</div>
		<div class="select_view">
			<!-- 리스트 갤러리 버튼 -->
			<button onclick="list()">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
	 		 <path fill-rule="evenodd"
						d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
		</svg>
			</button>
			<button onclick="gallery()">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-grid-3x3-gap" viewBox="0 0 16 16">
	  		<path
						d="M4 2v2H2V2h2zm1 12v-2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zm0-5V7a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zm0-5V2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zm5 10v-2a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zm0-5V7a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zm0-5V2a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zM9 2v2H7V2h2zm5 0v2h-2V2h2zM4 7v2H2V7h2zm5 0v2H7V7h2zm5 0h-2v2h2V7zM4 12v2H2v-2h2zm5 0v2H7v-2h2zm5 0v2h-2v-2h2zM12 1a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1h-2zm-1 6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V7zm1 4a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-2a1 1 0 0 0-1-1h-2z" />
		</svg>
			</button>
		</div>

		<div class="board_list_wrap">
			<div class="board_list" id="list_Area">
				<div class="board_list_head">
					<div class="checkbox">
						<input type="checkbox" id="chkAll" name="chkAll"
							onclick="chkAll()" />
					</div>
					<div class="num">번호</div>
					<div class="img">책이미지</div>
					<div class="product">상품정보</div>
					<div class="tot">수량</div>
					<div class="info">구매날짜</div>
					<div class="used_subject">상품상태</div>
					<div class="price">가격</div>
					<div class="delete">삭제</div>
				</div>

				<div class="board_list_body">
					<c:if test="${empty purchase_list }">
						<div id="show">구매목록이 없습니다.</div>
					</c:if>
					<c:if test="${not empty purchase_list }">
						<c:forEach var="deal" items="${purchase_list }">
							<c:set var="i" value="${i+1 }" />
							<div class="item">
								<div class="checkbox">
									<input type="checkbox" name="chk" onclick="check()"> <input
										type="hidden" value="${deal.deal_no}" class="no">

								</div>
								<div class="num">${i }</div>
								<div class="img">
									<a href="#"> <img alt="책이미지"
										src="resources/images/${deal.book_image }" style="width: 10%">
									</a>
								</div>
								<div class="product">
									제목 : ${deal.book_title }<br>저자 : ${deal.book_author }
								</div>
								<div class="tot">${deal.deal_count }</div>
								<div class="info">${deal.deal_Date}</div>

								<div class="used_subject">
									<c:if test="${empty deal.used_no }">
					[새책]
					</c:if>
									<c:if test="${not empty deal.used_no }">
					[중고]
					</c:if>
								</div>
								<div class="price">
									<fmt:formatNumber value="${deal.deal_price }" pattern="#,###" />
									원
								</div>
								<div class="delete">
									<input type="button" value="삭제" name="deal_no" class="del"
										onclick="location.href='purchase_list_Update.do?deal_no=${deal.deal_no}'">
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>

				<div class="select_product">

					<button class="board_list_optionbtn_del" type="button"
						id="deleteButton" onclick="delSelect()">선택 삭제</button>
					<!-- <input type="hidden" name="cartList" /> <a href="#"
			class="board_list_optionbtn_like">선택상품 찜</a> -->
				</div>
			</div>
		</div>
	
	
	<div class="board_list_wrap">
		<div class="board_list" id="gallery_Area">
			<div class="board_list_head">
				<!-- <div class="board_list_body"> -->
				<div class="books" id="like">

					<c:if test="${not empty purchase_list }">

						<c:forEach var="deal" items="${purchase_list }">

							<a href="#"> <img alt="책이미지"
								src="resources/images/${deal.book_image }"> <br>${deal.book_title }
								<br class="price">
							<fmt:formatNumber value="${deal.deal_price }" pattern="#,###" />원
							</a>

						</c:forEach>
					</c:if>
				</div>
				<!-- </div> -->

			</div>
			<c:if test="${empty purchase_list }">
				<div id="show">구매목록이 없습니다.</div>
			</c:if>
		</div>
	</div>
	</div>
	<!-- 페이징 -->
			<div class="paging-div">
				<c:if test="${empty purchase_list }">
				</c:if>
				<c:if test="${not empty purchase_list }">

					<ul class="pagination-ul">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="pre-btn"><a
								href="purchase_list.do?id=${id}&pageNum=1"> <span
									class="glyphicon glyphicon-chevron-left"></span>
							</a></li>
							<li class="pre-btn"><a
								href="purchase_list.do?id=${id}&pageNum=${pb.startPage-1 }">
									<span class="glyphicon glyphicon-chevron-left"></span>
							</a></li>
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active-btn"><a
									href="purchase_list.do?id=${id}&pageNum=${i }">${i }</a></li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="non-active-btn"><a
									href="purchase_list.do?id=${id}&pageNum=${i }">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="next-btn"><a
								href="purchase_list.do?id=${id}&pageNum=${pb.endPage }"> <span
									class="glyphicon glyphicon-chevron-right"></span>
							</a></li>
							<li class="next-btn"><a
								href="purchase_list.do?id=${id}&pageNum=${pb.endPage+1 }"> <span
									class="glyphicon glyphicon-chevron-right"></span>
							</a></li>
						</c:if>
					</ul>

				</c:if>
			</div>
			<!-- 페이징 끝 -->
	<div class="board_mainbtns">
		<a href="main.do" class="board_bigorderbtn left">메인으로</a>
	</div>
</body>
</html>