<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function authorEachFun(author_no) {
		location.href="authorEach.do?author_no="+author_no;
	}
</script>
</head>
<body>
	<h2>내가 쓴 작품들 리스트</h2>
	
	<c:if test="${empty author_list} ">
	</c:if>
	<c:if test="${not empty author_list }">
		
		<c:forEach var="author" items="${author_list }">	
			<div >
				<div onclick="authorEachFun(${author.author_no})">${author.author_subject }</div>
				<div>${author.author_introduce }</div>
				<a href="authorUpdate.do?author_no=${author.author_no }" class="btn btn-warning">작품 정보 수정</a><p>
				<a href="authorWriting.do?author_no=${author.author_no }" class="btn btn-info">회차쓰기</a>
			</div>
			
			
			<hr>
			<p>	
		</c:forEach>
		
	
	</c:if>
	<a href="authorIntro.do">새 작품 쓰기</a>

</body>
</html>