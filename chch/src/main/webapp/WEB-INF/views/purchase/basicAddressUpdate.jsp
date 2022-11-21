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
	<c:if test="${result2 > 0 }">
		<script type="text/javascript">
			alert("기본배송지가 선택되었습니다");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>
	<c:if test="${result2 == 0 }">
		<script type="text/javascript">
			alert("배송지 선택이  실패하였습니다");
			history.back();
		</script>
	</c:if>
	<c:if test="${result2 == -1}">
	<script type="text/javascript">
		alert("?");
		history.back();
	</script>
	</c:if>
</body>
</html>