<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="communityInsert.do">
	
		<div>
			<div>
				카테고리
			</div>
			<div>
				<select name="community_category" required="required" autofocus="autofocus">
					<option value="" hidden="true">어떤 독서 모임을 만들고 싶으세요?</option>
					<option value="독서 토론">독서 토론</option>
					<option value="독후감 공유">독후감 공유</option>
					<option value="시집 낭독">시집 낭독</option>
					<option value="메세지 독토">메세지 독토</option>
					<option value="자유 주제">자유 주제</option>
				</select>	
			</div>
		</div>
		
		<div>
			<div>
				제목
			</div>
			<div>
				<input class="input" type="text" name="community_subject" required="required">
			</div>
		</div>
		
		<div>
			<div>
				활동 내용
			</div>
			<div>
				<input class="input" type="text" name="community_content" required="required">
			</div>
		</div>
		
		<div>
			<div>
				인원 	<input class="input" type="number" name="max_member" required="required" max="10">
			</div>
		</div>
		
		<div>
			<div>
				성별
			</div>
			<div>
				<select name="community_gender" required="required">
					<option value="모두">누구나</option>
					<option value="여성">여성만</option>
					<option value="남성">남성만</option>
				</select>	
			</div>
		</div>
		<div>
			<div>
				나이
			</div>
			<div>
				<input class="input" type="number" name="min_age" required="required" max="999"> ~ 
				<input class="input" type="number" name="max_age" required="required" max="999">
			</div>
		</div>
		
		<div>
			<div>
				장소
			</div>
			<div>
				<input class="input" type="text" name="community_location" required="required" placeholder="모임 장소를 입력해주세요">
			</div>
		</div>
		
		<div>
			<input type="submit" value="확인">
		</div>
		
	</form>
</body>
</html>