<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/author.css");</style>

</head>
<body>
<main>
<div class="main-container">
	<div class="container">
		<form action="author_workUpdateConfirm.do">
		<div id="back_click" onclick="location.href='authorMain.do'"><span id="back">&lt; 돌아가기</span></div>
			<input type="hidden" name="author_work_no" value="${author_work.author_work_no }">
			<span id="author-input">회차 수정</span>
			<hr>
			<div>
				<input type="text" id="authorTitle-input" name="author_work_subject" required="required" value="${author_work.author_work_subject }">
			</div>
			<div>
				<textarea id="author_work_contentText" rows="15" cols="" name="author_work_content" required="required">${author_work.author_work_content }</textarea>
			</div>
			<div>
				<c:if test="${author_work.author_work_comment != null }">
					<textarea id="author_work_commentText" rows="10" cols="" name="author_work_comment">${author_work.author_work_comment }</textarea>
				</c:if>
				<c:if test="${author_work.author_work_comment == null }">
					<textarea id="author_work_commentText" rows="10" cols="" name="author_work_comment" placeholder="작가의 말을 입력하세요 *생략가능"></textarea>
				</c:if>
			</div>
			<input type="submit" id="input-btn2" value="수정하기">
		</form>
	</div>

</div>
</main>
</body>
</html>