<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>
</head><body>
	<div>
		<button onclick="location.href='adminMemberList.do'" class="btn btn-info">회원관리</button>
		<button onclick="location.href='adminBookList.do'" class="btn btn-primary">책관리</button>
		<button onclick="location.href='adminInquiryBeforeList.do?inquiryNumber=1'" class="btn btn-primary">문의사항관리</button>
		<!-- <div class="adminItem" style="cursor: pointer; margin: 20px;" onclick="location.href='/chackcheck/views/admin/adminInquiryBeforeList.so?csInquiryNumber=1'"><img alt="" src="/chackcheck/images/adminMain3.png" width="180px"><br>문의사항관리</div> -->
	</div>
	<br>
	<div>
		<button onclick="location.href='main.do'" class="btn">메인</button>
	</div>
</body>
</html>