<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<div class="inquiry-container">
	
<c:if test="${inquiryNumber==1 }">
		<div class="inquiry-item" style="background-color: #2bc5c1" onclick="location.href='adminInquiryBeforeList.do?inquiryNumber=1'"><a style="color: white">답변 이전</a></div>
</c:if>
<c:if test="${inquiryNumber==2 }">
		<div class="inquiry-item" onclick="location.href='adminInquiryBeforeList.do?inquiryNumber=1'"><a >답변 이전</a></div>
</c:if>
<c:if test="${inquiryNumber==2 }">
		<div class="inquiry-item" style="background-color: #2bc5c1"  onclick="location.href='adminInquiryAfterList.do?inquiryNumber=2'"><a style="color: white">답변 완료</a></div>
</c:if>
<c:if test="${inquiryNumber==1 }">
		<div class="inquiry-item"  onclick="location.href='adminInquiryAfterList.do?inquiryNumber=2'"><a >답변 완료</a></div>
</c:if>
	</div>

	<div>
		<c:if test="${empty replyList }">
				<div>문의내역이 없습니다.</div>
		</c:if>
		
		<c:if test="${not empty replyList }">
			<c:forEach var="inquiry" items="${replyList }">
				<c:set var="i" value="${i+1 }"/>
				<div style="display: flex; height: 100%;">
					<div class="main1" style="flex-grow: 5;">
						<div class="flex-container column">
							<div class="wrap-collabsible">
								<input id="collapsible${i }" class="toggle" type="checkbox">
								<label for="collapsible${i }" class="lbl-toggle">
									
									<c:if test="${inquiry.reply=='y'}">답변완료 </c:if>
									
									<c:choose>
										<c:when test="${inquiry.category_no == 1}">환불 신청</c:when>
										<c:when test="${inquiry.category_no == 2}">회원 정보 문의</c:when>
										<c:when test="${inquiry.category_no == 3}">결제 관련 문의</c:when>
										<c:when test="${inquiry.category_no == 4}">구독/서비스이용 문의</c:when>
										<c:when test="${inquiry.category_no == 5}">기기관련 문의</c:when>
										<c:when test="${inquiry.category_no == 6}">도서관련 문의</c:when>
										<c:when test="${inquiry.category_no == 7}">배송 문의</c:when>
										<c:otherwise>해당되는 분류가 없음</c:otherwise>
									</c:choose>
									<br>${inquiry.inquiry_subject }<br>${inquiry.reg_time }</label>
								<div class="collapsible-content">
									<div class="content-inner">
										<p>${inquiry.inquiry_content }</p>
										<c:if test="${inquiry.reply=='y' }">
											<hr>${inquiry.reply_content}<br>${inquiry.reply_time } <!-- 관리자 대답 + 대답시간 추가해야함 -->
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
				<button onclick="location.href='inquiryList.do?pageNum=${startPage - 1}&inquiryNumber=2'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${currentPage == i }">
					<button onclick="location.href='inquiryList.do?pageNum=${i}&inquiryNumber=2'" style="background: blue; color: white;">${i }</button>
				</c:if>
				<c:if test="${currentPage != i }">
					<button onclick="location.href='inquiryList.do?pageNum=${i}&inquiryNumber=2'">${i }</button>
				</c:if>		
			</c:forEach>
			<c:if test="${totalPage > endPage }">
				<button onclick="location.href='inquiryList.do?pageNum=${endPage + 1}&inquiryNumber=2'">다음</button>
			</c:if>
		</div>
	</div>
	
	<div>
		<br><br>
	</div>
	<div>
		<br>
		<button type="button" onclick="location.href='adminMain.so'">관리자 메뉴</button>
	</div>
</body>
</html>