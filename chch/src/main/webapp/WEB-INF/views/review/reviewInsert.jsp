<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("리뷰가 등록되었습니다.");
			location.href="newDetail.do?book_no=${review.book_no}"
// 			location.reload();
// 			opener.location.reload();
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("리뷰 등록 실패");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			alert("로그인이 필요한 서비스 입니다");
			location.href="/chchtest/member/loginForm.do";
		</script>
	</c:if>
</body>
</html>