<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	console.log("result : ${result}")
</script>
</head>
<body>

<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("모임을 나갔습니다")
		location.href="communityAllList.do?";
	</script>
</c:if>
<c:if test="${!(result > 0) }">
	<script type="text/javascript">
		alert("가입 실패")
		history.back();
	</script>
</c:if>
		
</body>
</html>