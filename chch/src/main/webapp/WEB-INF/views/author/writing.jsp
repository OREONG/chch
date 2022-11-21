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
			<div class="wrting-div">
				<a href="authorMain.do" id="writingBtn">작품 쓰기</a>
			</div>
			
			<!-- 관심 많은 순 리스트 -->
			<div class="topDiv">
				<span class="top10">나도 작가되기 인기랭킹</span>
				<div class="likeDesc_content">
					<c:if test="${empty authorAll_list }">
						글이 없습니다
					</c:if>
					<c:if test="${not empty authorAll_list }">
					<div class="row-div">
	
						<c:forEach var="author" items="${authorAll_list }">
							<!-- 관심 순은 가로 출력 -->	
							
								<div class="like-list-div">
									<a href="authorEach.do?author_no=${author.author_no}">	
										<c:set var="no" value="${no + 1 }"/>
										<span class="like-no">${no}</span>
										<div class="a_subject-div"> 
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
			</div>
			
			<a href="authorMain.do">
				<div class="mid-banner">
					<span>나도 작가되기에 글 등록하고 작가가 되어보세요!</span>
				</div>
			</a>
			<!-- 최신 글 순 리스트 -->
			<div class="textDiv">
				<span class="new-list">새로 업로드 된 신작</span>
			</div>
			
			<div class="dateDiv">
				<div class="dateDesc_content">
					<c:if test="${empty authorAllDate_list }">
						글이 없습니다
					</c:if>
					<c:if test="${not empty authorAllDate_list }">
						<c:forEach var="author" items="${authorAllDate_list }">	
							<a href="authorEach.do?author_no=${author.author_no}">	
								<div class="list-div">
									
									<span id="a_subject">${author.author_subject }</span> 
									<div class="a_sub-div">
										<span class="a_sub" >${author.author_introduce }</span>
									</div>
									<span class="a_sub" >${author.id } | ${author.author_class } | </span>
									<span class="a_sub">관심 ${author.like_count }</span>
								</div> 
							</a>
							<hr>
						</c:forEach>
					</c:if>
				</div>
				
			</div>
			
			<div class="paging-div">
				<!-- 페이징 작업 -->
 				<c:if test="${empty authorAllDate_list }">
					<div id="nonData-btn-wrap">
						<!-- <button id="preBtn">이전</button>
						<button id="pageClick-btn" style="">0</button>
						<button id="nextBtn">다음</button> -->
					</div>
				</c:if> 
				<c:if test="${not empty authorAllDate_list }">
					
					<ul class="pagination-ul">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="pre-btn">
								<a href="writing.do?pageNum=1">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>
							<li class="pre-btn">
								<a href="writing.do?pageNum=${pb.startPage-1 }">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active-btn">
									<a href="writing.do?pageNum=${i }">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="non-active-btn">
									<a href="writing.do?pageNum=${i }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="next-btn">
								<a href="writing.do?pageNum=${pb.endPage }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
							<li class="next-btn">
								<a href="writing.do?pageNum=${pb.endPage+1 }">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
						</c:if>
					</ul>
					
				</c:if>
				</div>
				<!-- 페이징 끝 -->
			
			
		</div>
	</div>
</main>
</body>
</html>