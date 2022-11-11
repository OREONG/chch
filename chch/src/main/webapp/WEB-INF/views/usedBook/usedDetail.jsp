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
</head> 
<body>

<div class="main-div">
	<div class="detailwrap">
		<div class="detail">
			<!-- 이미지 -->
			<div class="detail-wrap">
			<img id="detail_img" src="${path }/resources/images/${used.used_image }">
			</div>
			
			<div class="detail-info-wrap">
				<!-- 텍스트 -->
				<div class="detailtext">
					<div class="info-txt-div"><div class="info-txt1">
						<c:if test="${used.used_status=='y' }">[판매완료]</c:if>
						${used.used_subject }</div></div>
					<div class="info-txt-div"><div class="info-txt">책 제목</div>			
					${book.book_title }</div>			
					<div class="info-txt-div"><div class="info-txt">가격</div><fmt:formatNumber value="${used.used_price }" pattern="#,###"/>원</div>
					<div class="info-txt-div"><div class="info-txt">판매자</div>${used.id }<br></div>
				</div>
				<!-- 버튼들 -->
				<div>
					<div class="btn-wrap">
						<c:if test="${used.used_status=='n' && used.id!=id }">
								<a href=""><button class="button1" id="button1-2">채팅하기</button></a>
								<a href=""><button class="button1" id="button1-2">구매확정</button></a>
						</c:if>
						<c:if test="${used.used_status=='n'}">
						수경 주석!!!!!!!!!!!!!!:<!--  likeInsert_used 마이페이지 -> 관심 으로 갑니다 -->
							<a href="likeInsert_used.do?used_no=${used.used_no }"><button class="button1" id="button1-1">❤</button></a>
						</c:if>
					 </div>
					<p>
						<a id="info-a" href="${path }/newBook/newDetail.do?book_no=${used.book_no }">책 정보 보기 ▶️</a>
					</p>
				</div>
				<div class="content">
					${used.used_content }
				</div>
			</div>
		</div>

	</div>


	
</div>

</body>
</html>