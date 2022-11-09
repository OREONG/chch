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
		
		if(count<=0) {
			alert("책을 선택해주세요");
			return false;
		} else {
			return true;
		}
		
	}
	
</script>

</head>
<body>

	<div class="adminTitleTextArea">
		책목록
	</div>
	<form action="adminBookDelete.do">
		<div>
			<div style="display: flex; justify-content: space-between;" align="center">
				<div>
					<input type='checkbox' name='selectChk' value="selectAll" onclick='selectAll(this)' />
				</div>
				<div>책번호</div>
				<div>책이름</div>
				<div>지은이</div>
				<div>출판사</div>
				<div>재고</div>
				<div>가격</div>
				<div>출판일</div>
				<div>등록일</div>
				<div>분류</div>
				<div>del</div>
			</div>
			<c:if test="${empty bookList }">
				<div>데이터가 없습니다</div>
			</c:if>
			<c:if test="${not empty bookList }">
				<c:forEach var="book" items="${bookList }">
					<div  style="display: flex; justify-content: space-between;" align="center">
						<div>
							<input type="checkbox" name="selectChk" value="${book.book_no }">
						</div>
						<div>${book.book_no }</div>
						<div onclick="location.href='adminBookDetail.do?book_no=${book.book_no}'" style="cursor: pointer;">${book.book_title}</div>
						<div>${book.book_author }</div>
						<div>${book.book_publisher}</div>
						<div>${book.book_count}</div>
						<div>${book.book_price }</div>
						<div>${book.book_publish_date}</div>
						<div>${book.book_reg_date }</div>
						<div>${book.book_kind }</div>
						<div>${book.book_del }</div>
					</div>
				</c:forEach>
			</c:if>


		</div>

		<br>

		<div align="center">
			<c:if test="${startPage > PAGE_PER_BLOCK }">
				<button type="button"
					onclick="location.href='adminBookList.so?pageNum=${startPage - 1}'">이전</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${currentPage == i }">
					<button type="button"
						onclick="location.href='adminBookList.so?pageNum=${i}'"
						class="page_btn_sel" >${i }</button>
				</c:if>
				<c:if test="${currentPage != i }">
					<button type="button"
						onclick="location.href='adminBookList.so?pageNum=${i}'" class="page_btn">${i }</button>
				</c:if>
			</c:forEach>
			<c:if test="${totalPage > endPage }">
				<button type="button"
					onclick="location.href='adminBookList.so?pageNum=${endPage + 1}'">다음</button>
			</c:if>
		</div>

		<div>
			<button type="button" onclick="location.href='adminBookAddForm.do'">책등록</button>
			<input type="submit" id="submit1" value="책노출" onclick="return check()">
		</div>
	</form>
	<div>
		<br>
		<button type="button" onclick="location.href='adminMain.so'">관리자 메뉴</button>
	</div>

</body>
</html>