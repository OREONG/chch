<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/author.css");</style>
<script type="text/javascript">
	function del(author_no) {
		var cf = confirm("정말로 삭제하시겠어요? 삭제 시 작품의 모든 회차가 같이 삭제됩니다");
		if (cf) location.href="authorDeleteConfirm.do?author_no="+author_no;
		else alert("삭제가 취소되었습니다");
	}
</script>
</head>
<body>
<main>
	<div class="main-container">
		<div class="container">
			<form action="authorUpdateConfirm.do" method="post" name="frm">
				<input type="hidden" value=${author.author_no } name="author_no">
				<span id="author-input">작품 소개 수정</span>
				<hr>
				<div><input type="text" id="authorTitle-input" name="author_subject" required="required" value="${author.author_subject }" autofocus="autofocus"></div>
				<div>
					<select name="author_class" id="authorClass-select" required="required">
						<option value="${author.author_class }">${author.author_class }</option>
						<option value="로맨스">로맨스</option>
						<option value="로판">로판</option>
						<option value="판타지">판타지</option>
						<option value="무협">무협</option>
						<option value="미스터리">미스터리</option>
						<option value="라이트노벨">라이트노벨</option>
						<option value="자유장르">자유장르</option>
					</select>
				</div>
				<div><textarea style="white-space:pre;" rows="10" id="author_introTextArea" name="author_introduce" >${author.author_introduce }</textarea></div>
				
				<input type="submit" id="input-btn" value="작품 수정">
			</form>
			<button id="deleteBtn" onclick="del(${author.author_no })">삭제</button>
		</div>
	</div>
</main>
</body>
</html>