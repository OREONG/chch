<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
input[class='toggle'] {
	display: none;
}

.wrap-collabsible {
	margin: 1px;
}

.lbl-toggle {
	display: block;
	font-size: 1.2rem;
	text-align: left;
	padding: 1rem;
	color: black;
	background: #F6F6F6;
	cursor: pointer;
	border-radius: 7px;
}

.lbl-toggle:hover {
	color: #FFF;
}

.lbl-toggle::before {
	content: ' ';
	display: inline-block;
	border-top: 5px solid transparent;
	border-bottom: 5px solid transparent;
	border-left: 5px solid currentColor;
	vertical-align: middle;
	margin-right: .7rem;
	transform: translateY(-2px);
	transition: transform .2s ease-out;
}

.toggle:checked+.lbl-toggle::before {
	transform: rotate(90deg) translateX(-3px);
}

.collapsible-content {
	max-height: 0px;
	overflow: hidden;
	transition: max-height .25s ease-in-out;
}

.toggle:checked+.lbl-toggle+.collapsible-content {
	max-height: 700px;
}

.toggle:checked+.lbl-toggle {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.collapsible-content .content-inner {
	background: white;
	border: 1px solid;
	border-bottom-left-radius: 7px;
	border-bottom-right-radius: 7px;
	padding: .5rem 1rem;
}

.collapsible-content p {
	margin-bottom: 0;
}



.flex-container.column{flex-direction: column;}
</style>

</head>
<body>

	<div class="inquiry-top">
		<c:if test="${inquiryNumber==1 }">
			<button class="inquiryMenuBtn1" style="background-color: ##5055b1" onclick="showPage('faq.do?inquiryNumber=1')">FAQ</button>
			<button class="inquiryMenuBtn2"  onclick="showPage('inquirySelect.do?inquiryNumber=2')">1:1 문의하기</button>
			<button class="inquiryMenuBtn2"  onclick="showPage('inquiryList.do?inquiryNumber=3')">문의답변 확인</button>
		</c:if>
		<c:if test="${inquiryNumber==2 }">
			<button class="inquiryMenuBtn2" style="background-color: ##5055b1" onclick="showPage('faq.do?inquiryNumber=1')">FAQ</button>
			<button class="inquiryMenuBtn1"  onclick="showPage('inquirySelect.do?inquiryNumber=2')">1:1 문의하기</button>
			<button class="inquiryMenuBtn2"  onclick="showPage('inquiryList.do?inquiryNumber=3')">문의답변 확인</button>
		</c:if>
		<c:if test="${inquiryNumber==3 }">
			<button class="inquiryMenuBtn2" style="background-color: ##5055b1" onclick="showPage('faq.do?inquiryNumber=1')">FAQ</button>
			<button class="inquiryMenuBtn2"  onclick="showPage('inquirySelect.do?inquiryNumber=2')">1:1 문의하기</button>
			<button class="inquiryMenuBtn1"  onclick="showPage('inquiryList.do?inquiryNumber=3')">문의답변 확인</button>
		</c:if>
	</div>

	<div style="display: flex; height: 100%;  ">
		<div class="main1" style="flex-grow: 5;">
			<div class="flex-container column">
				<div class="flex-item one">
					<div class="flex-item-a1">
						<br>
						<h3>무엇을 도와드릴까요?</h3>
						환불은 100% 확실하고,<br> 문의는 신속하게 답변드리겠습니다. <br> <br>
					</div>
				</div>
				
				<div> <h3>자주 묻는 질문 TOP5</h3></div>

				<div class="wrap-collabsible">
					<input id="collapsible1" class="toggle" type="checkbox">
					<label for="collapsible1" class="lbl-toggle">
						1. 품절, 절판 상품은 구입할 수 없습니까?</label>
					<div class="collapsible-content">
						<div class="content-inner">
							<p>
								품절/절판 상품은 출판사에서 제작과 유통을 중단한 상태라 구입할 수 없습니다.<br>
								알라딘은 품절/절판 상품에 대해 아래 4가지 서비스를 운영중이며, 해당상품 페이지에서 이용하실 수 있습니다.<br>
								이 외에는 품절/절판 상품을 구해드릴 방법이 없습니다.<br>
								1. 상품페이지에서 중고책이 있는지 확인하십시오.<br>
								2. 상품페이지에서 전자책이 있는지 확인하십시오.<br>
								3. 품절도서센터에 의뢰하면 유통망에 혹시라도 남아있을 종이책 재고를 찾아드립니다<br>
								4. 종이책의 재출간을 기다려 보시려면 재출간알림을 신청하십시오.<br>
							</p>
						</div>
					</div>
				</div>
				
				<div class="wrap-collabsible">
					<input id="collapsible2" class="toggle" type="checkbox">
					<label for="collapsible2" class="lbl-toggle">
						2. 주문 후 입금 전(입금확인 전)인데, 언제쯤 배송됩니까?</label>
					<div class="collapsible-content">
						<div class="content-inner">
							<p>
								주문완료 후 주문조회 페이지 상단의 주문처리 일정표로 확인하실 수 있습니다.<br>
								상품 준비예상일, 출고예상일 및 수령예상일 정보를 참고해주십시오.<br>
								단, 결제완료 상태를 전제로 한 일정이며, 입금 전이면 입금확인 완료(입금 후 약 30분<br>
								-1시간 내 확인)후 해당 시점의 재고 유무, 각 배송사 집하마감 시간 경과 여부 등을<br>
								기준으로 주문처리 일정이 재계산되므로, 입금대기 상태의 일정과 달라질 수 있습니다.<br>
								입금완료 후 주문 일정을 반드시 참고해주시기 바랍니다.<br><br>
								또한, 상품 추가,배송지 혹은 배송방법 변경 등의 경우에도 상황에 따라 일정 변경이<br>
								발생될 수 있으므로 변경 후 새로 세팅된 일정을 참고하시기 바랍니다.
							</p>
						</div>
					</div>
				</div>
				
				<div class="wrap-collabsible">
					<input id="collapsible3" class="toggle" type="checkbox">
					<label for="collapsible3" class="lbl-toggle">
						3. 수령예상일이 지났는데 아직 못 받았습니다.</label>
					<div class="collapsible-content">
						<div class="content-inner">
							<p>
								출고완료 후 통상 1-2일 내에는 배송이 됩니다만, 배송 물량이 급증하거나 해당 지역의<br>
						      	배송 상황에 다른 문제가 있다면 예정일 보다 지연될 수 있습니다.<br><br>
								우선, 주문조회 후 해당 주문의 "배송상황추적"클릭 후 배송상황이나 영업소 확인을 해 보세요.<br>
								영업소에 의뢰하시면 자세한 안내와 배송 예상시점 등을 확인하실 수 있습니다.<br><br>
								영업소와의 연락이 어려운 경우에는 해당 주문 조회 후 미배송신고해 주시면 신속 배송<br>
								되도록 조치해드립니다.
							</p>
						</div>
					</div>
				</div>
				
				<div class="wrap-collabsible">
					<input id="collapsible4" class="toggle" type="checkbox">
					<label for="collapsible4" class="lbl-toggle">
					4. 입금했는데 왜 아직 "입금대기" 상태입니까?</label>
					<div class="collapsible-content">
						<div class="content-inner">
							<p>
								주문내역서의 입금예정 정보(입금액/입금은행/입금자명)와 100% 동일하게 입금하셨다면<br>
						      	"입금 후 40분-1시간 내" 입금확인이 완료되고 주문처리 단계는 상품준비중으로<br>
						      	이행하며 상품 준비가 시작됩니다. 아직 입금확인 소요시간이 경과하지 않았다면 조금만 기다려주십시오.<br><br>
								단, 1시간 이상 지나도록 입금 확인이 안될 경우에는 주문내역서 입금예정 정보와 실제<br>
								입금 정보가 다른 경우인데요, 이 경우 실제 입금내역 조회 후 1대1 고객상담>결제>입금신고<br>
								이용해 입금정보를 신고해주시면 신속히 확인해 드립니다.
							</p>
						</div>
					</div>
				</div>
				
				<div class="wrap-collabsible">
					<input id="collapsible5" class="toggle" type="checkbox">
					<label for="collapsible5" class="lbl-toggle">
						5. 주문 후 취소(일부/전체)시 언제 환불됩니까?</label>
					<div class="collapsible-content">
						<div class="content-inner">
							<p>
								취소 형태와 결제방식에 따라 환불 시점/방법에 차이가 있습니다.<br><br>
								1.환불 시점<br>
								O일부 취소시: 나머지 상품 "출고완료" 익일 저녁<br>
								O전체 취소시: 취소 시점에 따라 당일 혹은 익일 저녁(단, 월-금 평일 기준)<br>
								*단, 무통장입금 후 입금확인(입금 후 30분~1시간 소요) 전에 취소("입금대기" 상태<br>
								에서 취소)하신 경우에는 우선 입금확인이 필요하므로, 반드시 입금신고를 해주시기 바랍나다.<br><br>
								2.환불 방식 : 전체취소 여부/결제방법 등에 따라 상이<br>
								O일부 취소시 :<br>
								　　- 온라인송금 등(->차액 예치금/계좌 환불)<br>
								　　- 신용카드,카카오페이,페이코등 간편결제(->결제 부분취소 환불)<br>
								O전체 취소시 :<br>
								　　- 온라인송금 등(->차액 예치금/계좌 환불)<br>
								　　- 신용카드,카카오페이,페이코등 간편결제(->승인취소)<br>
								O통합결제 후 주문취소 : 알라딘 외 각 판매자가 출고/배송하는 상품이 포함된 경우<br>
								주문/결제 후 판매자별로 주문이 자동 분리 접수됩니다. 이 중 일부 주문만 전체 취소할 경우<br>
								통합결제 주문의 일부 취소인 경우여서 해당 주문 금액만 예치금 등으로 환불됩니다.<br>
								- 단, 신용카드,카카오페이,페이코등 간편결제는 환불정보와 무관하게 결제(부분 or 전체) 취소<br><br>
								*일부 혹은 전체상품 취소 후 해당 주문의 환불정보란에 계좌정보를 남겨주실 경우에만<br>
								해당 계좌로 송금해드리며, 계좌정보가 없는 경우 예치금으로 우선 환불됩니다.<br>
								예치금 환불 조회(나의계정>알라딘통장) 후 "환급 신청"시 신청 익일 저녁까지 해당 계좌로 송금됩니다.<br>
								*쿠폰/예치금/선물상품권/적립금 등은 전체 취소 시 나의계정>알라딘통장에 환원됩니다.<br>
								* 결제 취소 후 카드사 반영에 3-4일 소요될 수 있습니다.<br>
								* 제휴포인트의 경우 제휴사 방침에따라 등록된 환불정보와 관계없이 결제취소,<br>
								적립금 및 예치금 환불로 처리될 수 있습니다.
							</p>
						</div>
					</div>
					<div class="flex-item-a3">
						고객센터 070-0770-7007<br>
						평일 10:00 ~ 18:00<br>
						점심시간 13:00 ~ 14:00<br>
						토 / 일 / 공휴일 Day off
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>