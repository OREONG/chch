<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="adminBookUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="currentFile" value="${book.book_image }">
		<input type="hidden" name="currentKind" value="${book.book_kind }">
		<input type="hidden" name="currentFile2" value="${book.book_imagedetail }">
		<div>
			<div id="report-Img-box">
				<input type="file" name="file" id="file" style="display: none;"
					class="real-upload" accept="image/*">
				<div class="report-sub-box" id="report-Infoimage-box"
					style="cursor: pointer;">
					<img id="report-imgInput" src="/chch/resources/fileSave/${book.book_image }">
				</div>
			</div>
			<script type="text/javascript" src="/chch/resources/bootstrap/js/report.js"></script>
		</div>
		<div>
			<div>
				<select name="kind"
					required="required">
					<option value="${book.book_kind }" hidden="true">${book.book_kind }</option>
					<option value="IT">IT
					<option value="과학">과학
					<option value="자기계발">자기계발
					<option value="문학">문학
					<option value="건강">건강
				</select>
			</div>
			<div>
				<input class="input" type="text" id="numberInput" name="book_no"
					required="required" value="${book.book_no }" readonly>
			</div>
			<div>
				<input class="input" type="text" id="titleInput" name="book_title"
					required="required" value="${book.book_title }" autofocus="autofocus">
			</div>
			<div>
				<input class="input" type="text" id="authorInput" name="book_author"
					required="required" value="${book.book_author }">
			</div>
			<div>
				<input class="input" type="text" id="publisherInput"
					name="book_publisher" required="required" value="${book.book_publisher}">
			</div>
			<div>
				<input class="input" type="number" id="priceInput" name="book_price"
					required="required" value="${book.book_price}">
			</div>
			<div>
				<input class="input" type="number" id="countInput" name="book_count"
					required="required" value="${book.book_count}">
			</div>
			<div>
				<input class="input" type="date" id="publishDateInput"
					name="book_publish_date" required="required" value="${book.book_publish_date}">
			</div>
			<div>
				<input class="input" type="date" id="registerDateInput"
					name="book_reg_date" required="required" value="${book.book_reg_date}" readonly>
			</div>

			<div>
				<input type="file" name="file2" id="file2" class="real-upload2"
					accept="image/*">
			</div>

			<div>
				<textarea rows="100"
					style="height: 100px; width: 45%; resize: none;" name="book_content"
					maxlength="100">${book.book_content}</textarea>
			</div>

		</div>
		<div>
			<input type="submit" value="확인">
		</div>
	</form>

</body>
</html>