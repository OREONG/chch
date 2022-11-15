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

.lbl-toggle-inquiryList {
	display: block;
	font-size: 16px;
	text-align: left;
	padding: 1rem;
	/* color: white;
	background: gray; */
	cursor: pointer;
	border-radius: 7px;
}



.lbl-toggle-inquiryList::before {
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

.toggle:checked+.lbl-toggle-inquiryList::before {
	transform: rotate(90deg) translateX(-3px);
}

.collapsible-content-inquiryList {
	max-height: 0px;
	overflow: hidden;
	transition: max-height .25s ease-in-out;
}

.toggle:checked+.lbl-toggle-inquiryList+.collapsible-content-inquiryList {
	max-height: 700px;
}

.toggle:checked+.lbl-toggle-inquiryList {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.collapsible-content-inquiryList .content-inner-inquiryList {
	background: #ececec;
	padding: 10px;
}

.collapsible-content-inquiryList p {
	margin-bottom: 0;
}
</style>

<script type="text/javascript">
	function replyCheck(inquiry_no) {
		$(function() {
			$.ajax({
				url : "replyCheck.do?inquiry_no="+inquiry_no,
				async : true,
				type : "POST",
				dataType : "html",
				cache : false
			});
		});
		
		// sock.send(); <--- 실시간으로 읽은 것 알림에서 뻬야함
	}
</script>


</head>
<body>

	<div>
		<div>
			<div>
				<a href="faq.do">FAQ</a>
			</div>
			<div>
				<a href="inquirySelect.do?inquiryNumber=1">1:1 문의</a>
			</div>
		</div>
		<hr>
	</div>


	<div class="inquiry-container">

		<c:if test="${inquiryNumber==1 }">
			<div class="inquiry-item" style="background-color: #2bc5c1"
				onclick="location.href='inquirySelect.do?inquiryNumber=1'">
				<a style="color: white">문의하기</a>
			</div>
		</c:if>
		<c:if test="${inquiryNumber==2 }">
			<div class="inquiry-item"
				onclick="location.href='inquirySelect.do?inquiryNumber=1'">
				<a>문의하기</a>
			</div>
		</c:if>
		<c:if test="${inquiryNumber==2 }">
			<div class="inquiry-item" style="background-color: #2bc5c1"
				onclick="location.href='inquiryList.do?inquiryNumber=2'">
				<a style="color: white">문의내역확인</a>
			</div>
		</c:if>
		<c:if test="${inquiryNumber==1 }">
			<div class="inquiry-item"
				onclick="location.href='inquiryList.do?inquiryNumber=2'">
				<a>문의내역확인</a>
			</div>
		</c:if>
		<hr>
	</div>

	<div>

		<c:if test="${empty inquiryList }">
			<div>문의내역이 없습니다.</div>
		</c:if>

		<c:if test="${not empty inquiryList }">
			<c:forEach var="inquiry" items="${inquiryList }">
				<c:set var="i" value="${i+1 }" />
				<div style="display: flex; height: 100%;">
					<div class="main1" style="flex-grow: 5;">
						<div class="flex-container column">
							<div class="wrap-collabsible-inquiryList">
								<input id="collapsible${i }" class="toggle" type="checkbox">
								<label for="collapsible${i }" class="lbl-toggle-inquiryList" onclick="replyCheck('${inquiry.inquiry_no}')">

									<c:if test="${inquiry.reply=='y'}">답변완료 </c:if> <c:choose>
										<c:when test="${inquiry.category_no == 1}">환불 신청</c:when>
										<c:when test="${inquiry.category_no == 2}">회원 정보 문의</c:when>
										<c:when test="${inquiry.category_no == 3}">결제 관련 문의</c:when>
										<c:when test="${inquiry.category_no == 4}">구독/서비스이용 문의</c:when>
										<c:when test="${inquiry.category_no == 5}">기기관련 문의</c:when>
										<c:when test="${inquiry.category_no == 6}">도서관련 문의</c:when>
										<c:when test="${inquiry.category_no == 7}">배송 문의</c:when>
										<c:otherwise>해당되는 분류가 없음</c:otherwise>
									</c:choose> <br>${inquiry.inquiry_subject }<br>${inquiry.reg_time }</label>
								<div class="collapsible-content-inquiryList">
									<div class="content-inner-inquiryList">
										<p>${inquiry.inquiry_content }</p>
										<c:if test="${inquiry.reply=='y' }">
											<hr>${inquiry.reply_content}<br>${inquiry.reply_time }
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>

		<div>
			<br>
		</div>

		<div align="center">
			<c:if test="${startPage > PAGE_PER_BLOCK }">
				<button
					onclick="location.href='inquiryList.do?pageNum=${startPage - 1}&inquiryNumber=2'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${currentPage == i }">
					<button
						onclick="location.href='inquiryList.do?pageNum=${i}&inquiryNumber=2'"
						class="page_btn_sel">${i }</button>
				</c:if>
				<c:if test="${currentPage != i }">
					<button
						onclick="location.href='inquiryList.do?pageNum=${i}&inquiryNumber=2'"
						class="page_btn">${i }</button>
				</c:if>
			</c:forEach>
			<c:if test="${totalPage > endPage }">
				<button
					onclick="location.href='inquiryList.do?pageNum=${endPage + 1}&inquiryNumber=2'">다음</button>
			</c:if>
		</div>
	</div>

	<div>
		<br> <br>
	</div>

</body>
</html>