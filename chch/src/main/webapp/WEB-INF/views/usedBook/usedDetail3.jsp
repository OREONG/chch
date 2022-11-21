<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/usedDetail.css");</style>
</head> 
<body>

<div class="main-div">
	<div class="detailwrap">
		<div class="detail">
			<!-- 이미지 -->
			<div class="detail-wrap">
			<img id="detail_img" src="/chch/resources/images/${used.used_image}">
			</div>
			
			<div class="detail-info-wrap">
				<!-- 텍스트 -->
				<div class="detailtext">
					<div class="info-txt-div"><div class="info-txt1">
						<c:if test="${used.used_status=='n' }">[판매중]</c:if>
						<c:if test="${used.used_status=='r' }">[예약중]</c:if>
						<c:if test="${used.used_status=='y' }">[판매완료]</c:if>
						<c:if test="${used.used_status=='f' }">[판매완료]</c:if>
						${used.used_subject }</div></div>
					<div class="info-txt-div"><div class="info-txt">책 제목</div>			
					${book.book_title }</div>			
					<div class="info-txt-div"><div class="info-txt">가격</div><fmt:formatNumber value="${used.used_price }" pattern="#,###"/>원</div>
					<div class="info-txt-div"><div class="info-txt">판매자</div>${used.id }<br></div>
				</div>
				<!-- 버튼들 -->
				<div>
					<div class="btn-wrap">
						<form action="usedBuy.do" name="frm">
							<input type="hidden" name="used_price" value="${used.used_price}">
							<input type="hidden" name="used_no" value="${used.used_no}">
							<input type="hidden" name="book_no" value="${used.book_no}">
							<input type="hidden" name="purchase_id" value="${id}">
							<input type="hidden" name="seller_id" value="${used.id}">
						<!-- 판매중 - 구매자, 제3자 -->
						<c:if test="${used.used_status=='n' && used.id!=id }">
							<a href=""><button class="button1" id="button1-2">채팅하기</button></a>
							<input type="button" value="예약하기" class="button2" id="button1-2" onclick="buy()">
							<a href="likeInsert_used.do?used_no=${used.used_no }"><button class="button3" id="button1-3">❤</button></a>
							<script type="text/javascript">
								function buy() {
									var s = window.confirm("예약하시겠습니까?\n예약이 되시면 보유금에서 금액만큼 빠져나갑니다.\n주의해주세요!");
									if (s) {
										frm.action='usedBuy.do';
										frm.submit(); 
									} else alert("취소되었습니다.");
								}
							</script>
						</c:if>
						<!-- 판매중 - 판매자 -->
						<c:if test="${used.used_status=='n' && used.id==id }">
								<a href=""><button class="button1" id="button1-2">채팅하기</button></a>
						</c:if>
						<!-- 예약중 - 구매자 -->
						<c:if test="${used.used_status=='r' && deal.purchase_id==id }">
							<a href=""><button class="button1" id="button1-2">채팅하기</button></a>
							<a href="likeInsert_used.do?used_no=${used.used_no }"><button class="button1" id="button1-4">❤</button></a>
						</c:if>
						<!-- 예약중 - 제3자 -->
						<c:if test="${used.used_status=='r' && deal.purchase_id!=id && deal.seller_id!=id }">
							<a href=""><button class="button1" id="button1-2" disabled="disabled">채팅하기</button></a>
						</c:if>
						<!-- 예약중 - 판매자 -->
						<c:if test="${used.used_status=='r' && deal.seller_id==id }">
							<a href=""><button class="button1" id="button1-2">채팅하기</button></a>
							<input type="button" value="판매확정" class="button1" id="button1-2" onclick="sell()">
							<script type="text/javascript">
								function sell() {
									var x = window.confirm("판매확정하시겠습니까?\n제품 배송후 판매확정으로 눌러주세요.\n 최종 판매 완료시 거래 수수료 10% 입니다.");
									if (x) {
										frm.action='usedSell.do';
										frm.submit(); 
									} else alert("취소되었습니다.");
								}
							</script>
						</c:if>
						<!-- 판매완료 - 구매자 -->
						<c:if test="${used.used_status=='y' && deal.purchase_id==id }">
							<a href=""><button class="button1" id="button1-2">채팅하기</button></a>
							<input type="button" value="구매확정" class="button1" id="button1-2" onclick="finalBuy()">
							<a href="likeInsert_used.do?used_no=${used.used_no }"><button class="button1" id="button1-1">❤</button></a>
							<script type="text/javascript">
								function test() {
									var y = window.confirm("구매확정하시겠습니까?\n구매확정시 판매자에게 금액이 지급됩니다\n만약 제품에 문제가 있을시 고객센터로 문의바랍니다!\n구매확정버튼을 안누를시 5일뒤 자동으로 구매확정됩니다.");
									if (y) {
										frm.action='usedFinalBuy.do';
										frm.submit();
									} else alert("취소되었습니다.");
								}
							</script>
						</c:if>
						</form>
						<!-- 판매완료 - 제3자 -->
						<c:if test="${used.used_status=='y' && deal.purchase_id!=id && deal.seller_id!=id }">
						</c:if>
						<!-- 판매완료 - 판매자 -->
						<c:if test="${used.used_status=='y' && deal.seller_id==id }">
							<a href=""><button class="button1" id="button1-2">채팅하기</button></a>
						</c:if>
						<!-- 거래 완료 - 전체 -->
						<c:if test="${used.used_status=='f'}">
						</c:if>
					
					 </div>
					<p>
						<a id="info-a" href="newDetail.do?book_no=${used.book_no }">책 정보 보기 ▶️</a>
					</p>
				</div>
				<div class="content">
					${used.used_content }
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>