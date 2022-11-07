<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chackcheckPrac/resources/css/author.css");</style>
</head>
<body>
<main>
	<div class="main-container">
		<div class="container">
		<div id="back_click" onclick="location.href='authorMain.do'"><span id="back">&lt; 돌아가기</span></div>
			<form action="authorIntroConfirm.do" method="post" name="frm">
				<span id="author-input">새 작품 등록</span>
				<hr>
				<div><input type="text" id="authorTitle-input" name="author_subject" required="required" placeholder="작품 제목을 입력하세요" autofocus="autofocus"></div>
				<div>
					<select name="author_class" id="authorClass-select" required="required">
						<option value="" hidden="true">장르 선택</option>
						<option value="로맨스">로맨스</option>
						<option value="로판">로판</option>
						<option value="판타지">판타지</option>
						<option value="무협">무협</option>
						<option value="미스터리">미스터리</option>
						<option value="라이트노벨">라이트노벨</option>
						<option value="자유장르">자유장르</option>
					</select>
				</div>
				<div><textarea rows="10" id="author_introTextArea" name="author_introduce" placeholder="작품 소개를 입력해주세요"></textarea></div>
				
				<input type="submit" id="input-btn" value="작품 등록">
			</form>
		</div>
	</div>
</main>
</body>
</html>