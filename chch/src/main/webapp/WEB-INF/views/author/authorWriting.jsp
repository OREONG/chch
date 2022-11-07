<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>
글쓰기 폼

<div class="main-container">
	<form action="authorWritingConfirm.do">
		<input type="hidden" name="author_no" value="${author_no }">
		<div>
			제목
			<input type="text" name="author_work_subject" required="required">
		</div>
		<div>
			내용<p>
			<textarea rows="15" cols="" name="author_work_content" required="required"></textarea>
		</div>
		<div>
			작가의 말<p>
			<textarea rows="10" cols="" name="author_work_comment"></textarea>
		</div>
		<input type="submit" value="등록하기">
	</form>
</div>


</main>
</body>
</html>