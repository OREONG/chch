<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("구매 성공");
			location.href="purchaseFinish.do";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("구매 실패");
			history.back();
		</script>
	</c:if>
	<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("배송주소가 기존에 있습니다");
		history.back();
	</script>
</c:if>
</body>
</html>