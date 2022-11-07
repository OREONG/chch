<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function writingDetailFun(author_work_no) {
		location.href="writingDetail.do?author_work_no="+author_work_no;
	}
</script>
</head>
<body>
<h2>작품 상세 페이지</h2>


제목 | ${author.author_subject }<p>
별점<p>
작품 설명 | ${author.author_introduce }<p>
<c:if test="${like_table == null }">
<a href="${path }/myPage/likeInsert_author.do?author_no=${author.author_no }">관심 : ♡</a><p>
</c:if>
<c:if test="${like_table != null }">
<a href="${path }/myPage/likeDelete_author.do?author_no=${author.author_no }">관심 : ♥</a><p>
</c:if>
<div>관심수 | ${author.like_count }</div> 

<c:if test="${author.id == id }">
	<a href="" class="btn btn-warning">작품 정보 수정</a><p>
	<a href="authorWriting.do?author_no=${author.author_no }" class="btn btn-info">회차쓰기</a>
</c:if>
<c:if test="${author.id != id }">
	<a href="" class="btn btn-warning">첫화 보기</a><p>
	
</c:if>
<hr>

<c:if test="${empty authorWork_list}">
	아직 회차를 작성하지 않았습니다
</c:if>
<c:if test="${not empty authorWork_list}">
	<c:forEach var="author_work" items="${authorWork_list }">
		<div onclick="writingDetailFun(${author_work.author_work_no })"> 
			제목 | ${author_work.author_work_subject }<p>
			내용 | ${author_work.author_work_content }<p>
		</div> 
		
		<hr>
	</c:forEach>
</c:if>

</body>
</html>