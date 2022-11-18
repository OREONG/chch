<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style type="text/css">@import url("/chch/resources/css/myPage.css");</style>

</head>
<body>

<main>
<div class="main-container">
	<div class="content">
	
		<div class="proImg-div">
			<a href="updateForm.do">
			<div class="proImg" id="profileImg">
				<!-- 프로필 사진이 없을 경우 기본 프로필 사진 띄움 -->
				<c:if test="${member.fileName == null }">
					<img id="img" src="/chch/resources/images/memberImg/profileImg.png">
				
				</c:if>
				<!-- 프로필 사진이 있을 경우 db에서 불러옴 -->
				<c:if test="${member.fileName != null }">
					<img id="img" src="/chch/resources/images/memberImg/${member.fileName }">
				</c:if>
			</div>
			<div class="updateLink-div">
				<span class="id-text">${member.id }</span>
				<button class="mp-button">프로필 보기</button>
			</div>
			</a>    
		</div>
	
		<div class="list-div">
		    <div class="flex-container center">
		    	<div class="row-div">
		        	<div class="flex-item "><a class="a" href="cart.do"><i class="bi bi-cart"></i><br>장바구니</a></div>
		        	<div class="flex-item "><a class="a" href="purchase_list.do"><i class="bi bi-receipt"></i><br>구매목록</a></div>
		       		<div class="flex-item "><a class="a" href="sales_list.do"><i class="bi bi-list-check"></i><br>판매목록</a></div>
		        	<div class="flex-item "><a class="a" href="like_list.do"><i class="bi bi-heart-fill"></i><br>찜목록</a></div>
		        </div>
		        <div class="row-div">
		        	<div class="flex-item "><a class="a" href="authorMain.do"><i class="bi bi-brush"></i><br>나도 작가되기</a></div>
		        	<div class="flex-item "><a class="a" href="reportList.do"><i class="bi bi-journals"></i><br>독서록</a></div>

		        	<div class="flex-item "><a class="a" href="chatMemberList.do"><i class="bi bi-chat-dots"></i><br>채팅목록</a></div>
		        	<div class="flex-item "><a class="a" href="inquiryList.do?inquiryNumber=2"><i class="bi bi-megaphone"></i><br>내 문의함</a></div>
		        </div>
		      </div>
		 </div>
		 
		 
	</div>
</div>
</main>
</body>
</html>