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
		<div class="content">
			<div class="community-top">
					<button onclick="location.href='communityInsertForm.do'" class="communityMenuBtn1">모임 만들기</button>
					<button onclick="location.href='communityAllList.do'" class="communityMenuBtn1">전체 모임 보기</button>
					<button onclick="location.href='communityMyList.do'" class="communityMenuBtn1">가입한 모임 보기</button>
			</div>
		
			<!-- <div id="back_click" onclick="location.href='communityMain.do'"><span id="back">&lt; 돌아가기</span></div> -->
			<div id="form">
				<form action="communityInsert.do">
				
					
					<span id="main-text">모임 만들기</span>
					<hr id="text-line">
						
					
					<!-- 카테고리 -->
					<div class="div1">
						<div>
							<select id="cate-select"name="community_category" required="required" autofocus="autofocus">
								<option value="" hidden="true">어떤 독서 모임을 만들고 싶으세요?</option>
								<option value="독서 토론">독서 토론</option>
								<option value="독후감 공유">독후감 공유</option>
								<option value="시집 낭독">시집 낭독</option>
								<option value="메세지 독토">메세지 독토</option>
								<option value="자유 주제">자유 주제</option>
							</select>	
						</div>
					</div>
						
					<div class="member-gender-age">
						<!-- 인원 -->				
						<div class="div1">
							<div>
								참가인원 <span class="warn-text">*10명 이하 숫자만 입력해 주세요</span><br>
								<input class="input" id="max-member" type="number" name="max_member" required="required" max="10">
							</div>
						</div>
						
		
						<!-- 성별 -->
						<div class="div1 margin-div">
		 					<div>
								성별
							</div>
							<div>
								<select class="select" id="gender" name="community_gender" required="required">
									<option value="모두">누구나</option>
									<option value="여성">여성만</option>
									<option value="남성">남성만</option>
								</select>	
							</div>
						</div>
						
					
					
						<!-- 나이 -->
						<div class="div1 margin-div">
							<div>
								나이 <span class="warn-text">*숫자만 입력해 주세요</span>
							</div>
							<div>
								<input class="input" id="age1" type="number" name="min_age" required="required" max="999"> ~ 
								<input class="input" id="age2" type="number" name="max_age" required="required" max="999">
							</div>
						</div>	
					</div>
									
					<!-- 장소 -->
					<div class="div1">
						<div>
							장소
						</div>
						<div>
							<input class="input" id="place" type="text" name="community_location" required="required">
						</div>
					</div>
													
					<!-- 제목 -->
					<div class="div1">
						<div>
							모임 이름
						</div>
						<div>
							<input class="input" id="commu-subject" type="text" name="community_subject" required="required">
						</div>
					</div>
				
					<!-- 활동 내용 -->
					<div class="div1">
						<div>
							활동 내용
						</div>
						<div>
							<textarea class="input" rows="10" id="commu-content" name="community_content" required="required" style="resize:none;"></textarea> 
						</div>
					</div>
	
	
					
					<div class="commnu-createBtn-div">
						<input type="submit" value="모임 만들기" id="commnu-createBtn">
					</div>
					
				</form>
			</div>
		</div>
	</div>
</main>
</body>
</html>