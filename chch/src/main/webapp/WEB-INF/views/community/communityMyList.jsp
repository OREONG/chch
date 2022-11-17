<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/community.css");</style>

</head>
<body>
<main>
	<div class="main-container">
		<div class="sub-container">
			<div id="back_click" onclick="location.href='communityMain.do'"><span id="back">&lt; 돌아가기</span></div>
			
			<div class="main-text-div">
			<span id="main-text">내 모임 리스트</span>
			</div>
			
			<div>
				<c:forEach var="list" items="${communityMyList}">
				<div onclick="location.href='communityDetail.do?community_no=${list.community_no}'" style="cursor: pointer;">
					<div id="cate-div">
						<span id="cate-text">
							${list.community_category} 
						</span>
					</div>
					<div id="subject-div">
						<span id="subject-text">
							${list.community_subject }
						</span>
					</div>
					<div id="member-div">
						<span id="member-text">
							${list.currentMember } / ${list.max_member }
						</span>
					</div>
					<hr>
				</div>
				</c:forEach>
			</div>
			
			
			
			
		</div>
	</div>
</main>
</body>
</html>