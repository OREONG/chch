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
			alert("예약 성공");
			window.reload();
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("예약 실패");
			history.back();
		</script>
	</c:if>
	<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("?");
		history.back();
	</script>
</c:if>
</body>
</html>