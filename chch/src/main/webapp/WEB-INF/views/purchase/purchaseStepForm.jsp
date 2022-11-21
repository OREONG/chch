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
			<h2>배송정보</h2><input type="button" value="배송지목록" id="input-btn" onclick="window.open('basicAddress.do', 'window_name', 'width=630, height=600, location=no, status=no, scrollbars=yes')">
			<button id="input-btn" onclick="clearInput()">직접입력</button>
			<hr>
			<c:if test="${empty deliveryList}">
				<p>기본배송지가 없습니다.</p>
				<table>
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
								<input type="button" id="input-btn2" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
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
					<br>
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
					<table>
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
								<input type="button" id="input-btn2" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
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
					<br>
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
			<c:if test="${empty selectedCart}">
				<p>주문내용이 없습니다.</p>
			</c:if>
			<c:if test="${not empty selectedCart}">
				<c:forEach var="cart" items="${selectedCart}" varStatus="status">
				<div>
					<div>${cart.book_publisher}</div>
					<div style="display: flex; margin-left: 10px; border: solid 1px #5055b1; padding: 5px; text-align: center;">
						<div>
							<a href="#"><img alt="책 이미지" src="${cart.book_image}" style="width: 50%"></a>
						</div>
						<div>
							<div>글쓴이</div>
							<div>${cart.book_author}</div>
						</div>
						<div>&nbsp;</div>
						<div>
							<div>주문 수량</div>
							<div>${cart.cart_count}</div>
						</div>
						<div>&nbsp;</div>
						<div>
							<div>가격</div>
							<div>${cart.book_price}</div>
						</div>
						<div>&nbsp;</div>
						<div>
							<div>총 가격</div>
							<div id="ccbp">${cart.cart_count * cart.book_price}</div>
						</div>
						<div class="${status.index}"></div>
					</div>	
				</div>
						<c:set var="total_price" value="${total_price + cart.cart_count * cart.book_price}" />
						<input type="hidden" name="total_price" id="total_price" value="${total_price}">
				</c:forEach>
			</c:if>
			<br>
			<br>
			<br>
			<h2>할인/포인트</h2>
			<hr>
			<div>쿠폰할인</div>
			<div>
				상품/배송비 쿠폰<input type="button" id="input-btn2" value="쿠폰변경" onclick="mnsd()">
				<script type="text/javascript">
					function mnsd() {
						var total_price = frm2.total_price.value;
						frm2.action = window.open('couponChange.do?total_price=${total_price}', 'window_name', 'width=630, height=600, location=no, status=no, scrollbars=yes')
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
					<div>${coupon.coupon_kind}</div>
					<div>${coupon.coupon_discount}</div>
				</div>
				</c:forEach>
			</c:if>
			</div>
			<br>
			<hr>
			<p>*보유금 및 포인트는 100원 단위 이상부터 사용가능합니다</p>
			<p>보유금</p>
				<div>
					<p>보유금<input type="text" id="used_money" name="used_money" value="0" max="${moneySelect2}" maxlength="5" onchange='printName()' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<p>사용가능 ${moneySelect} 원</p>
				</div>
			<p>포인트</p>
				<div>
					<p>Chack point<input type="text" id="used_mileage" name="used_mileage" value="0" max="10000" maxlength="5" onchange='printName2()' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					<p>사용가능 ${mileageSelect} p</p>
				</div>
			<hr>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div style="float: right; margin-left: 330px; width: 300px;">
			<h2>결제 예정 금액</h2>
			<p>상품금액</p><p>${total_price}원</p>
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
			<div><div id="finalTotalPrice2"><div id="finalTotalPrice">${total_price - cpdt}</div></div></div>
			<input type="hidden" name="finalMoney" value="${total_price - cpdt}">
			<input type="hidden" name="finalPoint" value="${total_price - cpdt}">
			<hr>
			<h2>적립 혜택</h2>
			<p>결제금액의 2%</p>
			<p>* 쿠폰 및 포인트 사용 금액부분은 미적립</p>
			<div><div id="savePoint"></div> p 예정</div>
			<input type="hidden" name="saveMileage" value="${total_price - cpdt}">
			<hr>
			<p>하기 필수약관을 확인하였으며 결제에 동의합니다.</p>
			<input type="submit" id="input-btn" value="결제">
			<!-- <button type="button" id="payment-button" onclick="pay()">?원 결제하기</button> -->
			<br>
			<br>
			<p>개인정보 판매자 제공 동의</p>
			<div style="overflow:scroll; height:200px;">
						<p>개인정보 제3자 제공 동의 토스페이먼츠(이하 회사라 함)는 링크페이를 통해 상품을 구매한 고객 정보를
							판매자에게 아래와 같이 제공합니다. 1. 개인정보를 제공받는 자 링크페이 판매 상점 (구매화면 상단 노출) 2.
							제공하는 목적 링크페이를 이용한 상품 구매에 따른 요금 결제 및 배송 민원 처리, 고지사항 전달 3. 제공하는 항목
							이름, 휴대폰번호 배송 필요 시 주소 4. 개인정보의 보유 및 이용기간 개인정보는 원칙적으로 개인정보의 수집·이용
							목적이 달성되면 지체없이 파기합니다. 단, 다른 법령에 특별한 규정이 있는 경우 관련 법령에서 정하는 기간동안
							보유합니다. 5. 이용자는 회사의 개인정보 제3자 제공에 대한 동의를 거부할 권리가 있습니다. 다만, 개인정보의
							제3자 제공 동의를 거부할 경우 링크페이 서비스의 이용이 제한될 수 있음을 알려드립니다.</p>
			</div>
			<br>
			<p>개인정보 수집 및 이용 동의</p>
			<div style="overflow:scroll; height:200px;">
						<p>Ⅰ. 개인정보의 수집 및 이용 동의서 - 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기
							목적 이외의 용도로는 사용되지 않습니다. ① 개인정보 수집 항목 및 수집·이용 목적 가) 수집 항목 (필수항목) -
							성명(국문), 주민등록번호, 주소, 전화번호(자택, 휴대전화), 사진, 이메일, 나이, 재학정보, 병역사항, 외국어
							점수, 가족관계, 재산정도, 수상내역, 사회활동, 타 장학금 수혜현황, 요식업 종사 현황 등 지원 신청서에 기재된
							정보 또는 신청자가 제공한 정보 나) 수집 및 이용 목적 - 하이트진로 장학생 선발 전형 진행 - 하이트진로
							장학생과의 연락 및 자격확인 - 하이트진로 장학생 자원관리 ② 개인정보 보유 및 이용기간 - 수집·이용 동의일로부터
							개인정보의 수집·이용목적을 달성할 때까지 ③ 동의거부관리 - 귀하께서는 본 안내에 따른 개인정보 수집, 이용에 대하여
							동의를 거부하실 권리가 있습니다. 다만, 귀하가 개인정보의 수집/이용에 동의를 거부하시는 경우에 장학생 선발 과정에
							있어 불이익이 발생할 수 있음을 알려드립니다. 본인은 위의 동의서 내용을 충분히 숙지하였으며, 개인정보 수집, 이용,
							제공하는 것에 동의합니다. 년 월 일 성명: (서명 또는 인</p>
			</div>
			<br>
			<p>주문 상품정보 동의</p>
			<div style="overflow:scroll; height:200px;">
						<p>개인정보 처리방침 1(총칙) ① 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명,
							주소 등의 사항에 의하여 당해 개인을 알아볼 수 있는 부호, 문자, 음성, 음향 및 영상 등의 정보(당해 정보만으로는
							특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다. ②
							유한책임회사 브이에프코리아(이하 '회사')는 이용자의 개인정보보호를 매우 중요시하며, 「개인정보보호법」,「정보통신망
							이용 촉진 및 정보보호에 관한 법률」 등 개인정보보호 관련 법률 및 하위 법령들을 준수하고 있습니다. ③ 회사는
							개인정보취급방침을 통하여 이용자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해
							어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 홈페이지 첫 화면에 공개함으로써 언제나 용이하게
							보실 수 있습니다. ④ 회사는 개인정보취급방침의 지속적인 개선을 위하여 개정하는데 필요한 절차를 정하고 있으며,
							개인정보취급방침을 회사의 필요와 사회적 변화에 맞게 변경할 수 있습니다. 2(개인정보 수집에 대한 동의) ① 회사는
							귀하께서 회사의 개인정보 수집, 이용과 이용약관의 내용에 대해 「동의함」버튼 또는 「동의안함」버튼을 클릭할 수 있는
							절차를 마련하여, 「동의함」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다. 「동의안함」을 선택하실 경우,
							회사가 제공하는 기본서비스 제공이 제한됩니다. ② 인터넷을 통한 동의절차를 마련하기 어려운 경우에, 브이에프코리아는
							동의 받아야 할 사항을 전화,서면 등의 방법으로 법적 절차를 거쳐 동의를 받을 수 있습니다. 3(개인정보 수집항목 및
							이용목적) ① 회사는 회원가입 또는 물품을 주문하는 경우 아래의 개인정보 항목을 다음과 같은 목적으로 수집하고
							있습니다. 단, 이용자의 개인정보를 수집하는 경우에는 그 목적에 필요한 최소한의 개인정보를 수집하고 있습니다. 1.
							회원가입시 수집정보 및 수집목적 (필수항목) -. 수집항목 : 이름, 아이디, 비밀번호, 이메일주소, 휴대폰번호 -.
							수집목적 : 회원특정 및 고지사항 전달, 본인의사 확인 및 불만처리 등 원활한 의사소통 경로의 확보 -. 이용기간 :
							회원 탈퇴 시까지 2. 물품구매 시 수집정보 및 수집목적 (필수항목) -. 수집항목 : 주문 고객명, 수신인,
							배송주소, 배송연락처, 결제수단 -. 수집목적 : 구매한 물품의 배송/설치 등 고객과 체결한 계약의 이행 -.
							이용기간 : 위 수집목적 달성 시까지 3. 마케팅 목적 수집정보 및 수집목적 (선택 항목) -. 수집항목 : 이메일
							주소, 휴대폰번호 -. 수집목적 : 고객이 동의한 경우에 한하여 신상품 홍보 및 판매권유 등 마케팅 목적 활용 -.
							이용기간 : 동의 철회 시까지 ② 수집된 이용자의 개인정보는 해외에 위치한 아마존의 서버(AWS)에 저장, 관리되고
							있습니다. 저장, 관리된 모든 개인정보의 관리 책임은 회사가 가지고 있습니다. ③ 단, 이용자의 기본적 인권 침해의
							우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태
							및 성생활 등)는 수집하지 않습니다. ④ 회사는 고객에게 재화나 서비스를 홍보하거나 판매를 권유하기 위하여 개인정보의
							처리에 대한 동의를 받으려는 때에는 고객이 이를 명확하게 인지할 수 있도록 알리고 동의를 받습니다. ⑤ 회사는
							불법카드거래 예방을 위해 필요한 조치를 취할 수 있습니다. ⑥ 회사는 메일 서비스를 제공하기 위해 고객명, 고객
							아이디, 고객 메일주소를 해외 소재 업체인 메일침프(Mail Chimp)에 제공할 수 있습니다. 4(개인정보의 보유
							및 이용기간) ① 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.</p>
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