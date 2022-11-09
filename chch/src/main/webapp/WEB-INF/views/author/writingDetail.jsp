<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/chch/resources/css/star.css" rel="stylesheet"/>

</head>
<body>

	
	<div>제목 | ${author_work.author_work_subject }</div>
	<div>조회수 | ${author_work.author_work_count }</div>
	<div>내용 | ${author_work.author_work_content }</div>
	<div>작가의 말 |  ${author_work.author_work_comment }</div>
	
	<c:if test="${author_work.id == id }">
	<a href="">수정</a>
	<a href="">삭제</a> <!-- 진짜 삭제하기 update ㄴㄴ -->
	</c:if>
	
	<!-- 별점 -->
 	별점 남기기
	<form class="mb-3" name="myform" id="myform" method="post">
		<fieldset>
			<input type="radio" name="reviewStar" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="reviewStar" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="reviewStar" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="reviewStar" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="reviewStar" value="1" id="rate5"><label
				for="rate5">★</label>
		</fieldset>
		<input>
	</form>	

	<hr>
	<!-- 댓글기능 -->
	
	댓글 | 댓글수
	<div>
		<form action="${path }/myPage/reviewWrite.do" method="post">
			<input type="hidden" value="${author_work.author_work_no }" name="author_work_no">
			${author_work.id }<br>
			<textarea rows="10" name="review_content"></textarea>
			<input type="submit" value="등록">
		</form>
	</div>
	
	<hr>
	
	
	<!-- 댓글 리스트 -->
	<h3>댓글</h3>
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
				review.like_review_no = ${review.like_review_no }
  				<c:if test="${review.like_review_no == 1 }">
							<a href="${path }/myPage/likeDelete_review.do?review_no=${review.review_no }&author_work_no=${author_work.author_work_no }">좋아요 : ${review.review_like_count } ♥</a><p>

				</c:if>
				<c:if test="${review.like_review_no == 0 }">
						<a href="${path }/myPage/likeInsert_review.do?review_no=${review.review_no }&author_work_no=${author_work.author_work_no }">좋아요 : ${review.review_like_count } ♡</a><p>

				</c:if>
		
				<c:if test="${review.id == id }">
					<a href="">수정</a>
					<a href="">삭제</a>
				</c:if>
			</div> 
			<hr>
		</c:forEach>
	</c:if>

	

	






</body>
</html>