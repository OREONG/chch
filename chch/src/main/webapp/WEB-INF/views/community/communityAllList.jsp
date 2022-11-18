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

	<div>
		<c:forEach var="list" items="${communityAllList}">
		<div onclick="location.href='communityDetail.do?community_no=${list.community_no}'" style="cursor: pointer;">
			<div>
				${list.community_category} 
			</div>
			<div>
				${list.community_subject }
			</div>
			<div>
				${list.currentMember } / ${list.max_member }
			</div>
			<hr>
		</div>
		</c:forEach>
	</div>

</body>
</html>