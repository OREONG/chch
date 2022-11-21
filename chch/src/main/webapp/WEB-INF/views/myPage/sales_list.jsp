<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
@import url("/chch/resources/css/list.css");
@import url("/chch/resources/css/gallery.css");
@import url("/chch/resources/css/paging.css");
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
<div id="board_wrap">
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
					<div class="info">${deal.deal_date}</div>
					
					<div class="used_subject">${deal.used_subject }</div>
					<div class="price"><fmt:formatNumber value="${deal.used_price}" pattern="#,###" type="currency"/>원</div>
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
			<!-- 페이징 -->
		<div class="paging-div">
 				<c:if test="${empty sales_list }">
				</c:if> 
				<c:if test="${not empty sales_list }">
					
					<ul class="pagination-ul">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="pre-btn">
								<a href="sales_list.do?id=${id}&pageNum=1">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>
							<li class="pre-btn">
								<a href="sales_list.do?id=${id}&pageNum=${pb.startPage-1 }">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active-btn">
									<a href="sales_list.do?id=${id}&pageNum=${i }">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="non-active-btn">
									<a href="sales_list.do?id=${id}&pageNum=${i }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="next-btn">
								<a href="sales_list.do?id=${id}&pageNum=${pb.endPage }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
							<li class="next-btn">
								<a href="sales_list.do?id=${id}&pageNum=${pb.endPage+1 }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
						</c:if>
					</ul>
					
				</c:if>
		</div>
		<!-- 페이징 끝 -->
			
		</div>
		<div class="board_mainbtns">
			<a href="main.do" class="board_bigorderbtn left">메인으로</a>
		</div>
</div>
</body>
</html>