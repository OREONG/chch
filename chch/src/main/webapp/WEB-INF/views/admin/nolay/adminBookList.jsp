<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"> 
	function selectAll(selectAll) {  
		const checkboxes1 = document.getElementsByName('selectChk');
		
		checkboxes1.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	}
	
	function check() {
		const checkboxes2 = document.getElementsByName('selectChk');
		
		let count = 0;
		for (let i=0; i<checkboxes2.length;i++) {
			if (checkboxes2[i].checked == true) {
				count++;
			}
		}
		
		var obj = $("[name=selectChk]");
		var selectChk = Array();
		
		$('input:checkbox[name=selectChk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
			selectChk.push(this.value);
        });
		
		if(count<=0) {
			alert("책을 선택해주세요");
			return false;
		} else {
			$(function() {
				$.ajax({
				    url: 'adminBookDelete.do',
					type : "POST",
					async : true,
					traditional: true,
					data: {"selectChk" : selectChk},
					dataType : "json",
					cache : false
				});
				alert("공개여부가 변경되었습니다");
				showPage('adminBookList.do?pageNum=${currentPage}');
			});
		}
	}
	
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
	
	
</script>

</head>
<body>

	<div id="subject-text" class="subject-container">
		책목록
	</div>
	
	<!-- <form action="adminBookDelete.do"> -->
	
	<div>
		<div class="title-table-row">
			<span class="title-cell table-book-col1 center">
				<input type='checkbox' name='selectChk' value="selectAll" onclick='selectAll(this)' />
			</span>
			<span class="title-cell table-book-col2 center">책번호</span>
			<span class="title-cell table-book-col3 center">책이름</span>
			<span class="title-cell table-book-col4 center">지은이</span>
			<span class="title-cell table-book-col5 center">출판사</span>
			<span class="title-cell table-book-col6 center">재고</span>
			<span class="title-cell table-book-col7 center">가격</span>
			<span class="title-cell table-book-col8 center">출판일</span>
			<span class="title-cell table-book-col9 center">분류</span>
			<span class="title-cell table-book-col10 center">공개</span>
		</div>
		<c:if test="${empty bookList }">
			<div>데이터가 없습니다</div>
		</c:if>
		<c:if test="${not empty bookList }">
			<c:forEach var="book" items="${bookList }">
				<div class="table-row">
					<span class="cell table-book-col1 center">
						<input type="checkbox" name="selectChk" value="${book.book_no }">
					</span>
					<span class="cell table-book-col2 center">${book.book_no }</span>
					<span class="cell table-book-col3" onclick="location.href='adminBookDetail.do?book_no=${book.book_no}'" style="cursor: pointer;">${book.book_title}</span>
					<span class="cell table-book-col4">${book.book_author }</span>
					<span class="cell table-book-col5">${book.book_publisher}</span>
					<span class="cell table-book-col6 center">${book.book_count}</span>
					<span class="cell table-book-col7 center">${book.book_price }</span>
					<span class="cell table-book-col8 center">${book.book_publish_date}</span>
					<span class="cell table-book-col9 center">${book.book_kind }</span>
					<span class="cell table-book-col10 center">${book.book_del }</span>
				</div>
			</c:forEach>
		</c:if>


	</div>


	<div class="paging-div">
		<c:if test="${empty bookList }">
		</c:if> 
		<c:if test="${not empty bookList }">
			
			<ul class="pagination-ul">
				<c:if test="${startPage > PAGE_PER_BLOCK }">
					<li class="pre-btn">
						<a onclick="showPage('adminBookList.do?pageNum=1')">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
					</li>
					<li class="pre-btn">
						<a onclick="showPage('adminBookList.do?pageNum=${startPage - 1}')">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
					</li>							
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage == i }">
						<li class="active-btn">
							<a onclick="showPage('adminBookList.do?pageNum=${i}')">${i }</a>
						</li>
					</c:if>
					<c:if test="${currentPage != i }">
						<li class="non-active-btn">
							<a onclick="showPage('adminBookList.do?pageNum=${i}')">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<li class="next-btn">
						<a onclick="showPage('adminBookList.do?pageNum=${endPage}')">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</li>
					<li class="next-btn">
						<a onclick="showPage('adminBookList.do?pageNum=${endPage + 1}')">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</li>
				</c:if>
			</ul>
			
		</c:if>
	</div>

		<div>
			<button type="button" class="action-btn" onclick="showPage('adminBookAddForm.do')" >책등록</button>
			<button type="button" class="action-btn" id="submit1" onclick="check()">책공개</button>
		</div>
	<!-- </form> -->

</body>
</html>