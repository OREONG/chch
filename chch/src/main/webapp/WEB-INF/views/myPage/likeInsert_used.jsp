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
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("중고책 찜 등록");
		history.go(-1);
		//location.href="like_list.do?id=${like.id}"
	</script>
</c:if>
<c:if test="${result <= 0 }">
	<script type="text/javascript">
		alert("찜 등록실패");
		history.go(-1);
	</script>
</c:if>
</body>
</html>