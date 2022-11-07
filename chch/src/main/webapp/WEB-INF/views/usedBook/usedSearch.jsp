<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ include file="../header.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function selectSearch(value1, value2) {
		document.getElementById("searchResult1").value=value1;
		document.getElementById("searchResult2").value=value2;
	}

</script>


</head>
<body>
	<div>
		<c:if test="${empty bookList }">
			<div>데이터가 없습니다</div>
		</c:if>
		<c:if test="${not empty bookList }">
			<c:forEach var="book" items="${bookList }">
				<div class="listRowBook">
					<div class="listColumnBook book_title" onclick="selectSearch(${book.book_no}, '${book.book_title}')"
						style="cursor: pointer;">${book.book_title}</div>
					<div class="listColumnBook book_author">${book.book_author }</div>
					<div class="listColumnBook book_publisher">${book.book_publisher}</div>
					<div class="listColumnBook book_kind">${book.book_kind }</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<div id="searchResultArea">
		<input id="searchResult1" name="book_no" value="" type="hidden" >
		<input id="searchResult2" name="book_title" value="" type="text" readonly required="required">
	</div>
</body>
</html>