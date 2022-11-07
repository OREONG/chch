<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("문의 입력 완료");
		location.href="inquiryList.do?inquiryNumber=2";
	</script>
</c:if>
<c:if test="${!(result > 0) }">
	<script type="text/javascript">
		alert("입력 실패");
		history.back();
	</script>
</c:if>

</body>
</html>