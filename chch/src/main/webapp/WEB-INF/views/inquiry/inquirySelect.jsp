<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function selectPage() {
		var url = "inquiryForm.do?page="
				+ $('#inquiry-menu option:selected').val();
		// alert(url);
		$('#inquiry-view').load(url);
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

	<div class="inquiry-main">
		<div>
			<div>
				<label for="inquiry-menu">문의유형을 선택해주세요</label>
			</div>
			<div>
				<select id="inquiry-menu" name="inquiry-menu"
					onchange="selectPage()">
					<option value="" selected disabled hidden="">문의유형 선택</option>
					<option value="1">환불 신청</option>
					<option value="2">회원 정보 문의</option>
					<option value="3">결제 관련 문의</option>
					<option value="4">구독/서비스이용 문의</option>
					<option value="5">기기관련 문의</option>
					<option value="6">도서관련 문의</option>
					<option value="7">배송 문의</option>
				</select>
			</div>
		</div>
		<div>
			<hr>
		</div>

		<div id="inquiry-view">
			<div id="inquiry-submit">
				<div>
					<hr>
					<input type="checkbox" id="check1" onclick="toggleCheck1(this)">
					[필수] 개인정보 수집 및 이용 동의
				</div>
				<div class="small">
					게시물 작성 시 유의사항 <br> - 산업안전보호법에 따른 고객 응대 근로자 보호조치에 의거하여 폭언, 욕설
					등이 포함된 내용은 상담이 제한될 수 있습니다.
				</div>
				<div class="submit2">
					<input type="submit" value="등록하기" id="submit1" disabled="disabled">
				</div>
				<div></div>
			</div>
		</div>



	</div>



</body>
</html>