<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function showPage(data) {
		var addr = data;
		
		console.log(addr);
	
		var ajaxOption = {
			url : addr,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};
	
		$.ajax(ajaxOption).done(function(data) {
			$('#showPage').children().remove();
			$('#showPage').html(data);
		});
	};
	
	function sendInquiry(num) {
		
		var msg = $('#reply_content'+num).val(); // 입력한 메세지 글 읽기
		var category_no = $('#category_no'+num).val();
		var inquiry_no = $('#inquiry_no'+num).val();
		var inquiry_subject = $('#inquiry_subject'+num).val();
		var userId = $('#userId'+num).val();
		
		
		if (msg==null || msg=="") {
			alert("메세지를 입력하세요!");
			return false;
		}
		
		console.log("adminInquiryReply.do?category_no="+category_no+"&inquiry_no="+inquiry_no+"&inquiry_subject="+inquiry_subject+"&id="+userId+"&reply_content="+msg);
		
		// ajax로 채팅 내용 저장
		$(function() {
			$.ajax({
				url : "adminInquiryReply.do?category_no="+category_no+"&inquiry_no="+inquiry_no+"&inquiry_subject="+inquiry_subject+"&id="+userId+"&reply_content="+msg,
				async : true,
				type : "POST",
				dataType : "html",
				cache : false
			});
		});
		
		var inquiryReply = "inquiryReply,"+userId+","+inquiry_subject;
		sock.send(inquiryReply);
		
		showPage('adminInquiryBeforeList.do?inquiryNumber=2');
	}
	
	
</script>



</head>
<body>

	<div class="inquiry-top">
		<c:if test="${inquiryNumber==1 }">
				<button class="adminInquiryMenuBtn1" style="background-color: ##5055b1" onclick="showPage('adminInquiryBeforeList.do?inquiryNumber=1')">답변 이전</button>
				<button class="adminInquiryMenuBtn2"  onclick="showPage('adminInquiryAfterList.do?inquiryNumber=2')">답변 완료</button>
		</c:if>
		<c:if test="${inquiryNumber==2 }">
				<button class="adminInquiryMenuBtn2" onclick="showPage('adminInquiryBeforeList.do?inquiryNumber=1')">답변 이전</button>
				<button class="adminInquiryMenuBtn1" style="background-color: ##5055b1"  onclick="showPage('adminInquiryAfterList.do?inquiryNumber=2')">답변 완료</button>
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
										<div>
											<p>${inquiry.inquiry_content }</p><hr>
										</div>
											<input type="hidden" name="inquiryNumber" value="1">
											<input type="hidden" name="category_no" id="category_no${i}" value="${inquiry.category_no }">
											<input type="hidden" name="inquiry_no" id="inquiry_no${i}" value="${inquiry.inquiry_no}">
											<input type="hidden" name="inquiry_subject" id="inquiry_subject${i}" value="${inquiry.inquiry_subject}">
											<input type="hidden" name="id" id="userId${i}" value="${inquiry.id}">
											<div class="adminInquiryReply-content">
												<div class="adminInquiryReply-labelArea">
													답변	
												</div>
												<div class="adminInquiryReply-inputArea">
													<textarea name="reply_content" id="reply_content${i}" class="adminInquiryReply-content-input" maxlength="100"></textarea>
												</div>
												<div class="adminInquiryReply-submitArea">
													<button type="button" id="sendBtn3" onclick="sendInquiry('${i}')" class="adminInquiryReply-submit">확인</button>												</div>
											</div>	
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
				<button onclick="inquiryList.do?pageNum=${startPage - 1}&inquiryNumber=2'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${currentPage == i }">
					<button onclick="inquiryList.do?pageNum=${i}&inquiryNumber=2'" style="background: blue; color: white;">${i }</button>
				</c:if>
				<c:if test="${currentPage != i }">
					<button onclick="inquiryList.do?pageNum=${i}&inquiryNumber=2'">${i }</button>
				</c:if>		
			</c:forEach>
			<c:if test="${totalPage > endPage }">
				<button onclick="inquiryList.do?pageNum=${endPage + 1}&inquiryNumber=2'">다음</button>
			</c:if>
		</div>
	</div>
	
	<div>
		<br><br>
	</div>
</body>
</html>