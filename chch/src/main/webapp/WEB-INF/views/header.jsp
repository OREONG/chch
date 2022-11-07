<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
<title>header</title>

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"href="${path }/resources/bootstrap/css/bootstrap.min.css">

<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery1.js"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
<style>
th {
	background: #e7e7e7;
	color: black;
	font-weight: bold;
}
</style>

<!-- <style type="text/css">@import url("header.css");</style> -->
<style type="text/css">
@import url("/chackcheck/css/font.css");
</style>
<style type="text/css">
/* 네비바의 불필요한 부분 제거 */
body {
	margin: 0;
}

a {
	text-decoration: none;
	color: black;
}

/* 네비바 전체 컨테이너 */
.header-container {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	width: 100%;
	height: 82px;
	margin: 0;
	padding: 0;
	background-color: white;
	position: fixed;
	top: 0;
	z-index: 1;
	border-bottom: 1px solid #cbcbcb;
}

/* 네비바 첵책로고, 신작도서~고객센터 텍스트 */
.nav-left-container {
	display: flex;
	flex-direction: row;
	margin-top: -6px;
}

/* 네비바 찜하트, 로그인 버튼 */
.nav-right-container {
	display: flex;
	flex-direction: row;
	margin-top: -6px;
	margin-left: 20px;
}

/* ul 리스트 점 안보이게 */
ul {
	list-style-type: none;
}

/* 첵책 로고 사이즈 지정 */
#logo-image {
	width: 160px;
	height: 80px;
	margin: 0 30px 0 -50px;
}

/* 네비바 아이템들 설정 */
.nav-item {
	padding: 6px 0 0 19px;
	cursor: pointer;
	font-size: 20px;
	font-weight: 800;
	font-family: 'Jalnan';
}

/* 네비바 아이템의 a태그 설정 */
.nav-item a {
	text-align: center;
	text-decoration: none;
	color: #3d3d3d;
}

/* 네비바 아이템의 a태그 커서 가져다 댔을 때 색 변환 */
.nav-item a:hover {
	color: #2bc5c1;
}

/* 네비바 텍스트들 패딩 */
#nav-text, #nav-text1 {
	padding-top: 39px;
	margin-left: 14px;
}

/* 찜 하트 이미지 설정 */
#like-image {
	width: 50px;
	height: 50px;
	margin-top: 7px;
}

/* 로그인 버튼 설정 */
#login-btn {
	text-align: center;
	background: #2bc5c1;
	height: 40px;
	width: 100px;
	font-size: 17px;
	margin-top: 22px;
	color: aliceblue;
	border: none;
	font-family: Jalnan;
	border-radius: 5px;
	cursor: pointer;
}

/* 로그인 버튼 커서 가져다 댔을 때 색 변환 */
#login-btn:hover {
	background: black;
}

/* 반응형 */
/* 텍스트들 글자 작게 */
@media screen and (max-width:1200px) {
	#nav-text, #nav-text1 {
		font-size: 18px;
		margin-top: 2px;
	}
}
/* 텍스트들 글자 작게 */
@media screen and (max-width:1100px) {
	#nav-text, #nav-text1 {
		font-size: 15px;
		margin-top: 2px;
	}
}
/* 텍스트 판매하기, 고객센터 가림 */
@media screen and (max-width:1000px) {
	#nav-text {
		display: none;
	}
}
/* 텍스트 전부 안보이게 */
@media screen and (max-width:820px) {
	#nav-text1 {
		display: none;
	}
}

ul, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

ul.nav-left-container {
	
}

ul.nav-left-container>li {
	display: inline-block;
}

ul.nav-left-container>li ul.bookMenu {
	display: none;
	position: absolute;
}

ul.nav-left-container>li:hover ul.bookMenu {
	display: block;
}

/* 신작도서 하단메뉴 */
ul.bookMenu {
	
}

ul.bookMenu>li {
	display: inline-block;
	margin-top: 33px;
	padding: 5px;
	text-size: 10px;
	font-size: 17px;
	margin-left: 27px;
	font-weight: 700;
}

ul.bookMenu>li ul.submenu {
	display: none;
	position: absolute;
	margin-top: 10px;
}

ul.bookMenu>li:hover ul.submenu {
	display: block;
	text-align: center;
}

ul.bookMenu>li:hover {
	color: #2bc5c1;
}

.submenu li {
	cursor: pointer;
	padding: 3px;
}

/* 알림 */
#like-wrap {
	width: 40%;
	margin: 10px auto;
	position: relative;
}

/* 알림 */
#area-like-count {
 position:absolute;
 top: 36px;
 right:1px;
 min-width: 8px;
 height: 20px;
 line-height: 20px;
 padding: 0 6px;
 font-weight: normal;
 font-size: small;
 color: white;
 text-align: center;
 text-shadow: 0 1px rgba(0, 0, 0, 0.2);
 background: #e23442;
 border: 1px solid #911f28;
 border-radius: 11px;
 background-image: -webkit-linear-gradient(top, #e8616c, #dd202f);
 background-image: -moz-linear-gradient(top, #e8616c, #dd202f);
 background-image: -o-linear-gradient(top, #e8616c, #dd202f);
 background-image: linear-gradient(to bottom, #e8616c, #dd202f);
 -webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
 box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
}

</style>
</head>
<body>
	<header>
		<nav>
			<div class="header-container">
				<ul class="nav-left-container">
					<li class="nav-item"><a href="${path }/main.do"><img
							id="logo-image" alt="이미지가 없습니다"
							src="${path }/resources/images/logo1.png"></a></li>
					<li class="nav-item" id="nav-text1"><a
						href="${path }/newBook/newList.do?book_kind=all&order=recent">신작도서</a>
						<ul class="bookMenu">
							<li class="menu1 sub"><a href="${path }/newBook/newList.do?book_kind=it&order=recent">IT</a></li>
								<ul>
									<li class="menu1 subsub"><a href="${path }/newBook/newList.do?book_kind=IT-프로그래밍언어&order=recent">프로그래밍언어</a></li>
									<li class="menu2 subsub"><a href="${path }/newBook/newList.do?book_kind=IT-컴퓨터공학&order=recent">컴퓨터공학</a></li>
									<li class="menu3 subsub"><a href="${path }/newBook/newList.do?book_kind=IT-해킹/보안&order=recent">해킹/보안</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=IT-그래픽/디자인&order=recent">그래픽/디자인</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=IT-OS/데이터베이스&order=recent">OS/데이터베이스</a></li>
								</ul>
							<li class="menu2 sub"><a href="${path }/newBook/newList.do?book_kind=문학&order=recent">문학</a></li>
								<ul>
									<li class="menu1 subsub"><a href="${path }/newBook/newList.do?book_kind=문학-한국소설&order=recent">한국소설</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=문학-해외소설&order=recent">해외소설</a></li>
									<li class="menu2 subsub"><a href="${path }/newBook/newList.do?book_kind=문학-시&order=recent">시</a></li>
									<li class="menu3 subsub"><a href="${path }/newBook/newList.do?book_kind=문학-에세이&order=recent">에세이</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=문학-고전문학&order=recent">고전문학</a></li>
								</ul>
							<li class="menu3 sub"><a href="${path }/newBook/newList.do?book_kind=역사&order=recent">역사</a></li>
								<ul>
									<li class="menu1 subsub"><a href="${path }/newBook/newList.do?book_kind=역사-한국사/한국문화&order=recent">한국사/한국문화</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=역사-동양사/동양문화&order=recent">동양사/동양문화</a></li>
									<li class="menu2 subsub"><a href="${path }/newBook/newList.do?book_kind=역사-서양사/서양문화&order=recent">서양사/서양문화</a></li>
									<li class="menu3 subsub"><a href="${path }/newBook/newList.do?book_kind=역사-세계사/세계문화&order=recent">세계사/세계문화</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=역사-역사학이론/비평&order=recent">역사학이론/비평</a></li>
								</ul>
							<li class="menu4 sub"><a href="${path }/newBook/newList.do?book_kind=과학&order=recent">과학</a></li>
								<ul>
									<li class="menu1 subsub"><a href="${path }/newBook/newList.do?book_kind=과학-공학&order=recent">공학</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=과학-물리학&order=recent">물리학</a></li>
									<li class="menu2 subsub"><a href="${path }/newBook/newList.do?book_kind=과학-생명과학&order=recent">생명과학</a></li>
									<li class="menu3 subsub"><a href="${path }/newBook/newList.do?book_kind=과학-천문학&order=recent">천문학</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=과학-화학&order=recent">화학</a></li>
								</ul>
							<li class="menu5 sub"><a href="${path }/newBook/newList.do?book_kind=경제&order=recent">경제</a></li>
								<ul>
									<li class="menu1 subsub"><a href="${path }/newBook/newList.do?book_kind=경제-경제&order=recent">경제</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=경제-경영&order=recent">경영</a></li>
									<li class="menu2 subsub"><a href="${path }/newBook/newList.do?book_kind=경제-투자/재테크&order=recent">투자/재테크</a></li>
									<li class="menu3 subsub"><a href="${path }/newBook/newList.do?book_kind=경제-마케팅/세일즈&order=recent">마케팅/세일즈</a></li>
									<li class="menu4 subsub"><a href="${path }/newBook/newList.do?book_kind=경제-CEO/비즈니스&order=recent">CEO/비즈니스</a></li>
								</ul>
						</ul>
					<li class="nav-item" id="nav-text1"><a href="${path }/usedBook/usedList.do">중고도서</a></li>
					<li class="nav-item" id="nav-text"><a href="${path }/usedBook/usedAddForm.do">판매하기</a></li>
					<li class="nav-item" id="nav-text1"><a href="/chackcheck/views/myPage/myPage_main.jo">마이페이지</a></li>
					<li class="nav-item" id="nav-text"><a href="/chackcheck/views/customerService/csFAQ.so">고객센터</a></li>
				</ul>
				<ul class="nav-right-container">
					<c:if test="${empty id }">
					<li class="nav-item"><a href="${path }/member/loginForm.do"><button id="login-btn">로그인</button></a></li>
					<li class="nav-item"><a href="${path }/member/joinForm.do"><button id="login-btn">회원가입</button></a></li>
					
				</c:if>
				<c:if test="${not empty id }">
					
					<li class="nav-item"><a href="${path }/member/logout.do"><button id="login-btn">로그아웃</button></a></li>
				</c:if>
				</ul>
			</div>
		</nav>
	</header>


</body>
</html>