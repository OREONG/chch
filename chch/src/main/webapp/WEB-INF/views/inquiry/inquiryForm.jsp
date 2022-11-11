<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function toggleCheck1(checkbox) {
		const submit1_element = document.getElementById('submit1');
		submit1_element.disabled = checkbox.checked ? false : true;
		if (submit1_element.disabled) {
			submit1_element.disabled = true;
		} else {
			submit1_element.disabled = false;
		}
	}
</script>
</head>
<body>

<form action="inquiry.do" method="post">
<input type="hidden" name="category_no" value="${page }">
<c:if test="${page==1 }">
	<div id="page_1">
		<div> 결제수단
			<select id="inquiry-purchase-menu" name="inquiry-payment">
				<option value="" selected disabled hidden="">결제수단 선택</option>
				<option value="1">앱스토어/플레이스토어 인앱결제</option>
				<option value="2">카카오페이</option>
				<option value="3">네이버페이</option>
				<option value="4">신용카드</option>
				<option value="5">PAYCO</option>
				<option value="6">휴대폰 결제</option>
				<option value="7">모름</option>
			</select>
		</div>
		<div>
			결제일자 및 시간 <input type="text" name="inquiry-purchase-time" placeholder="YYYY MM DD 00:00">
		</div>
		<div>
			결제금액 <input type="number" name="inquiry-purchase-amount" placeholder="숫자만 입력">
		</div>
		<div>
			내용 <textarea name="inquiry-content" placeholder="문의내용을 입력해 주세요." maxlength="100"></textarea>
		</div>
	</div>
</c:if>
<c:if test="${page==2 }">
	<div id="page_2">
		<div class="inquiry-subject">
			<div class="inquiry-labelArea">
				제목
			</div>
			<div class="inquiry-inputArea">
				<input type="text" name="inquiry_subject" class="inquiry-subject-input" placeholder="입력해주세요.">
			</div>
		</div>
		<div class="inquiry-content">
			<div class="inquiry-labelArea">
				내용	
			</div>
			<div class="inquiry-inputArea">
				<textarea name="inquiry_content" class="inquiry-content-input" placeholder=
				"어떤 문제가 있으신가요? 아래 내용을 자세히 적어주시면 문제를 더욱 빨리 확인할 수 있습니다.&#13;&#10;&#13;&#10;• 이용 중인 기기 :&#13;&#10;&#13;&#10;• 인터넷 환경 (모바일데이터/와이파이) :&#13;&#10;&#13;&#10;• 문의 내용 :&#13;&#10;&#13;&#10;&#13;&#10;&#13;&#10;*문제가 발생하는 화면 또는 영상을 첨부해주시면 문제 해결에 큰 도움이 됩니다.&#13;&#10;&#13;&#10;"
				maxlength="100"></textarea>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${page==3 }">
	<div id="page_3"> page3 </div>
</c:if>
<c:if test="${page==4 }">
	<div id="page_4"> page4 </div>
</c:if>
<c:if test="${page==5 }">
	<div id="page_5"> page5 </div>
</c:if>
<c:if test="${page==6 }">
	<div id="page_6"> page6 </div>
</c:if>
<c:if test="${page==7 }">
	<div id="page_7"> page7 </div>
</c:if>

		<div id="inquiry-submit">
			<div>
				<hr>
				<input type="checkbox" id="check1" onclick="toggleCheck1(this)">
				[필수] 개인정보 수집 및 이용 동의
			</div>
			<div class="small">
				게시물 작성 시 유의사항 <br> - 산업안전보호법에 따른 고객 응대 근로자 보호조치에 의거하여 폭언, 욕설 등이
				포함된 내용은 상담이 제한될 수 있습니다.
			</div>
			<div class="submit2">
				<input type="submit" value="등록하기" id="submit1" disabled="disabled">
			</div>
			<div></div>
		</div>

	</form>

</body>
</html>