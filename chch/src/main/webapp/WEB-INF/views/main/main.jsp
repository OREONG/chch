<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	/* Slideshow container */
	.slideshow-container {
	 width:100%;
	  max-width: 1920px;
	  position: relative;
	  margin: auto;
	  margin-top: -51px;
	}
	
	/* effect */
	 .fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 4s;
	  animation-name: fade;
	  animation-duration: 4s;
	}
	
	@-webkit-keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	}
	
	@keyframes fade {
	  from {opacity: .4} 
	  to {opacity: 1}
	} 
	
	/* Next & previous buttons */
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;	
	  width: auto;
	  padding: 16px;
	  margin-top: -22px;
	  color: white;
	  font-weight: bold;
	  font-size: 18px;
	  transition: 0.6s ease;
	  border-radius: 0 3px 3px 0;
	}
	
	/* Position the "next button" to the right */
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover, .next:hover {
	  background-color: rgba(0,0,0,0.8);
	}
	
	
/* 	베스트셀러 시작 */
.bestSeller {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 30px;
	font-size: 24px;
	font-style: bold;
	color: #545454;
	font-family: 'Jalnan';
}

.book_list {
    height: 360px;
    margin: 0 115px 0 0;
}

.title {
	width: 150px;
    margin: auto;
    margin-top: 5px;
}

#product_order_list {
	text-align: center;
	margin-bottom: 50px;
}

#product_order_list a {
	color: black;	
}

#line {
	margin: 10px 15% 50px;
	padding: 0;
	border-top: 2px solid #6c71ce;
}

#line2 {
	margin: 10px 15% 18px;
	padding: 0;
	border-top: 2px solid #e7e7e7;
}

.products {
	display: table;
    margin: 0 auto 0 25%;
	padding: 0;
    width: 70%;
	text-align: center;
	font-family: 'AppleSDGothicNeo';
}

.img-div{
	width: 155px;
    height: 210px;
}
.products img {
	width: 100%;

}

.products a {
	text-decoration: none;
	color: black;
	float: left;
	font-size: 16px;
}

.products p {
	margin-top: 4px;
	margin-bottom: 10px;
	font-family: 'AppleSDGothicNeo';
}

.star_avg {
	color: red;
}


.paging-div{
	margin-top: 28px;
}
/* 	베스트셀러 끝 */
</style>
</head>
<body>
<main>
<div>
	<div class="main-container">
			<!-- 배너 슬라이드 쇼 -->
			<div class="slideshow-container">
			
			     <div class="mySlideDiv fade active" id="banner1">
				     <img id="banner-img" src="/chch/resources/images/bannerImg/banner1.png">
			     </div>
			            
			     <div class="mySlideDiv fade" id="banner2">
					 <img id="banner-img" src="/chch/resources/images/bannerImg/banner2.png">
			     </div>
			            
			     <div class="mySlideDiv fade" id="banner3">
				     <img id="banner-img" src="/chch/resources/images/bannerImg/banner4.png">
			     </div>
			     
				 <div class="mySlideDiv fade" id="banner4">
				     <img id="banner-img" src="/chch/resources/images/bannerImg/banner3.png">
			     </div>
			     
			     <a class="prev" onclick="prevSlide()">&#10094;</a>
			     <a class="next" onclick="nextSlide()">&#10095;</a>
			</div>
			<script type="text/javascript">
				$(document).ready(function () {
					$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
					
					setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
				});
				
				//이전 슬라이드
				function prevSlide() {
					$(".mySlideDiv").hide(); //모든 div 숨김
					var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
					var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
					
					//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
					$(".mySlideDiv").each(function(index,item){ 
						if($(this).hasClass("active")) {
							currentIndex = index;
						}
				        
					});
					
					//새롭게 나타낼 div의 index
					var newIndex = 0;
				    
					if(currentIndex <= 0) {
						//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
						newIndex = allSlide.length-1;
					} else {
						//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
						newIndex = currentIndex-1;
					}
				
					//모든 div에서 active 클래스 제거
					$(".mySlideDiv").removeClass("active");
				    
					//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
					$(".mySlideDiv").eq(newIndex).addClass("active");
					$(".mySlideDiv").eq(newIndex).show();
				
				}
				
				//다음 슬라이드
				function nextSlide() {
					$(".mySlideDiv").hide();
					var allSlide = $(".mySlideDiv");
					var currentIndex = 0;
					
					$(".mySlideDiv").each(function(index,item){
			
						if($(this).hasClass("active")) {
						
							currentIndex = index;
						}
				        
					});
					
					var newIndex = 0;
					
					if(currentIndex >= allSlide.length-1) {
						//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
						newIndex = 0;
					} else {
						//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
						newIndex = currentIndex+1;
					}
				
					$(".mySlideDiv").removeClass("active");
					$(".mySlideDiv").eq(newIndex).addClass("active");
					$(".mySlideDiv").eq(newIndex).show();
					
					
				}
			
			</script>
		
			<!-- 베스트 셀러 -->
				<div align="center" class="bestSeller">
					<h2>따끈따끈 신작</h2>
				</div>
				<div id="line"></div>
					<div class="products">
						<c:if test="${empty bookList}">
						등록된 책이 없습니다
						</c:if>
						<c:if test="${not empty bookList}">
							<c:forEach var="book" items="${bookList }">
								<a href="newDetail.do?book_no=${book.book_no }">
									<div class="book_list">
										<div class="img-div">
											<img src="/chch/resources/images/${book.book_image}">
										</div>
										<div class="title">${book.book_title }</div>
										<div>
											<fmt:formatNumber value="${book.book_price }" pattern="#,###" />
											원
										</div>

										<div class="star_avg">
											<c:if test="${book.star_avg <= 0.4}">☆☆☆☆☆</c:if>
											<c:if test="${book.star_avg >= 0.5 && book.star_avg < 1.4}">★☆☆☆☆</c:if>
											<c:if test="${book.star_avg >= 1.5 && book.star_avg < 2.4}">★★☆☆☆</c:if>
											<c:if test="${book.star_avg >= 2.5 && book.star_avg < 3.4}">★★★☆☆</c:if>
											<c:if test="${book.star_avg >= 3.5 && book.star_avg < 4.4}">★★★★☆</c:if>
											<c:if test="${book.star_avg >= 4.5}">★★★★★</c:if>
											&nbsp;(${book.review_cnt })
										</div>

									</div>
								</a>
							</c:forEach>
						</c:if>
					</div>
					<div id="line2"></div>
			
		
			<!-- 커뮤니티 -->
			<div class="community">
			
			
			</div>
		
				
		
		
		</div>
	
</div>
</main>
</body>
</html>