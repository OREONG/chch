<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/authorEach.css");</style>
<style type="text/css">@import url("/chch/resources/css/paging.css");</style>
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
			<div class="main-text"><span>내 작품 리스트</span></div>
			<c:if test="${empty author_list} ">
			</c:if> 
			<c:if test="${not empty author_list }">
				
				<c:forEach var="author" items="${author_list }">	
					<div id="authorEachLink" onclick="authorEachFun(${author.author_no})">
						<div class="subject-div"><span id="main-subejectText">${author.author_subject }</span></div>
						<div><span id="main-introText">${author.author_introduce }</span></div>
					</div>
						<div id="a-wrap">
							<a href="authorWriting.do?author_no=${author.author_no }" id="writeBtn2">회차쓰기</a>
							<a href="authorUpdate.do?author_no=${author.author_no }" id="updateBtn2">작품 정보 수정</a><p>
						</div>
					
					
					
					<hr>
					<p>	
				</c:forEach>
				
			</c:if>
			
			
				<div class="paging-div">
				<!-- 페이징 작업 -->
 				<c:if test="${empty author_list }">
					<div id="nonData-btn-wrap">
						<!-- <button id="preBtn">이전</button>
						<button id="pageClick-btn" style="">0</button>
						<button id="nextBtn">다음</button> -->
					</div>
				</c:if> 
				<c:if test="${not empty author_list }">
					
					<ul class="pagination-ul">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="pre-btn">
								<a href="authorMain.do?pageNum=1">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>
							<li>
								<a id="pre-btn" href="authorMain.do?pageNum=${pb.startPage-1 }">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active-btn">
									<a href="authorMain.do?pageNum=${i }">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="non-active-btn">
									<a href="authorMain.do?pageNum=${i }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="next-btn">
								<a href="authorMain.do?pageNum=${pb.endPage+1 }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
							<li>
								<a href="authorMain.do?pageNum=${pb.endPage }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
						</c:if>
					</ul>
					
				</c:if>
				</div>
				<!-- 페이징 끝 -->
			
			
			<a href="authorIntro.do" id="writeBtn3">새 작품 쓰기</a>
		</div>
	</div>
</main>
</body>
</html>