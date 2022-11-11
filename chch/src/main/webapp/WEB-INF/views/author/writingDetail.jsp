<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/chch/resources/css/star.css" rel="stylesheet"/>
<style type="text/css">@import url("/chch/resources/css/author_work.css");</style>
<script type="text/javascript">
function del(author_work_no) {
	var cf = confirm("정말로 삭제하시겠어요?");
	if (cf) location.href="author_workDeleteConfirm.do?author_work_no="+author_work_no;
	else alert("삭제가 취소되었습니다");
}
</script>
</head>
<body>
<main>
<div class="main-container">
	<div class="content">

			<div id="back_click" onclick="location.href='authorEach.do?author_no=${author_work.author_no}'"><span id="back">&lt; 돌아가기</span></div>
			<div class="subject-readCount-div">
				<span id="subject-text">${author_work.author_work_subject }</span>
				<span id="readCount-text">조회수 | ${author_work.author_work_count }</span>
			</div>
			<hr class="hr1">
			<div class="content-div" style="white-space:pre;"><span>${author_work.author_work_content }</span></div>
			<div class="comment-div" style="white-space:pre;">
				<div class="comment-sub-div">작가의 말<hr class="hr2">${author_work.author_work_comment }</div>
			</div>
			
			<c:if test="${author_work.id == id }">
			<div class="a-div">
				<a href="author_workUpdate.do?author_work_no=${author_work.author_work_no }">수정</a>
				<a onclick="del(${author_work.author_work_no})">삭제</a> <!-- 진짜 삭제하기 update ㄴㄴ -->
			</div>
			</c:if>


		<div>
		
		이전화 다음화
		
		</div>


		<div class="review-div">
		
		<!-- 댓글 리스트 -->
		<h3>댓글()</h3>
		<!-- 댓글, 별점 -->
		<form action="reviewWrite.do"  class="mb-3" name="myform" id="myform" method="post">
			
				<br>
				<div class="review-textarea-div">
					<span>${author_work.id }</span>
					<hr id="textarea-hr">
					<textarea rows="5" cols="110" name="review_content" placeholder="타인의 기분을 불쾌하게 하는 댓글은 삭제될 수 있습니다"></textarea>
<!-- 					<fieldset>
						<input type="radio" name="reviewStar" value="5" id="rate1">
						<label for="rate1">★</label>
						<input type="radio" name="reviewStar" value="4" id="rate2">
						<label for="rate2">★</label>
						<input type="radio" name="reviewStar" value="3" id="rate3">
						<label for="rate3">★</label>
						<input type="radio" name="reviewStar" value="2" id="rate4">
						<label for="rate4">★</label>
						<input type="radio" name="reviewStar" value="1" id="rate5">
						<label for="rate5">★</label>
					</fieldset> -->
					<input id="input-btn" type="submit" value="등록">
					<input type="hidden" value="${author_work.author_work_no }" name="author_work_no">
					
				</div>
				
				
		</form>	
		<hr>
		<c:if test="${empty review_list }">
			아직 댓글이 없습니다
		</c:if>
		<c:if test="${not empty review_list }">
			<c:forEach var="review" items="${review_list }">
				
				<div>
					아이디 | ${review.id }<p>
					내용 | ${review.review_content }<p>
					등록일 | ${review.review_reg_date }<p>
	 				 <p>
	  				<c:if test="${review.like_review_no == 1 }">
								<a href="likeDelete_review.do?review_no=${review.review_no }&author_work_no=${author_work.author_work_no }">좋아요 : ${review.review_like_count } ♥</a><p>
	
					</c:if>
					<c:if test="${review.like_review_no == 0 }">
							<a href="likeInsert_review.do?review_no=${review.review_no }&author_work_no=${author_work.author_work_no }">좋아요 : ${review.review_like_count } ♡</a><p>
	
					</c:if>
			
					<c:if test="${review.id == id }">
						<a href="">수정</a>
						<a href="">삭제</a>
					</c:if>
				</div> 
				<hr>
			</c:forEach>
		</c:if>

	

		</div>




	</div>
</div>
</main>

</body>
</html>