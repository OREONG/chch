<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="login.do" method="post">
			<div>
				<select name="id">
					<option value="a">a</option>
					<option value="b">b</option>
					<option value="c">c</option>
				</select>
			</div>
			<div>
				<input type="submit" value="로그인">
			</div>
		</form>
	</div>
</body>
</html>