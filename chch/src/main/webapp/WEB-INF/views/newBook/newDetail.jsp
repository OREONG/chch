<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/newDetail.css");</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">

$(function() {
// 	input range rate 조절
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




리뷰 페이징 스크롤 높이
document.addEventListener("DOMContentLoaded", function() { // html load 이후
	if (${num} > 1) {			
		window.scrollTo(0, $('.scrollTop').position().top);
	}
});

	
	function addcart() {
		location.href="cartInsert.do?book_no=${book.book_no }&id=${id}&cart_count=" + cc;	
	}
	
	function purchase() {
		location.href="purchaseStep11.do?book_no=${book.book_no }&count=" + cc;	
	}
	
	
</script>

<script type="text/javascript">

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
		  }else{ 
	    number = parseInt(number) + 1;
		  }
	  }else if(type === 'minus')  {
		  if(number <= 1) {
			  alert("1개 이상 입력하세요");
		  }else {
	    number = parseInt(number) - 1;
		  }
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
<script type="text/javascript">
$(document).ready(function(){
	 
    $('.reportbox').each(function(){
        //var content = $(this).children('.content');
        var content = $(this).find('.detail_txt');

        var content_txt = content.text();
        var content_html = content.html();
        var content_txt_short = content_txt.substring(0,100)+"...";
        var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

        
        $(this).append(btn_more);
        
        if(content_txt.length >= 100){
            content.html(content_txt_short)
            
        }else{
            btn_more.hide()
        }
        
        btn_more.click(toggle_content);
        function toggle_content(){
            if($(this).hasClass('short')){
                // 접기 상태
                $(this).html('더보기');
                content.html(content_txt_short)
                $(this).removeClass('short');
            }else{
                // 더보기 상태
                $(this).html('접기');
                content.html(content_html);
                $(this).addClass('short');

            }
        }
    });
});
</script>

<style type="text/css">
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
</style>

<link rel="shortcut icon" href="#">

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
				<img id="" src="/chch/resources/images/${book.book_image}">
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
					<div id="cart_count">1</div>
					<input type='button' class="count-pm" onclick='count("plus")'
						value='+' />
				</div>

				<!-- 리뷰 별점 -->
				<div class="scroll-moveBox flex flex-br-c">
					<a href="#div1" id="scroll_move">
						<c:if test="${star_avg <= 0.4}">☆☆☆☆☆</c:if>
						<c:if test="${star_avg >= 0.5 && star_avg < 1.4}">★☆☆☆☆</c:if>
						<c:if test="${star_avg >= 1.5 && star_avg < 2.4}">★★☆☆☆</c:if>
						<c:if test="${star_avg >= 2.5 && star_avg < 3.4}">★★★☆☆</c:if>
						<c:if test="${star_avg >= 3.5 && star_avg < 4.4}">★★★★☆</c:if>
						<c:if test="${star_avg >= 4.5}">★★★★★</c:if>
						${star_avg}
						리뷰(${review_cnt })
					</a>
				</div>


				<ul class="btn-wrap">
					<li><a onclick="addcart()"><button class="button1"
								id="button1-2">장바구니</button></a></li>
					<li><a onclick="purchase()"><button class="button1"
								id="button1-2">구매하기</button></a></li>
					<li><a href=""><button class="button1" id="button1-1">❤</button></a></li>
				</ul>


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

		<!-- 리뷰 갯수 -->
		<div id="div1">
			<h3 class="sub_title pd_bottom">
				리뷰(<span>${review_cnt }</span>)
			</h3>
		</div>
		<!-- 평균 별점 -->
		<div class="star_avg">
			<c:if test="${star_avg <= 0.4}">☆☆☆☆☆</c:if>
			<c:if test="${star_avg >= 0.5 && star_avg < 1.4}">★☆☆☆☆</c:if>
			<c:if test="${star_avg >= 1.5 && star_avg < 2.4}">★★☆☆☆</c:if>
			<c:if test="${star_avg >= 2.5 && star_avg < 3.4}">★★★☆☆</c:if>
			<c:if test="${star_avg >= 3.5 && star_avg < 4.4}">★★★★☆</c:if>
			<c:if test="${star_avg >= 4.5}">★★★★★</c:if>
			<span class="text">${star_avg }</span>
		</div>
		<div id="line"></div>
		<ul class="review_list_box">
			<c:forEach var="review" items="${reviewList }">
				<li>
					<div class="review-form-div">
						<form action="reviewUpdate.do" method="post">
							<input type="hidden" name="book_no" value="${book.book_no }">
							<input type="hidden" name="review_no"
								value="${review.review_no }">

							<div class="reviewbox">
								<div class="star">
									<p> <c:if test="${review.star_rate == 0}">☆☆☆☆☆</c:if>
										<c:if test="${review.star_rate == 1}">★☆☆☆☆</c:if>
										<c:if test="${review.star_rate == 2}">★★☆☆☆</c:if>
										<c:if test="${review.star_rate == 3}">★★★☆☆</c:if>
										<c:if test="${review.star_rate == 4}">★★★★☆</c:if>
										<c:if test="${review.star_rate == 5}">★★★★★</c:if>
										${review.star_rate}
									</p>
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
												class="btn btn_stroke btn_small review_update">수정</a> <a
												id="review-delete"
												onclick="reviewDelete(${review.review_no})"
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

		<!-- 페이징 시작 -->
		<div class="paging-div">
 				<c:if test="${empty reviewList }">
				</c:if> 
				<c:if test="${not empty reviewList }">
					
					<ul class="pagination-ul">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="pre-btn">
								<a href="newDetail.do?pageNum=1&book_no=${book.book_no}">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>
							<li class="pre-btn">
								<a href="newDetail.do?pageNum=${pb.startPage-1 }&book_no=${book.book_no}">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active-btn">
									<a href="newDetail.do?pageNum=${i }&book_no=${book.book_no}">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="non-active-btn">
									<a href="newDetail.do?pageNum=${i }&book_no=${book.book_no}">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="next-btn">
								<a href="newDetail.do?pageNum=${pb.endPage+1 }&book_no=${book.book_no}">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
							<li class="next-btn">
								<a href="newDetail.do?pageNum=${pb.totalPage }&book_no=${book.book_no}">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
						</c:if>
					</ul>
					
				</c:if>
		</div>
		<!-- 페이징 끝 -->

		<!-- 리뷰 등록 -->

		<form action="reviewInsert.do" method="post" class="mb-3"
			name="myform" id="myform">
			<input type="hidden" name="book_no" value="${book.book_no }">
			<h3 class="sub_title">리뷰 작성</h3>
			<textarea id="write_review" name="review_content"
				placeholder="책에대한 느낌과 생각을 적어 주세요." required></textarea>
			<p class="detail_txt pd_bottom">별점을 선택해주세요</p>
			<!-- 별점 등록 -->
			<div class="star_avg rate">
				
			      <fieldset>
			         <input type="radio" name="star_rate" value="5" id="rate1"><label
			            for="rate1">★</label>
			         <input type="radio" name="star_rate" value="4" id="rate2"><label
			            for="rate2">★</label>
			         <input type="radio" name="star_rate" value="3" id="rate3"><label
			            for="rate3">★</label>
			         <input type="radio" name="star_rate" value="2" id="rate4"><label
			            for="rate4">★</label>
			         <input type="radio" name="star_rate" value="1" id="rate5"><label
			            for="rate5">★</label>
			      </fieldset>

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
		<!-- 리뷰 끝 -->

		<!-- 감상문 리스트  -->
		<div class="report-wrap">
			<div id="div1">
				<h3 class="sub_title pd_bottom">감상문</h3>
			</div>
			<div id="line"></div>
			<ul class="report_list_box">
				<c:if test="${empty reportList }">
		등록된 감삼문이 없습니다
				</c:if>
				<c:if test="${not empty reportList }">
					<c:forEach var="report" items="${reportList }">
						<li>
							<div class="reportbox">
								<p class="title report">${report.report_title }</p>
								<p class="detail_txt report">${report.report_content }</p>
								<div class="profile">
									<p class="nick_nm">${report.id }&nbsp;&nbsp;&nbsp;${report.report_date }</p>
								</div>
							</div>
						</li>
						<div id="line"></div>
					</c:forEach>
				</c:if>
			</ul>
			<div class="scroll_top">
				<div class="arrow"></div>
			</div>

		<!-- 페이징 시작 -->
		<div class="paging-div">
 				<c:if test="${empty reportList }">
				</c:if> 
				<c:if test="${not empty reportList }">
					
					<ul class="pagination-ul">
						<c:if test="${pb1.startPage1 > pb1.pagePerBlock1 }">
							<li class="pre-btn">
								<a href="newDetail.do?pageNum1=1&book_no=${book.book_no}">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>
							<li class="pre-btn">
								<a href="newDetail.do?pageNum1=${pb1.startPage1-1 }&book_no=${book.book_no}">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
							</li>							
						</c:if>
						<c:forEach var="i" begin="${pb1.startPage1 }" end="${pb1.endPage1 }">
							<c:if test="${pb1.currentPage1 == i }">
								<li class="active-btn">
									<a href="newDetail.do?pageNum1=${i }&book_no=${book.book_no}">${i }</a>
								</li>
							</c:if>
							<c:if test="${pb1.currentPage1 != i }">
								<li class="non-active-btn">
									<a href="newDetail.do?pageNum1=${i }&book_no=${book.book_no}">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pb1.endPage1 < pb1.totalPage1 }">
							<li class="next-btn">
								<a href="newDetail.do?pageNum1=${pb1.endPage1+1 }&book_no=${book.book_no}">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
							<li class="next-btn">
								<a href="newDetail.do?pageNum1=${pb1.totalPage1 }&book_no=${book.book_no}">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</li>
						</c:if>
					</ul>
					
				</c:if>
		</div>
		</div>
		<!-- 페이징 끝 -->

</body>
</html>