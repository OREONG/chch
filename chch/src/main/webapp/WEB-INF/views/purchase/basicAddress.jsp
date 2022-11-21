<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// radio 선택시 div 색 변경 이벤트
	$(function() {
		$("input[name='delivery_no']").click(function(){
			for(var i = 0; i < frm1.delivery_no.length; i++) {
				if(frm1.delivery_no[i].checked) {
					$('.r_'+i).css('background','gray');
				} else $('.r_'+i).css('background','white');
			}
		});
	});
	
// 선택 버튼 이벤트
	function check() {
		frm1.submit();
	}

// 취소 버튼 이벤트
	function cancel() {
		window.close();
	}

</script>
</head>
<body>
<form action="basicAddressUpdate.do" method="get" name="frm1">
	<div>
		<h2>배송지 목록</h2>
		<hr>
		<h3>기본 배송지</h3>
		<hr>
		<c:if test="${empty deliveryList2}">
			<p>배송지가 없습니다.</p>
		</c:if>
		<c:if test="${not empty deliveryList2}">
			<c:forEach var="delivery" items="${deliveryList2}" varStatus="status">
				<div class="r_${status.index}" id="box">
					<c:if test="${delivery.delivery_basic == 'y'}">
						<input type="radio" id="l_${status.index}" name="delivery_no" checked="checked" value="${delivery.delivery_no}" >
					</c:if>
					<c:if test="${delivery.delivery_basic != 'y'}">
						<input type="radio" id="l_${status.index}" name="delivery_no" value="${delivery.delivery_no}">
					</c:if>
					<label for="l_${status.index}">
					${delivery.delivery_no}<br>
					${delivery.delivery_name}<br>
					${delivery.delivery_phone}<br>
					${delivery.delivery_address} ${delivery.delivery_address_detail}
					${delivery.delivery_address_detail_extra}<br>
					기본배송지${delivery.delivery_basic}<br>
					삭제여부${delivery.del}
					</label>
					<script type="text/javascript">
					// 삭제 버튼 이벤트
					function bye() {
						var del = window.confirm("삭제하시겠습니까?");
						if (del) {
							frm1.action='basicAddressDelete.do';
							frm1.submit(); 
						} else alert("취소되었습니다.");
					} 
					</script>
				</div>
				<hr>
			</c:forEach>
		</c:if>
		<input type="button" value="선택" onclick="check()">
		<input type="button" value="삭제" onclick="bye()">
		<input type="button" value="취소" onclick="cancel()">
	</div>
</form>
</body>
</html>