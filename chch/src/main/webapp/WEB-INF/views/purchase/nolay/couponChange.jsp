<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
// radio 선택시 div 색 변경 이벤트
	$(function() {
		$("input[name='coupon_no']").click(function(){
			for(var i = 0; i < frm1.coupon_no.length; i++) {
				if(frm1.coupon_no[i].checked) {
					$('.r_'+i).css('background','gray');
				} else $('.r_'+i).css('background','white');
			}
		});
	});
	
// 취소 버튼 이벤트
	function cancel() {
		window.close();
	}

// 쿠폰 사용 안함 이벤트
	function unuse() {
		frm1.action='couponUnuse.do';
		frm1.submit(); 
}
</script>
</head>
<body>
<form action="couponUpdate.do" method="get" name="frm1">
	<div>
		<h3>쿠폰종류</h3>
		<hr>
		<c:if test="${empty couponList}">
			<p>쿠폰이 없습니다.</p>
		</c:if>
		<c:if test="${not empty couponList}">
			<c:forEach var="coupon" items="${couponList}" varStatus="status">
				<div class="r_${status.index}" id="box">
					<c:if test="${coupon.coupon_situation == 'y'}">
						<input type="radio" id="l_${status.index}" name="coupon_no" checked="checked" value="${coupon.coupon_no}" >
					</c:if>
					<c:if test="${coupon.coupon_situation == 'n'}">
						<input type="radio" id="l_${status.index}" name="coupon_no" value="${coupon.coupon_no}">
					</c:if>
					<label for="l_${status.index}">
					${coupon.coupon_no}<br>
					${coupon.coupon_image}<br>
					${coupon.coupon_kind}<br>
					<span class="a_${coupon.coupon_no}">${coupon.coupon_discount}</span><br>
					쿠폰 사용예정${coupon.coupon_situation}<br>
					삭제여부${coupon.del}
					</label>
				</div>
				<hr>
				<script type="text/javascript">
				// 선택 버튼 이벤트
				function check() {
					var t = $('input[name="coupon_no"]:checked').val();
					if (parseInt($('.a_'+t).text()) > ${total_price} ) {
						alert("주문 금액보다 큰 쿠폰은 사용할 수 없습니다.");
						return false;
					} else frm1.submit();
				}
				</script>
			</c:forEach>
		</c:if>
		<input type="button" value="선택" onclick="check()">
		<input type="button" value="취소" onclick="cancel()">
		<input type="button" value="쿠폰 사용 안함" onclick="unuse()">
	</div>
</form>
</body>
</html>