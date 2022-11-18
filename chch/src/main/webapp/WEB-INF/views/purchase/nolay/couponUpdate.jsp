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
			alert("쿠폰이 선택되었습니다");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("다시 시도해주세요");
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