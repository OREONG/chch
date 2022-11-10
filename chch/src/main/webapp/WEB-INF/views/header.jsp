<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
<title>header</title>
<style type="text/css">@import url("/chch/resources/bootstrap/css/header.css");</style>

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"href="${path }/resources/bootstrap/css/bootstrap.min.css">

<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery1.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<header>
	<nav>
		
		<div class="header-container">
			<div class="header-content">
					<div class="header-btn-wrap">
						<ul class="login-join-cart-wrap">
							<c:if test="${empty id }">
								<li class="top-li"><a href="${path }/member/loginForm.do" class="top-t" >로그인</a></li>
								<li class="top-li"><a href="${path }/member/joinForm.do" class="top-t" >회원가입</a></li>
							
							</c:if>
							<c:if test="${not empty id }">
								<li class="top-t li li-id"><a class="top-t" >${id }님 환영합니다</a></li>
								<li class="top-t li"><a href="${path }/member/logout.do" class="top-t" >로그아웃</a></li>
							</c:if>
						</ul>			
					</div>	
				<!-- 로고, 검색, 알림 wrap -->
				<div class="top-container">
						<!-- 로고, 검색 -->
						<ul class="img-search-wrap">
							<!-- 로고 이미지 -->
							<li>
								<a href="${path}/main.do">
									<img id="logoImg" alt="이미지가 없습니다" src="/chackcheckPrac/resources/images/chackcheckCheckLogo2-1.png">
								</a>
							</li>
							<!-- 검색 -->
							<li><input id="searchInput" type="text" placeholder="검색 이걸로 쓰세욤~~"></li>
							<!-- 알림 종 -->
							<li>
								<a href="">
									<img id="bell" src="/chackcheckPrac/resources/images/bell.png">
								</a>
							</li>
							<li>
								<a href="">
									<img id="cart" src="/chackcheckPrac/resources/images/cart.png">
								</a>
							</li>
						</ul>
					
				</div>
			
			
			<hr class="header-hr1 hr">
			
				<div class="bottom-container">
				
					<!-- 신작도서 and bookMenu wrap -->
					<div class="cate">
					
						<div>
						<a class="cate-c newBook" href="${path }/newBook/newList.do?book_kind=all&order=recent">신작도서▼</a>
						<a class="cate-c" href="${path }/usedBook/usedList.do">중고도서</a>
						<a class="cate-c" href="${path }/usedBook/usedAddForm.do">판매하기</a>
						<a class="cate-c" href="/chackcheckPrac/author/writing.do">나도 작가</a>
						<a class="cate-c" href="/chackcheckPrac/myPage/myPage_main.do">마이페이지</a>
						<a class="cate-c" href="/chackcheckPrac/customerService/csFAQ.do">고객센터</a>
						</div>
					</div>
								
				</div>
		
				<hr class="header-hr2 hr">
		
		
  							신작도서 bookMenu
							<div class="bookMenu">
									IT
											<ul class="submenu">
												<li class="li-main-c"><a href="${path }/newBook/newList.do?book_kind=IT&order=recent" class="nav-class1">IT</a></li>
												
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=IT-프로그래밍언어&order=recent" class="a">프로그래밍언어</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=IT-컴퓨터공학&order=recent" class="a">컴퓨터공학</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=IT-해킹/보안&order=recent" class="a">해킹/보안</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=IT-그래픽/디자인&order=recent" class="a">그래픽/디자인</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=IT-OS/데이터베이스&order=recent" class="a">OS/데이터베이스</a></li>
											</ul>
									
									문학
											<ul class="submenu">
												<li class="li-main-c"><a href="${path }/newBook/newList.do?book_kind=문학&order=recent" class="nav-class1">문학</a></li>
												
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=문학-한국소설&order=recent" class="a">한국소설</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=문학-해외소설&order=recent" class="a">해외소설</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=문학-시&order=recent" class="a">시</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=문학-에세이&order=recent" class="a">에세이</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=문학-고전문학&order=recent" class="a">고전문학</a></li>
											</ul>

									
									역사
											<ul class="submenu">
												<li class="li-main-c"><a href="${path }/newBook/newList.do?book_kind=역사&order=recent" class="nav-class1">역사</a></li>
												
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=역사-한국사/한국문화&order=recent" class="a">한국사/한국문화</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=역사-동양사/동양문화&order=recent" class="a">동양사/동양문화</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=역사-서양사/서양문화&order=recent" class="a">서양사/서양문화</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=역사-세계사/세계문화&order=recent" class="a">세계사/세계문화</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=역사-역사학이론/비평&order=recent" class="a">역사학이론/비평</a></li>
											</ul>

									
									과학
											<ul class="submenu">
												<li class="li-main-c"><a href="${path }/newBook/newList.do?book_kind=과학&order=recent" class="nav-class1">과학</a></li>
												
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=과학-공학&order=recent" class="a">공학</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=과학-물리학&order=recent" class="a">물리학</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=과학-생명과학&order=recent" class="a">생명과학</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=과학-천문학&order=recent" class="a">천문학</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=과학-화학&order=recent" class="a">화학</a></li>
											</ul>
									
									경제
											<ul class="submenu">
												<li class="li-main-c"><a href="${path }/newBook/newList.do?book_kind=경제&order=recent" class="nav-class1">경제</a></li>
												
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=경제-경제&order=recent" class="a">경제</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=경제-경영&order=recent" class="a">경영</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=경제-투자/재테크&order=recent" class="a">투자/재테크</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=경제-마케팅/세일즈&order=recent" class="a">마케팅/세일즈</a></li>
												<li class="li-c"><a href="${path }/newBook/newList.do?book_kind=경제-CEO/비즈니스&order=recent" class="a">CEO/비즈니스</a></li>
											</ul>
									
									
							</div>
							신작도서 bookMenu끝			
	
		
			</div>
		</div>
	
	</nav>
</header>
</body>
</html>