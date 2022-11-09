<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첵책!나의 독서</title>
<style type="text/css">@import url("/chch/resources/css/report.css");</style>
<!-- <script type="text/javascript" src="/chackcheck/js/jquery.js"></script> -->
<script type="text/javascript">
	function openClose(){
	    let status = $('.report-write-wrap').css('display');
	    if (status =='block') {
	        $('.report-write-wrap').hide();
	        $('#report-btn').text('기록하기');
	    } else {
	        $('.report-write-wrap').show();
	        $('#report-btn').text('기록닫기');
	    }
	}

	//도서 검색
	function acyncMovePage() {
		
		if($('#searchTextInput').val() == ""){
			alert("검색어를 입력해주세요");
			return false;
		}

		var searchText = document.getElementById('searchTextInput').value;
		console.log(searchText);

		var ajaxOption = {
			url : "${path }/search.do?searchText="
					+ searchText,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};

		$.ajax(ajaxOption).done(function(data) {
			$('#searchResult_area').children().remove();
			$('#searchResult_area').html(data);
		});
	};
</script>

</head>
<body>
	<main>
		<div class="report-main-wrap">
			<div class="report-text-wrap">
				<span id="report-main-text">책의 기록, 나의 독서</span> <span
					id="report-sub-text">읽은 책들을 기록해주세요. 기억하고 싶을 때 언제든 찾아볼 수 있게요</span>
				<button id="report-btn" onclick="openClose()">기록하기</button>
			</div>
			<!-- 독서록 글 쓰는 페이지; 숨김가능 -->
			<div class="report-write-wrap">
				<form action="reportConfirm.do" method="post">
					<input type="hidden" name="id" value="${id }">
					<!-- 회색선 전체 div -->
					<div id="report-write-box">
						<span id="book-input">기록하기</span>
						<hr>
						
						<!-- 검색 -->
						<div id="searchArea">
							<div class="inputArea">
								<input class="input" type="text" id="searchTextInput"
									name="searchText" placeholder="책의 제목을 입력하여 검색해주세요" required="required">
								<button id="search-btn" name="test11" type="button"
									onclick="acyncMovePage()">검색</button>
							</div>
							<!-- 검색 결과 -->
							<div id="blank2" ></div>
							<div id="searchResult_area"></div>
						</div>	
						<!-- 독후감 작성 div -->
						<div id="report-report-box">
							<input id="report-title" type="text" name="report_title"
								placeholder="감상문 제목을 입력해주세요" required="required">
							<textarea id="report-content" name="report_content"
								placeholder="감상을 입력해주세요" required="required"></textarea>
							<div id="row-div">
								<span>독서록 공개여부 &nbsp;</span>
								<input type="radio" id="yes" name="expose" value="y" checked>
								<label for="yes">예</label>
								<input type="radio" id="no" name="expose" value="n">
								<label for="no">아니오</label>
							</div>
							<span id="expose-warn">*독서록 공개여부 '예'선택시 도서 판매 목록에 해당 독서록이 노출됩니다</span>
						</div>
						
						
						<input type="submit" id="input-btn" value="등록하기"/>
					</div>
				</form>
			</div>



 			<!-- 독서록 리스트 불러오는 페이지 -->
			<div class="report-list-wrap">
				<div class="card-colums" id="card-box">
					<c:if test="${empty reportList }">
						<span id="nonData-text">데이터가 없습니다</span>
					</c:if>
					<c:if test="${not empty reportList }">

						<c:forEach var="report" items="${reportList }">
							<form action="reportDetail.do?${report.report_no }">
								<input type="hidden" name="report_no" value="${report.report_no }">
									<div class="card">
										<img class="card-img-top"
											src="/chch/resources/images/bookImg/${report.book_image }"
											alt="이미지가 없습니다">
										<div class="card-body">
											<input class="name" type="text" value="${report.report_title }"> 
											<input class="title" type="text" value="${report.book_title }"> 
											<input class="author" type="text" value="${report.book_author }">
											<input class="date" type="text" value="${report.report_date }">
										</div>
										<input type="submit" id="detail_btn" value="">
									</div>
							</form>
						</c:forEach>
					</c:if>
				</div>


				<div class="paging">
				<!-- 페이징 작업 -->
 				<c:if test="${empty reportList }">
					<div id="nonData-btn-wrap">
						<button id="preBtn">이전</button>
						<button id="pageClick-btn" style="">0</button>
						<button id="nextBtn">다음</button>
					</div>
				</c:if> 
				<c:if test="${not empty reportList }">
					
					<ul class="pagination">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li>
								<a id="preBtn" href="reportList.do?pageNum=1">
									<span>이전</span>
								</a>
							</li>
							<li>
								<a id="preBtn" href="reportList.do?pageNum=${pb.startPage-1 }">
									<span>이전</span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active">
									<a href="reportList.do?pageNum=${i }">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li>
									<a href="reportList.do?pageNum=${i }">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li>
								<a id="nextBtn" href="reportList.do?pageNum=${pb.endPage+1 }">
									<span>다음</span>
								</a>
							</li>
							<li>
								<a id="nextBtn" href="reportList.do?pageNum=${pb.endPage }">
									<span>다음</span>
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