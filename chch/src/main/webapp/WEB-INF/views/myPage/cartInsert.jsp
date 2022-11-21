<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("장바구니에 상품이 추가되었습니다.");
		location.href="newDetail.do?book_no=${book_no}&pageNum=${pageNum}";
		</script>
	</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("장바구니 추가 실패");
		history.go(-1);
	</script>
</c:if>
</body>
</html>