<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="bestSeller"> 
			
			
			</div> 
		
		
			<!-- 커뮤니티 -->
			<div class="community">
			
			
			</div>
		
				
		
		
		</div>
	
</div>
</main>
</body>
</html>