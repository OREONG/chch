<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
@import url("${path}/resources/css/list.css");
@import url("${path}/resources/css/gallery.css");
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#chkAll").click(function() {
			if ($("#chkAll").is(":checked"))
				$("input[name=chk]").prop("checked", true);
			else
				$("input[name=chk]").prop("checked", false);
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
	
			if (total != checked)
				$("#chkAll").prop("checked", false);
			else
				$("#chkAll").prop("checked", true);
		});
	});

	function delSelect() {
		var sales_Select = 0;
		
		
		$('input[name=chk]:checked').each(function() {
			sales_Select += $(this).next('.no').val()+",";			
		});
		   location.href="sales_DelAll.do?sales_Select="+sales_Select;   
		
	}
</script>
</head>
<body>
<div class="board_name">판매목록</div>
	
	<div class="board_list_wrap">
		<div class="board_list" id="list_Area">
			<div class="board_list_head">
				<div class="checkbox">
					<input type="checkbox" id="chkAll" name="chkAll" /> <!-- onclick="chkAll()" -->
				</div>
				<div class="num">번호</div>
				<div class="img">책이미지</div>
				<div class="product">상품정보</div>
				<div class="tot">수량</div>
				<div class="info">판매날짜</div>
				<div class="used_subject">중고 글 제목</div>
				<div class="price">가격</div>
				<div class="delete" id="">삭제</div>
			</div>

			<div class="board_list_body">
			<c:if test="${empty sales_list }">
					  <div id="show">판매한 상품이 없습니다. 물건을 올려보세요.</div>
			</c:if>
				<c:if test="${not empty sales_list }">
					<c:forEach var="deal" items="${sales_list }">
					<c:set var="i" value="${i+1 }"/>	
				<div class="item">
					<div class="checkbox">
						<input type="checkbox" name="chk" > <!-- onclick="check()" -->
						<input type="hidden" value="${deal.deal_no}" class="no" >
						
					</div>
					<div class="num">${i }</div>
					<div class="img">
						<a href="#"> <img alt="책이미지" src="resources/images/${deal.book_image }" 
							style="width: 10%">
						</a>
					</div>
					
					<div class="product">제목 : ${deal.book_title }<br>저자 : ${deal.book_author }</div>
					<div class="tot">${deal.deal_count }</div>
					<div class="info">${deal.deal_Date}</div>
					
					<div class="used_subject">${deal.used_subject }</div>
					<div class="price"><fmt:formatNumber value="${deal.deal_price}" pattern="#,###" type="currency"/>원</div>
					<div class="delete"><input type="button" value="삭제" name="deal_no" class="del"
						onclick="location.href='sales_list_Update.do?deal_no=${deal.deal_no}'"></div>
				</div>
		</c:forEach>
		</c:if>
			</div>
			</div>
		<div class="select_product">
		<button class="board_list_optionbtn_del" type="button"
			id="deleteButton" onclick="delSelect()">선택 삭제</button>
			</div>
		</div>
		<div class="board_mainbtns">
			<a href="main.do" class="board_bigorderbtn left">메인으로</a>
		</div>
</body>
</html>