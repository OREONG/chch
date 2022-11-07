<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function() {
	// input range rate 조절
	$('input[type="range"]').on('change mousemove', function() {
		var val = ($(this).val() - $(this).attr('min')) / ($(this).attr('max') - $(this).attr('min'));

	    $(this).css('background-image',
	                '-webkit-gradient(linear, left top, right top, '
	                + 'color-stop(' + val + ', #ff5f06), '
	                + 'color-stop(' + val + ', #e4e4e4)'
	                + ')'
       	);
	    // span에 등록한 별점(range value) 넣기
	    $('#input_span').text($(this).val());
	});
	
	// scroll top
	$('.scroll_top').on('click', function(e) {
		e.preventDefault();
		$('html, body').animate({scrollTop: 0}, 200);
	});
	
	// scroll top button show/hide
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.scroll_top').fadeIn(500);
		} else {
			$('.scroll_top').fadeOut('slow');
		}
	});
	
	
	// 리뷰 수정 취소
/* 	$('.hidden_btn a').on('click', function() {
		$(this).parent().hide(); // .hidden_btn
		$(this).parent().siblings().show(); // .show_btn
		$(this).parents('.like_box').siblings('.review').show();
		$(this).parents('.like_box').siblings('input').hide();
	}); */
}); 




// 리뷰 페이징 스크롤 높이
document.addEventListener("DOMContentLoaded" ,function(){  // html load 이후
	if (${pageNum} > 1) {
		window.scrollTo(0, $('.scrollTop').position().top);
	}
);


	
	
	
</script>

<script type="text/javascript">

	function addcart(book_no) {
		var cart_count = $('#cart_count_'+book_no).val() + cc;
		var book_no =  $('#book_no_'+book_no).val();
		location.href="${path}/cartInsert.do?book_no=${book.book_no }&id=${id}&cart_count=" + cc;	
		
	}
	
	
	function purchase() {
		location.href="/chackcheck/views/sales/purchaseStep11.do?book_no=${book.book_no }&count=" + cc;	
	}
	//수정버튼 클릭시 리뷰 수정란 출력, 재클릭시 숨김
	function reviewUpdate(){
		let status = $('#update-box').css('display');
		if(status == 'block') {
			$('#update-box').hide();
		}
		else{
			$('#update-box').show();
		}

	}

// 구매 갯수
var cc = 1;
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('cart_count');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
		  if(number >= ${book.book_count}) {
			  alert("더이상 구매할 수 없습니다");
		  }
		  else 
	   		 number = parseInt(number) + 1;
		  
	  }else(type === 'minus')  
		  if(number <= 1) {
			  alert("1개 이상 입력하세요");
		  }else {
	    number = parseInt(number) - 1;
		  }
	  
	  
	  // 결과 출력
	  resultElement.innerText = number;
	  cc = number;
	}
	
//리뷰 삭제 confirm
function reviewDelete(review_no) {
	var con = confirm("리뷰를 정말 삭제하시겠습니까?");
	if (con) {
		location.href="reviewDelete.do?id=${review.id }&book_no=${review.book_no }&review_no="+review_no;
	}
}
</script>
</head>
<body>


	<!-- 메인 책 이미지, 책 정보  -->
	<div class="detailwrap">
		<div class="detail-title-wrap">
			<span id="title-txt">[${book.book_kind }]&nbsp;${book.book_title }</span><br>
			<span class="title-sub-txt">${book.book_author }</span> <span
				class="title-sub-txt">${book.book_publisher }</span> <span
				class="title-sub-txt">${book.book_publish_date }</span>
			<div id="line"></div>
		</div>
		<div class="detail-sub-wrap">
			<div class="detail">
				<img id="" src="${path }/resources/images/${book.book_image }">
			</div>

			<div class="detailtext">

				<div class="detailtext-wrap">
					<div class="info-txt-div">
						<div class="info-txt">정가</div>
						<fmt:formatNumber value="${book.book_price }" pattern="#,###" />
						원
					</div>
					<div class="info-txt-div">
						<div class="info-txt">판매가</div>${finalprice}원
						(10%, ${disprice}원 할인)
					</div>
					<div class="info-txt-div">
						<div class="info-txt">배송료</div>
						무료
					</div>
					<div class="info-txt-div">
						<div class="info-txt">수령예상일</div>
						지금 택배로 주문하면 내일 수령<br>
						<!-- 서울, 경기면 내일, 그 외 모레 -->
						<div class="info-txt"></div>
						(강남구 테헤란로 06134 기준)
					</div>
					<!-- member에서 주소받아와서 -->
				</div>

				<!-- 구매 수량 -->
				<div class="count-div">
					<div class="info-txt">수량</div>
					<input type='button' class="count-pm" onclick='count("minus")'
						value='-' />
					<div id="cart_count_${book.book_no }">1</div>
						<input 	type="hidden" value="${book.book_no}"  id="book_no_${book.book_no}"> 
						<input type='button' class="count-pm" onclick='count("plus")'
						value='+' />
				</div>

				<!-- 리뷰 별점 -->
				<div class="scroll-moveBox flex flex-br-c">
					<a href="#div1" id="scroll_move"> ★★★★★${star_rate }
						리뷰(${review_cnt })</a>
				</div>

				<ul class="btn-wrap">
					<li><a onclick="addcart(${book.book_no})"><button class="button1" id="button1-2">장바구니</button></a></li>
					<li><a onclick="purchase()"><button class="button1" id="button1-2">구매하기</button></a></li>
				  <c:if test="${like.book_no == null }">
					 <a href="${path }/likeInsert.do?book_no=${book.book_no }">관심 🤍</a><p>
				</c:if>
				
				<c:if test="${like.book_no != null }">
					<a href="${path }/likeDelete.do?book_no=${book.book_no }">관심 💗</a><p>
				</c:if>    
					 <%--  <li><a href="${path}/likeInsert.do?book_no=${book.book_no }"><button class="button1" id="button1-1">💗</button></a></li>   --%>
				</ul> 
			


		like.book_no가 비어있나?  ${like.book_no == null}<p>
		like.book_no가 들어있나?  ${like.book_no != null}<p>
		like.used_no가 비워져있나?  ${like.used_no == null}<p>
		===============<p>
		like.book_no가 비어있나?  ${empty like.book_no}<p>
		like.book_no가 들어있나?  ${not empty like.book_no}<p>
		like.used_no가 비워져있나?  ${empty like.used_no}
		


				<div class="sales-link">
					<!-- <a href="#" id="sales-a">나도 판매하기 ▶️</a> -->
				</div>
			</div>
		</div>
	</div>

	<div id="line2"></div>

	<!-- 디테일 이미지, 책 소개보기 -->
	<div class="detail2">
		<div class="detailimg">
			<img src="" alt="">
		</div>
		<div class="detailmore">
			<details id="box">
				<summary id="more">책 소개 보기..</summary>
				<div id="story">${book.book_content }</div>
			</details>
		</div>
	</div>








	<!-- 리뷰 리스트 : start -->
	<div class="review-wrap">


		<div id="div1">
			<h3 class="sub_title pd_bottom">
				리뷰(<span>${review_cnt }</span>)
			</h3>
		</div>
		<!-- 평균 별점 -->
		<div class="star_avg">
			★★★★★ &nbsp;<span class="text">${review.star_rate }</span>
		</div>
		<div id="line"></div>
		<ul class="review_list_box">
			<c:forEach var="review" items="${list }">
				<li>
					<div class="review-form-div">
						<form action="reviewUpdate.do" method="post">
						<input type="hidden" name="book_no" value="${book.book_no }">	
						<input type="hidden" name="review_no" value="${review.review_no }">	
							
							<div class="reviewbox">
								<div class="star">
									<p>★★★★★${review.star_rate }</p>
								</div>

								<div>
									<p class="detail_txt review">${review.review_content }</p>
									<div class="profile">
										<p class="nick_nm">${review.id }&nbsp;&nbsp;&nbsp;${review.review_reg_date }</p>
									</div>
								</div>
							</div>

							<!-- 수정 인풋 -->
							<div class="like_box">
								<c:if test="${id == review.id }">
									<div class="rievew_btn">
										<div class="show_btn">

											<a id="review-update" onclick="reviewUpdate()"
												class="btn btn_stroke btn_small review_update">수정</a> 
											<a id="review-delete" onclick="reviewDelete(${review.review_no})"
												class="btn btn_stroke btn_small">삭제</a>

										</div>
										<!-- 수정 -->
										<div id="update-box">
											<input type="text" id="update-review-content"
												name="review_content" class="detail_txt review"
												value="${review.review_content }">
											<div class="hidden_btn">
												<input type="submit" id="ok-btn"
													class="btn btn_stroke btn_small" value="완료">
												<!-- <a class="btn btn_stroke btn_small">취소</a> -->
											</div>
										</div>

									</div>
								</c:if>
							</div>

						</form>
					</div>
				</li>
				<div id="line"></div>
			</c:forEach>
		</ul>
		<!-- 리뷰 리스트 : end -->

		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${pageNum > 1}">
						<button class="page_btn"
							onclick="location.href='newDetail.do?book_no=${book.book_no }&pageNum=${currentPage - 1}'">이전
						</button>
					</c:if>
				</div>
				<span class="page_num">${pageNum}</span> <span>/</span> <span
					class="page_num">${totalPage}</span>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="page_btn"
							onclick="location.href='newDetail.do?book_no=${book.book_no }&pageNum=${currentPage + 1}'">다음
						</button>
					</c:if>
				</div>
				<!-- next_btn -->
			</div>
			<!-- number -->
		</div>
		<!-- paging -->

		<!-- 리뷰 등록 -->

		<form action="reviewInsert.do" method="post">		
		<%-- <input type="hidden" name="book_no" value="${book.book_no }"> --%>
			<h3 class="sub_title">리뷰 작성</h3>
			<textarea id="write_review" name="review_content"
				placeholder="책에대한 느낌과 생각을 적어 주세요." required></textarea>
			<p class="detail_txt pd_bottom">별점을 선택해주세요</p>
			<!-- 별점 등록 -->
			<div class="star_avg rate">
				<input type="range" class="rangeInput" name="star_rate" min="0"
					max="10" step="1" value="5" required>
			</div>
			<script type="text/javascript">
			document.querySelector('.rangeInput').addEventListener('input',function(event){
		  	var gradient_value = 100 / event.target.attributes.max.value;
		    event.target.style.background = 'linear-gradient(to right, #FFE283 0%, #FFE283 '
		    		+gradient_value * event.target.value +'%, rgb(236, 236, 236) ' 
		    		+gradient_value *  event.target.value + '%, rgb(236, 236, 236) 100%)';
		   });
		</script>
			<div class="submit_box">
				<input type="submit" class="btn" id="review-input-btn" value="등록하기">
			</div>
		</form>


		<div class="scroll_top">
			<div class="arrow"></div>
		</div>

	</div>

</body>
</html>