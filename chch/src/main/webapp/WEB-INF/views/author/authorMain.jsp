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
	function authorEachFun(author_no) {
		location.href="authorEach.do?author_no="+author_no;
	}
</script>
</head>
<body>
<main>
	<div class="main-container">
	
		<div class="content">
			<h2>내 작품 모아보기</h2>
			
			<c:if test="${empty author_list} ">
			</c:if> 
			<c:if test="${not empty author_list }">
				
				<c:forEach var="author" items="${author_list }">	
					<div id="authorEachLink" onclick="authorEachFun(${author.author_no})">
						<div><span id="main-subejectText">${author.author_subject }</span></div>
						<div><span id="main-introText">${author.author_introduce }</span></div>
					</div>
						<div id="a-wrap">
							<a href="authorWriting.do?author_no=${author.author_no }" id="writeBtn">회차쓰기</a>
							<a href="authorUpdate.do?author_no=${author.author_no }" id="updateBtn">작품 정보 수정</a><p>
						</div>
					
					
					
					<hr>
					<p>	
				</c:forEach>
				
			
			</c:if>
			<a href="authorIntro.do">새 작품 쓰기</a>
		</div>
	</div>
</main>
</body>
</html>