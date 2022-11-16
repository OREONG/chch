<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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
@import url("${path}/resources/css/list.css");
@import url("${path}/resources/css/gallery.css");
</style>
<style type="text/css">
@import url("/chch/resources/css/paging.css");
</style>
<script>
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
		var cart_nos = "";
		$('input[name=chk]:checked').each(function() {
			cart_nos += $(this).next('.no').val()+",";			
		});
		  if(confirm("장바구니를 비우시겠습니까?")) {
		  location.href="delAll.do?cart_nos="+cart_nos; 
			  
		  }
	}
	
	function order() {
		if ($("input:checkbox[name='chk']").is(":checked")==false) {
			alert("주문할 상품을 선택해주십시오");
			return;
		}
		var cart_no = "";
		$('input[name=chk]:checked').each(function() {
			cart_no += $(this).next('.no').val()+",";			
		});
		 	location.href="purchaseStep1.do?cart_no="+cart_no; 
		}
		
	 function check() {
		 var total;
		 var sum = 0;
		 var delivery = 0;
		 if (isNaN($('#totalpro').text())) {
			 total = 0;
		 } else total = parseInt($('#totalpro').text());
		  $('input[name=chk]:checked').each(function() {
			total += parseInt($(this).nextAll('.totalprice').val());
		}); 
		  if (total <= 30000){
			  delivery = 3000;
			  total += 3000;
		  }else 
			  delivery = 0;
		var total_txt = Number(total).toLocaleString();
		$('#sum').text(total_txt);
		$('#delivery').text(delivery);
	} 
	function chkAll(){
		var total = 0;
		 if (isNaN($('#totalpro').text())) {
			 total = 0;
		 } else total = parseInt($('#totalpro').text());
		  $('input[name=chkAll]:checked').each(function() {
			total += parseInt($(this).nextAll('#totalprice').val());
		}); 
		$('#sum').text(total);
	}
	
	function chk(cart_no){
		var cart_count = $('#cart_count_'+cart_no).val();
		var cart_no =  $('#cart_no_'+cart_no).val();
		if(cart_count != null){
			location.href="cartUpdate.do?cart_no="+cart_no+"&cart_count="+cart_count;
		}
	}
	
	  
</script>
</head>
<body>
	<div id="board_wrap">
		<!-- 장바구니 헤더 -->
		<div class="board_name">수갱님의 장바구니</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="board_list_head">
					<div class="checkbox">
						<input type="checkbox" id="chkAll" name="chkAll"
							onclick="chkAll()" />
					</div>
					<div class="num">번호</div>
					<div class="img">책이미지</div>
					<div class="product">상품정보</div>
					<div class="tot">수량</div>
					<div class="info">배송정보</div>
					<div class="used_subject">가격</div>
					<div class="price">합계</div>
					<div class="delete">삭제</div>
				</div>



				<!-- 장바구니 목록 -->
				<div class="board_list_body">
					<c:if test="${empty cart_list }">
						<div id="show">장바구니가 비었습니다.</div>
					</c:if>
					<c:if test="${not empty cart_list }">
						<c:forEach var="cart" items="${cart_list }" varStatus="v">
							<c:set var="k" value="${k+1 }" />
							<div class="item">
								<div class="checkbox">
									<input type="checkbox" name="chk" onclick="check()"> <input
										type="hidden" value="${cart.cart_no}" class="no"
										id="cart_no_${cart.cart_no}"> <input type="hidden"
										value="${cart.cart_count * cart.book_price}"
										class="totalprice"> <input type="hidden"
										value="${cart.cart_count }" class="tot">
								</div>
								<div class="num">${k }</div>
								<div class="img">
									<a href="#"> <img alt="책 이미지"
										src="resources/images/${cart.book_image }" style="width: 10%">
									</a>
								</div>
								<div class="product">

									제목 : ${cart.book_title} <br>저자 : ${cart.book_author } <br>출판사
									: ${cart.book_publisher }
								</div>
								<div>
									<input type="number" id="cart_count_${cart.cart_no}"
										value="${cart.cart_count }" style="width: 50px">권 <input
										type="button" value="수정" onclick="chk(${cart.cart_no})">
								</div>
								<div class="info">2일 후 도착예정</div>
								<c:set var="i" value="${cart.cart_count * cart.book_price}" />
								<div class="used_subject" id="price_${v.index}">
									<fmt:formatNumber value="${cart.book_price }" pattern="#,###" />
									원
								</div>
								<div class="price" id="used_subject_${v.index }">
									<div>
										<fmt:formatNumber value="${i}" pattern="#,###" />
										원
									</div>
									<c:set var="total" value="${total+i }" />
								</div>
								<div class="delete">
									<input type="button" class="del" value="삭제" name="cart_no"
										onclick="location.href='cartDelete.do?cart_no=${cart.cart_no}'">
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>

			</div>
		</div>

		<div class="select_product">

			<button class="board_list_optionbtn_del" type="button"
				id="deleteButton" onclick="delSelect()">선택 삭제</button>
		</div>

		<!-- 페이징 -->
		<div class="paging-div">
			<c:if test="${empty cart_list }">
			</c:if>
			<c:if test="${not empty cart_list }">

				<ul class="pagination-ul">
					<c:if test="${pb.startPage > pb.pagePerBlock }">
						<li class="pre-btn"><a href="cart.do&pageNum=1"> <span
								class="glyphicon glyphicon-chevron-left"></span>
						</a></li>
						<li class="pre-btn"><a
							href="cart.do?&pageNum=${pb.startPage-1 }"> <span
								class="glyphicon glyphicon-chevron-left"></span>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
						<c:if test="${pb.currentPage == i }">
							<li class="active-btn"><a href="cart.do&pageNum=${i }">${i }</a>
							</li>
						</c:if>
						<c:if test="${pb.currentPage != i }">
							<li class="non-active-btn"><a href="cart.do&pageNum=${i }">${i }</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage }">
						<li class="next-btn"><a href="cart.do&pageNum=${pb.endPage }">
								<span class="glyphicon glyphicon-chevron-right"></span>
						</a></li>
						<li class="next-btn"><a
							href="cart.do&pageNum=${pb.endPage+1 }"> <span
								class="glyphicon glyphicon-chevron-right"></span>
						</a></li>
					</c:if>
				</ul>

			</c:if>
		</div>
		<!-- 페이징 끝 -->

		<div class="pay">
			<div class="pay_list">
				<div class="pay_head">
					<div class="totalpro">총 상품 금액</div>
					<div>&nbsp;&nbsp;</div>
					<div class="delivery">배송비</div>
					<div>&nbsp;&nbsp;</div>
					<div class="dis">할인금액</div>
					<div>&nbsp;&nbsp;</div>
					<div class="sum">최종 결제금액</div>
				</div>
				<div class="pay_body">
					<div class="pay_item">
						<div class="totalpro" id="totalpro">
							<fmt:formatNumber value="${total}" pattern="#,###"
								type="currency" />
						</div>
						<div>&nbsp;&nbsp;</div>
						<div class="delivery" id="delivery">0</div>
						<div>&nbsp;&nbsp;</div>
						<div class="dis">0</div>
						<div>=</div>
						<div class="sum" id="sum"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="board_mainbtns">
			<a href="newBook/newList.do" class="board_bigorderbtn left">쇼핑
				계속하기</a> <a class="board_bigorderbtn right" onclick="order()">주문하기</a> <input
				type="hidden" value="${cart.book_no}" class="book_no">
		</div>
	</div>
</body>
</html>