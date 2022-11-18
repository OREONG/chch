<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/chch/resources/css/member.css");</style>
<script type="text/javascript">
	function backBtn() {
		location.href="updateForm.do";
	}
</script>
</head>
<body>
<main>
	<div class="main-container">
		<div>
			<div class="delete-text-wrap">
				<span id="delete-main-text">꼭 확인해주세요!<p></span>
				
				<span id="delete-sub-text">•보유하고 있던 <span class="sub-text">포인트, 배송정보, 구매 이력 등은 모두 소멸되고 복구가 불가능</span> 합니다.<br>
				•탈퇴 후 책첵에 입력하신 중고 상품 게시글, 댓글, 나도 작가되기 게시글은 삭제되지 않습니다. 해당 <span class="sub-text">게시물의 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 진행</span>해 주시기 바랍니다.<br>
				•탈퇴 후 <span class="sub-text">가입하신 아이디, 이메일로 재가입 할 수 없습니다</span>.
				</span>
			</div>
			<div>
				<form action="delete.do">
						<!-- 비밀번호 -->
				        <div class="join-wrap" >
				           	<div>
				            	<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요" class="input2">
				            </div>
				        </div>
				    <!-- 회원 탈퇴 submit -->
					<input type="submit" class="deleteBtn" value="회원 탈퇴">			
				</form>
				
				<div class="backBtn-div">
					<button class="backBtn" onclick="backBtn()">돌아가기</button>
				</div>
				
			</div>
		

		</div>
	</div>
</main>
</body>
</html>