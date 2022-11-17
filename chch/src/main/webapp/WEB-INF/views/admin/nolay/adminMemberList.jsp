<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function del(id, del) {
		var ch = confirm("탈퇴 상태를 변경하시겠습니까?");
		if (ch) {
			
			$(function() {
				$.ajax({
					url : "adminMemberDelete.do?id="+id+"&del="+del,
					async : true,
					type : "POST",
					dataType : "html",
					cache : false
				});
				showPage('adminMemberList.do?pageNum=${currentPage}');
			});
			
			
		} else {
			alert("상태변경이 취소되었습니다.")
			return false;
		}
	}
	
	function showPage(data) {
		var addr = data;
		
		console.log(addr);
	
		var ajaxOption = {
			url : addr,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};
	
		$.ajax(ajaxOption).done(function(data) {
			$('#showPage').children().remove();
			$('#showPage').html(data);
		});
	};
</script>
</head>
<body>
	<div id="subject-text" class="subject-container">
		회원목록
	</div>
	<div>
		<div class="title-table-row">
			<span class="title-cell table-col1 center">아이디</span>
			<span class="title-cell table-col2 center">이메일</span>
			<span class="title-cell table-col3 center">이름</span>
			<span class="title-cell table-col4 center">생년월일</span>
			<span class="title-cell table-col5 center">성별</span>
			<span class="title-cell table-col6 center">탈퇴</span>
			<span class="title-cell table-col7 center"></span>
			<span class="title-cell table-col8 center"></span>
			<span class="title-cell table-col9 center"></span>
		</div>
		<c:if test="${empty memberList }">
			<div>데이터가 없습니다</div>
		</c:if>
		<c:if test="${not empty memberList }">
			<c:forEach var="member" items="${memberList }">
			<c:set var="stringBirth" value="${member.birth }"></c:set>
			<fmt:parseDate var="longbirth" value="${fn:substring(stringBirth,0,10)}" pattern="yyyy-MM-dd" />
			<fmt:formatDate var="birth" value="${longbirth}" pattern="yyyy-MM-dd"/>
				<div class="table-row">
					<span class="cell table-col1">${member.id } </span>
					<span class="cell table-col2">${member.email} </span>
					<span class="cell table-col3 center">${member.name} </span>
					<span class="cell table-col4 center">${birth } </span>
					<span class="cell table-col5 center">${member.gender } </span>
					<span class="cell table-col6 center">${member.del } </span>
					<span class="cell table-col7 center">
						<button class="action-btn" onclick="del('${member.id}', '${member.del }')">탈퇴</button> 
					</span>
					<span class="cell table-col8 center">
						<button class="action-btn" onclick="location.href='adminInquiryList.so?member=${member.id}'">문의</button> 
					</span>
					<span class="cell table-col9 center">
						<button class="action-btn" onclick="location.href=''">구매</button>
					</span>
				</div>
			</c:forEach>
		</c:if>


	</div>

	<br>

	<div class="paging-div">
		<c:if test="${empty memberList }">
		</c:if> 
		<c:if test="${not empty memberList }">
			
			<ul class="pagination-ul">
				<c:if test="${startPage > PAGE_PER_BLOCK }">
					<li class="pre-btn">
						<a onclick="showPage('adminMemberList.do?pageNum=1')">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
					</li>
					<li class="pre-btn">
						<a onclick="showPage('adminMemberList.do?pageNum=${startPage - 1}')">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
					</li>							
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage == i }">
						<li class="active-btn">
							<a onclick="showPage('adminMemberList.do?pageNum=${i}')">${i }</a>
						</li>
					</c:if>
					<c:if test="${currentPage != i }">
						<li class="non-active-btn">
							<a onclick="showPage('adminMemberList.do?pageNum=${i}')">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<li class="next-btn">
						<a onclick="showPage('adminMemberList.do?pageNum=${endPage}')">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</li>
					<li class="next-btn">
						<a onclick="showPage('adminMemberList.do?pageNum=${endPage + 1}')">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</li>
				</c:if>
			</ul>
			
		</c:if>
	</div>

	
</body>
</html>