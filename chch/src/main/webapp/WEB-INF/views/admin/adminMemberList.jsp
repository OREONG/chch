<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function del(id, del) {
	var ch = confirm("탈퇴 상태를 변경하시겠습니까?");
	if (ch) location.href="adminMemberDelete.so?id="+id+"&del="+del;
	else alert("상태변경이 취소되었습니다.")
}
</script>
</head>
<body>
	<div>
		회원목록
	</div>
	<div>
		<div style="display: flex; justify-content: space-between;" align="center">
			<div>아이디</div>
			<div>이메일</div>
			<div>이름</div>
			<div>생년월일</div>
			<div>성별</div>
			<div>전화번호</div>
			<div>가입일</div>
			<div>탈퇴</div>
			<div>1</div>
			<div>2</div>
			<div>3</div>
		</div>
		<c:if test="${empty memberList }">
			<div>데이터가 없습니다</div>
		</c:if>
		<c:if test="${not empty memberList }">
			<c:forEach var="member" items="${memberList }">
				<div style="display: flex; justify-content: space-between;">
					<div>${member.id } </div>
					<div>${member.email} </div>
					<div>${member.name} </div>
					<div>${member.birth} </div>
					<div>${member.gender } </div>
					<div>${member.phone } </div>
					<div>${member.reg_date } </div>
					<div>${member.del } </div>
					<div>
						<button onclick="del('${member.id}', '${member.del }')">탈퇴</button> 
					</div>
					<div>
						<button onclick="location.href='adminInquiryList.so?member=${member.id}'">문의</button> 
					</div>
					<div>
						<button onclick="location.href=''">구매</button> 
					</div>
				</div>
			</c:forEach>
		</c:if>


	</div>

	<br>

	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button type="button"
				onclick="location.href='/chackcheck/views/admin/adminMemberList.so?pageNum=${startPage - 1}'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i }">
				<button type="button"
					onclick="location.href='/chackcheck/views/admin/adminMemberList.so?pageNum=${i}'"
					class="page_btn_sel">${i }</button>
			</c:if>
			<c:if test="${currentPage != i }">
				<button type="button"
					onclick="location.href='/chackcheck/views/admin/adminMemberList.so?pageNum=${i}'" class="page_btn">${i }</button>
			</c:if>
		</c:forEach>
		<c:if test="${totalPage > endPage }">
			<button type="button"
				onclick="location.href='/chackcheck/views/admin/adminMemberList.so?pageNum=${endPage + 1}'">다음</button>
		</c:if>
	</div>

	<div>
		<button type="button" onclick="location.href='adminMain.do'">관리자
			메뉴</button>
	</div>

</body>
</html>