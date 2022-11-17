<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<form action="authorWritingConfirm.do">
		<div id="back_click" onclick="location.href='authorMain.do'"><span id="back">&lt; 돌아가기</span></div>
			<input type="hidden" name="author_no" value="${author_no }">
			<span id="author-input">회차 쓰기</span>
			<hr>
			<div>
				<input type="text" id="authorTitle-input" name="author_work_subject" required="required" placeholder="제목을 입력하세요">
			</div>
			<div>
				<textarea id="author_work_contentText" rows="15" cols="" name="author_work_content" required="required" placeholder="내용을 입력하세요"></textarea>
			</div>
			<div>
				<textarea id="author_work_commentText" rows="10" cols="" name="author_work_comment" placeholder="작가의 말을 입력하세요 *생략가능"></textarea>
			</div>
			<input type="submit" id="input-btn2" value="등록하기">
		</form>
	</div>

</div>
</main>
</body>
</html>