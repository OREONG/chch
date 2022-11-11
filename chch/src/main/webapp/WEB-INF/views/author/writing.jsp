<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/author.css");</style>
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
			<a href="authorMain.do" id="writingBtn">나도 글쓰기</a>
			<hr>
			
			<!-- 관심 많은 순 리스트 -->
			인기 랭킹
			<div class="likeDesc_content">
				<c:if test="${empty authorAll_list }">
					글이 없습니다
				</c:if>
				<c:if test="${not empty authorAll_list }">
				<div class="row-div">

					<c:forEach var="author" items="${authorAll_list }">
						<!-- 관심 순은 가로 출력 -->	
						
							<div class="list-div">
								<a href="authorEach.do?author_no=${author.author_no}">	
									<c:set var="num" value="${num + 1 }"/>
									
									${num}
									<div > 
										<span id="a_subject">${author.author_subject }</span> 
									</div>
									<div class="a_sub" >
										<span  class="a_sub" >${author.id } | ${author.author_class }</span>
									</div>
									<div class="a_sub" id="a_like">
										<span class="a_sub">관심 ${author.like_count }</span>
									</div> 
								</a>
							</div>
					</c:forEach>
					</div>
				</c:if>
			</div>
			
			<hr>
			
			<!-- 최신 글 순 리스트 -->
			신작
			<div class="dateDesc_content">
				<c:if test="${empty authorAllDate_list }">
					글이 없습니다
				</c:if>
				<c:if test="${not empty authorAllDate_list }">
					<c:forEach var="author" items="${authorAllDate_list }">	
						<a href="authorEach.do?author_no=${author.author_no}">	
							<div class="list-div">
								<span id="a_subject">${author.author_subject }</span> 
								<div>
									<span class="a_sub" >${author.author_introduce }</span>
								</div>
								<span class="a_sub" >${author.id } | ${author.author_class } | </span>
								<span class="a_sub">관심 ${author.like_count }</span>
							</div> 
							
						</a>
						<p>
					</c:forEach>
				</c:if>
			</div>
			
		</div>
	</div>
</main>
</body>
</html>