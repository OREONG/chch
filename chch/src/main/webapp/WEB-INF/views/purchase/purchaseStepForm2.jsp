<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/purchaseStepForm.css");</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://js.tosspayments.com/v1/payment"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

// 텍스트박스 지우는 부분 
  function clearInput() {
        $('#name').val('');
        $('#phone').val('');
        $('#subPhone').val('');
        $('#sample6_postcode').val('');
        $('#sample6_address').val('');
        $('#sample6_detailAddress').val('');
        $('#sample6_extraAddress').val('');
        $('#rq').val('');
    }

// 주소검색창 출력 이벤트
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

// 추가 연락처 입력창 출력 이벤트
$(function() {
	$('input[type="checkbox"][id="subPhoneChk"]').on('click',
			function() {var chkValue = $('input[type=checkbox][id="subPhoneChk"]:checked').val();
				if (chkValue) {
					$('#subPhone').css('display', 'block');
				} else {
					$('#subPhone').css('display', 'none');
				}
			});
});

//배송 요청사항 직접입력 선택시 입력창 출력 이벤트
function dlrq(obj) {
	// 선택한 값 가져오기
	var selectVal = $(obj).val();
	
	if(selectVal == "self"){
		// 직접 입력하는 input 태그 보여주기
		$("#rq").show();
		
	} else{
		// 직접 입력하는 input 태그 숨기기
		$("#rq").hide();
	}
}

// 필수 입력 데이터 체크
function pay() {
	if (!frm2.delivery_name.value) {
		alert("이름을 입력해주세요")
		return false;
	}
	if (!frm2.delivery_phone.value) {
		alert("전화번호를 입력해주세요")
		return false;
	}
	if (!frm2.delivery_address.value) {
		alert("주소를 입력해주세요")
		return false;
	}
	if (!frm2.delivery_address_detail.value) {
		alert("상세주소를 입력해주세요")
		return false;
	}
	if (!frm2.delivery_kind.value) {
		alert("배송방법을 선택해주세요")
		return false;
	}
	if (!frm2.delivery_date.value) {
		alert("배송날짜를 선택해주세요")
		return false;
	}
	$('#payment-button').trigger('dblclick'); 
}

</script>
</head>
<body>
<form action="purchaseStep.do" method="post" name="frm2" >
<input type="hidden" value="${id}" name="id" id="id">
<div class="container">
	<diV style="display: flex">
		<div style="float: left;">
			<h1>주문결제</h1>
			<hr>
			<h2>배송정보</h2><input type="button" value="배송지목록" onclick="window.open('basicAddress.do', 'window_name', 'width=630, height=600, location=no, status=no, scrollbars=yes')">
			<button onclick="clearInput()">직접입력</button>
			<hr>
			<c:if test="${empty deliveryList}">
				<p>기본배송지가 없습니다.</p>
				<table class="table table-bordered"style="height: 300px">
						<tr>
							<th>주문인</th>
							<td>
								<input type="text" id="name" name="delivery_name" value="" required="required" min="2"
									maxlength="10" size="10" placeholder="받으시는분 성함을 입력해주세요">
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>
								<input type="text" id="phone" name="delivery_phone" value="" required="required" min="13"
									maxlength="13" size="10" placeholder="010-xxxx-xxxx"><p>
								<input type="checkbox" id="subPhoneChk" name="subPhoneChk"> 연락처 추가 입력<br>
								<input type="text" id="subPhone" name="delivery_phone_sub" style="display: none;" value="">
							</td>
						</tr>
						<tr>
							<th>배송지 주소</th>
							<td>
								<input type="text" id="sample6_postcode" name="delivery_postcode" size="10" placeholder="검색">
								<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
								<input type="text" id="sample6_address" name="delivery_address" value="" required="required" placeholder="서울시 강남구 역삼동">
								<input type="text" id="sample6_detailAddress" name="delivery_address_detail" value="" required="required" size="9" placeholder="123번길 45">
								<input type="text" id="sample6_extraAddress" name="delivery_address_detail_extra" value="" size="35" placeholder="추가사항">
							</td>
						</tr>
						<tr>
							<th>배송방법 선택</th>
							<td>
								<select name="delivery_kind" required="required">
									<option disabled selected>택배회사를 선택하세요</option>
									<option value="CJ대한통운">CJ대한통운</option>
									<option value="경동택배">경동택배</option>
									<option value="로젠택배">로젠택배</option>
									<option value="우체국택배">우체국택배</option>
									<option value="편의점택배">편의점택배</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>도착예정일 선택</th><td><input name="delivery_date" value="" type="date" required="required"></td>
						</tr>
					</table>
					<p>
					<select name="delivery_request" onchange="dlrq(this)" required="required">
						<option disabled selected value="">배송시 요청사항 선택하기</option>
						<option value="빠른 배송 부탁드립니다">빠른 배송 부탁드립니다</option>
						<option value="부재 시, 휴대폰으로 연락주세요">부재 시, 휴대폰으로 연락주세요</option>
						<option value="부재 시, 경비실에 맡겨주세요">부재 시, 경비실에 맡겨주세요</option>
						<option value="배송 전, 연락주세요">배송 전, 연락주세요</option>
						<option value="선택 사항 없음">선택 사항 없음</option>
						<option value="self">직접입력</option>
					</select>
					<br><input type="text" id="rq" name="delivery_request" style="display: none;" value="">
			</c:if>
			<c:if test="${not empty deliveryList}">
				<c:forEach var="delivery" items="${deliveryList}">
					<table class="table table-bordered"style="height: 300px">
						<tr>
							<th>주문인</th>
							<td>
								<input type="hidden" name="delivery_no" value="${delivery.delivery_no}">
								<input type="text" id="name" name="delivery_name" value="${delivery.delivery_name}" required="required" min="2"
									maxlength="10" size="10" placeholder="받으시는분 성함을 입력해주세요">
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>
								<input type="text" id="phone" name="delivery_phone" value="${delivery.delivery_phone}" required="required" min="13"
									maxlength="13" size="10" placeholder="010-xxxx-xxxx"><p>
								<input type="checkbox" id="subPhoneChk" name="subPhoneChk"> 연락처 추가 입력<br>
								<input type="text" id="subPhone" name="delivery_phone_sub" style="display: none;" value="">
							</td>
						</tr>
						<tr>
							<th>배송지 주소</th>
							<td>
								<input type="text" id="sample6_postcode" name="delivery_postcode" size="10" placeholder="검색">
								<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
								<input type="text" id="sample6_address" name="delivery_address" value="${delivery.delivery_address}" required="required" placeholder="서울시 강남구 역삼동">
								<input type="text" id="sample6_detailAddress" name="delivery_address_detail" value="${delivery.delivery_address_detail}" required="required" size="9" placeholder="123번길 45"><br>
								<input type="text" id="sample6_extraAddress" name="delivery_address_detail_extra" value="${delivery_address_detail_extra}" size="35" placeholder="추가사항">
							</td>
						</tr>
						<tr>
							<th>배송방법 선택</th>
							<td>
								<select name="delivery_kind" required="required">
									<c:if test="${not empty deliveryList}">
											<option value="${delivery.delivery_kind}" selected="selected">${delivery.delivery_kind}</option>
									</c:if>
									<c:if test="${empty deliveryList}">
										<option disabled selected>택배회사를 선택하세요</option>
									</c:if>
									<option value="CJ대한통운">CJ대한통운</option>
									<option value="경동택배">경동택배</option>
									<option value="로젠택배">로젠택배</option>
									<option value="우체국택배">우체국택배</option>
									<option value="편의점택배">편의점택배</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>도착예정일 선택</th><td><input name="delivery_date" value="" type="date" required="required"></td>
						</tr>
					</table>
					<p>
					<select name="delivery_request" onchange="dlrq(this)" required="required">
						<option disabled selected value="">배송시 요청사항 선택하기</option>
						<option value="빠른 배송 부탁드립니다">빠른 배송 부탁드립니다</option>
						<option value="부재 시, 휴대폰으로 연락주세요">부재 시, 휴대폰으로 연락주세요</option>
						<option value="부재 시, 경비실에 맡겨주세요">부재 시, 경비실에 맡겨주세요</option>
						<option value="배송 전, 연락주세요">배송 전, 연락주세요</option>
						<option value="선택 사항 없음">선택 사항 없음</option>
						<option value="self">직접입력</option>
					</select>
					<br><input type="text" id="rq" name="delivery_request" style="display: none;" value="">
				</c:forEach>
			</c:if>
			<br>
			<br>
			<br>
			<h2>주문상품</h2> 상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.
			<hr>
				<div>
					<div>${selectedBook.book_publisher}</div>
					<div style="display: flex;">
						<div>
							<a href="#"><img alt="책 이미지" src="${selectedBook.book_image}" style="width: 50%"></a>
						</div>
						<div>
							<div>글쓴이</div>
							<div>${selectedBook.book_author}</div>
						</div>
						<div>&nbsp;</div>
						<div>
							<div>주문 수량</div>
							<div>${count}</div>
						</div>
						<div>&nbsp;</div>
						<div>
							<div>가격</div>
							<div>${selectedBook.book_price}</div>
						</div>
						<div>&nbsp;</div>
						<div>
							<div>총 가격</div>
							<div id="ccbp">${count * selectedBook.book_price}</div>
						</div>
					</div>	
				</div>
			<br>
			<br>
			<br>
			<h2>할인/포인트</h2>
			<hr>
			<div>쿠폰할인</div>
			<div>
				상품/배송비 쿠폰<input type="button" value="쿠폰변경" onclick="mnsd()">
				<script type="text/javascript">
					function mnsd() {
						frm2.action = window.open('couponChange.do?total_price=${count * selectedBook.book_price}', 'window_name', 'width=630, height=600, location=no, status=no, scrollbars=yes')
					}
				</script>
			</div>
			<br>
			<div style="display: flex;">
			<c:if test="${empty couponList2}">
				선택한 쿠폰이 없습니다
			</c:if>
			<c:if test="${not empty couponList2}">
				<c:forEach var="coupon" items="${couponList2}">
				<div style="display: flex;">
					<div>${coupon.coupon_no}</div>
					<div>${coupon.coupon_image}</div>
					<div>${coupon.coupon_kind}</div>
					<div>${coupon.coupon_discount}</div>
					<div>쿠폰 사용상태${coupon.coupon_situation}</div>
					<div>삭제여부${coupon.del}</div>
				</div>
				</c:forEach>
			</c:if>
			</div>
			<br>
			<hr>
			<a>*보유금 및 포인트는 100원 단위 이상부터 사용가능합니다</a>
			<p>보유금</p>
				<div>
					<p>보유금<input type="text" id="used_money" name="used_money" value="" max="${moneySelect2}" maxlength="5" onchange='printName()' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<p>사용가능 ${moneySelect} 원</p>
				</div>
			<p>포인트</p>
				<div>
					<p>Chack point<input type="text" id="used_mileage" name="used_mileage" value="" max="10000" maxlength="5" onchange='printName2()' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<p>사용가능 ${mileageSelect} p</p>
				</div>
			<hr>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div style="float: right; margin-left: 330px;">
			<h2>결제 예정 금액</h2>
			<p>상품금액</p><p>${count * selectedBook.book_price}원</p>
			<p>배송비(선결제)</p><p>0원</p>
			<p>할인금액</p>
			<div>사용할 쿠폰</div>
			<c:if test="${empty couponList2}">
				선택한 쿠폰이 없습니다
			</c:if>
			<c:if test="${not empty couponList2}">
				<c:forEach var="coupon" items="${couponList2}">
			<div>${coupon.coupon_discount}</div>
			<input type="hidden" name="coupon_no" value="${coupon.coupon_no}">
				</c:forEach>
			</c:if>
			
			<div>사용할 보유금</div>
			<div id="moneyResult"></div>
			<div>사용할 포인트</div>
			<div id="pointResult"></div>
			<div>합계</div>
			<div><div id="finalTotalPrice2"><div id="finalTotalPrice">${count * selectedBook.book_price - cpdt}</div></div></div>
			<input type="hidden" name="finalMoney" value="${count * selectedBook.book_price - cpdt}">
			<input type="hidden" name="finalPoint" value="${count * selectedBook.book_price - cpdt}">
			<hr>
			<h2>적립 혜택</h2>
			<p>결제금액의 2%</p>
			<p>* 쿠폰 및 포인트 사용 금액부분은 미적립</p>
			<div><div id="savePoint"></div> p 예정</div>
			<input type="hidden" name="saveMileage" value="${count * selectedBook.book_price - cpdt}">
			<hr>
			<p>하기 필수약관을 확인하였으며 결제에 동의합니다.</p>
			<input type="submit" value="결제">
			<!-- <button type="button" id="payment-button" onclick="pay()">?원 결제하기</button> -->
			<br>
			<br>
			<p>개인정보 판매자 제공 동의</p>
			<div style="overflow:scroll; height:200px;">
				<p>어쩌구 저쩌구</p>
			</div>
			<p>개인정보 수집 및 이용 동의</p>
			<div style="overflow:scroll; height:200px;">
				<p>어쩌구 저쩌구</p>
			</div>
			<p>주문 상품정보 동의</p>
			<div style="overflow:scroll; height:200px;">
				<p>어쩌구 저쩌구</p>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	//보유금, 포인트 사용 데이터 반영 함수
	function printName() {
		const used_money = Math.floor(document.getElementById('used_money').value / 100) * 100;
		document.getElementById("moneyResult").innerText = used_money;
		var fnmy = parseInt($('#finalTotalPrice').text()) - used_money;
		$('#finalTotalPrice').text(fnmy);
		$('#savePoint').text(fnmy/50);
		frm2.finalMoney.value = fnmy;
		frm2.saveMileage.value = fnmy/50;
	};
	
	function printName2() {
		const used_mileage = Math.floor(document.getElementById('used_mileage').value / 100) * 100;
		document.getElementById("pointResult").innerText = used_mileage;
		var fnpt = parseInt($('#finalTotalPrice2').text()) - used_mileage;
		$('#finalTotalPrice2').text(fnpt);
		frm2.finalPoint.value = fnpt;
	};
	
	// 보유금, 포인트 100원단위 이상 사용 함수
	$(function() {
		$('#used_money').on('change', function() {
			var n = $(this).val();
			n = Math.floor(n / 100) * 100;
			if (n < ${moneySelect2} ) { 
			$(this).val(n);
			} else {
				alert("보유하신 금액보다 큰 금액은 사용하실 수 없습니다.");
				$('#used_money').val('0');
			}});
	});
	 
	$(function() {
		$('#used_mileage').on('change', function() {
			var m = $(this).val();
			m = Math.floor(m / 100) * 100;
			if (m < ${mileageSelect2} ) {
			$(this).val(m);
			} else { 
				alert("보유하신 포인트보다 큰 포인트는 사용하실 수 없습니다.");
				$('#used_mileage').val('0');
			}});
	});

	// 토스 페이먼츠 API 사용
	var clientKey = 'test_ck_qLlDJaYngroA1evo6y3ezGdRpXxK'
	var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
	var button = document.getElementById('payment-button') // 결제하기 버튼
	$('#payment-button').dblclick(function() {
		tossPayments.requestPayment('카드', { // 결제 수단 파라미터
			// 결제 정보 파라미터
			amount : 15000,
			orderId : 'vj9K0OJPJ7uIUpXrKtMUh',
			orderName : '토스 티셔츠 외 2건',
			customerName : 'frm2.delivery_name.value',
			successUrl: 'http://localhost:8080/chch/success',
		});
	});
</script>
</form>
</body>
</html>