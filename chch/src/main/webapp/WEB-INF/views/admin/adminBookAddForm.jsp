<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="adminBookAdd.do" method="post" enctype="multipart/form-data">
	<div>
		<div id="report-Img-box">
			<input type="file" name="file" id="file" style="display: none;" class="real-upload"
				accept="image/*" required>
			<div class="report-sub-box" id="report-Infoimage-box" style="cursor: pointer;" >
				<img id="report-imgInput" src="/chch/resources/images/camera.png">
			</div>
		</div>
		<script type="text/javascript" src="/chch/resources/bootstrap/js/report.js"></script>
	</div>
	
	
	<div>
		<div>
				<select class="report-sub-box2" id="report-class-box"
					name="book_kind" required="required">
					<option value="" hidden="true">분류</option>
					<option value="IT">IT</option>
					<option value="과학">과학</option>
					<option value="자기계발">자기계발</option>
					<option value="문학">문학</option>
					<option value="건강">건강</option>
				</select>
		</div>
		<div class="inputArea">
			<input class="input" type="text" id="titleInput" name="book_title"
				required="required" placeholder="책 제목" autofocus="autofocus">
		</div>
		<div class="inputArea">
			<input class="input" type="text" id="authorInput" name="book_author"
								required="required" placeholder="지은이">
		</div>
		<div class="inputArea">
			<input class="input" type="text" id="publisherInput" name="book_publisher"
								required="required" placeholder="출판사">
		</div>
		<div class="inputArea">
			<input class="input" type="number" id="priceInput" name="book_price"
								required="required" placeholder="가격">
		</div>
		<div class="inputArea">
			<input class="input" type="number" id="countInput" name="book_count"
								required="required" placeholder="재고">
		</div>
		<div class="inputArea">
			<input class="input" type="date" id="publishDateInput" name="book_publish_date"
								required="required" placeholder="재고">
		</div>
		<div id="report-Img-box2">
			<input type="file" name="file2" id="file2"  class="real-upload2"	accept="image/*" required>
		</div>
		<div class="inputArea">
			<textarea rows="100" style="height: 100px; width: 45%; resize: none;" name="book_content" maxlength="100" placeholder="책 설명"></textarea>
		</div>
	
	</div>
	<div>
		<input type="submit" value="확인">
	</div>
</form>


</body>
</html>