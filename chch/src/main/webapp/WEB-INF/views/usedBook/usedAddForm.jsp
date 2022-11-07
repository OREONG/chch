<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/chackcheck/js/jquery.js"></script>
<script type="text/javascript">
	function acyncMovePage() {

		var searchText = document.getElementById('searchTextInput').value;
		console.log(searchText);

		var ajaxOption = {
			url : "usedSearch.do?searchText="
			+ searchText,
			async : true,
			type : "POST",
			dataType : "html",
			cache : false
		};

		$.ajax(ajaxOption).done(function(data) {
			$('#searchResult_area').children().remove();
			$('#searchResult_area').html(data);
		});
	};
</script>
</head>

<body>
<%-- 	<%@ include file="/sessionChk.jsp"%> --%>

	<div class="used-write-wrap">
		<form action="usedAdd.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="book_no" value="${book.book_no }">
			<div id="used-write-box">
				<span id="book-input">판매글 등록</span>
				<hr>

				<div id="used-Img-used-wrap">
					<div id="used-Img-box">
						<input type="file" name="file" id="file" style="display: none;"
							class="real-upload" accept="image/*" required>
						<div class="used-sub-box" id="used-Infoimage-box"
							style="cursor: pointer;">
							<img id="used-imgInput" src="">
						</div>
					</div>
					<script type="text/javascript" src="/chackcheck/js/used.js"></script>
					<div id="used-Infotext-box">
						<div id="blank1"></div>
						<input class="input" type="text" id="used_subject_input"
							name="used_subject" required="required" placeholder="판매글 제목"
							autofocus="autofocus">
						<input class="input" type="number"
							id="used_price_input" name="used_price" required="required"
							placeholder="판매 가격(숫자만 입력해 주세요)">
					</div>
				</div>


				<div id="bottomArea">
					<div id="searchArea">
						<div class="inputArea">
							<input class="input" type="text" id="searchTextInput"
								name="searchText" placeholder="책의 제목을 입력하여 검색해주세요">
							<button id="search-btn" name="test11" type="button"
								onclick="acyncMovePage()">검색</button>
						</div>
						<div id="blank2" ></div>
						<div id="searchResult_area"></div>
					</div>

					<div class="inputTextArea">
						<br>
						<textarea rows="10" class="inputText" name="used_content"
							maxlength="10" placeholder="내용을 입력하세요" required="required"></textarea>
					</div>

				</div>
				<div id="submitArea">
					<input type="submit" value="확인" id="input-btn">
				</div>
			</div>
		</form>
	</div>
</body>
</html>