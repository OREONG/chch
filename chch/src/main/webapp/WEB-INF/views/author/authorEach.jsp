<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/authorEach.css");</style>

<script type="text/javascript">
	function writingDetailFun(author_work_no) {
		location.href="writingDetail.do?author_work_no="+author_work_no;
	}
</script>
</head>
<body>
<main>

	<div class="main-container">
		<div class="content">
			<div id="back_click" onclick="location.href='authorMain.do'"><span id="back">&lt; 돌아가기</span></div>
			<div id="subjectDiv">
				<span id="subjectText">${author.author_subject }</span>
				<div id="like-div">
				<div>
					<c:if test="${like_table == null }">
					<a href="likeInsert_author.do?author_no=${author.author_no }" ><img class="heart-img" src="/chch/resources/images/authorImg/heart-n.png"></a>
					</c:if>
					<c:if test="${like_table != null }">
					<a href="likeDelete_author.do?author_no=${author.author_no }" ><img class="heart-img" src="/chch/resources/images/authorImg/heart-y.png"></a>
					</c:if>
				</div>
				<div id="like-count">${author.like_count }</div> 
			</div>
			</div>
			<div id="subDiv">
				<span id="subText">${author.author_class } | ${author.id }</span>
			</div>
			<div id="subDiv2">
			<span id="introText">${author.author_introduce }</span>
			</div>
			<c:if test="${author.id == id }">
				<div id="a-wrap">
					<a href="authorWriting.do?author_no=${author.author_no }" id="writeBtn">회차쓰기</a>
					<a href="authorUpdate.do?author_no=${author.author_no }" id="updateBtn">작품 정보 수정</a><p>
				</div>
			</c:if>
			<c:if test="${author.id != id }">
				<a href="" id="firstWorkBtn">첫화 보기</a><p>
			</c:if>
			
			<!-- 작품 리스트 -->
			<div id="work">
				<span id="workText">작품 회차()</span>
			</div>
			<hr>
			
			<c:if test="${empty authorWork_list}">
				아직 회차를 작성하지 않았습니다
			</c:if>
			<c:if test="${not empty authorWork_list}">
				<c:forEach var="author_work" items="${authorWork_list }">
					<div onclick="writingDetailFun(${author_work.author_work_no })" id="work-div"> 
						<span id="workSubject-text">${author_work.author_work_subject }</span><p>
						<span id="workDate-text">${author_work.author_work_date }</span>
					</div> 
				
				</c:forEach>
			</c:if>
		</div>
	</div>

</main>
</body>
</html>