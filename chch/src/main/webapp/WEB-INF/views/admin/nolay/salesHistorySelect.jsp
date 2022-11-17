<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Insert title here</title>

<style type="text/css">
	.table-li { padding: 10px; }
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script type="text/javascript">
	
	function movePage(page) {
		
		if ($('#book_no').val() == null || $('#book_no').val()=="" || $('#dateFrom').val() == null || $('#dateFrom').val() =="" || $('#dateTo').val() == null || $('#dateTo').val() =="" ) {
			alert("값을 입력하고 조회하세요");
			return false;
		}
		
		var url = "salesHistorySelect.do?book_no="
				+ $('#book_no option:selected').val()
				+"&dateFrom="
				+ $('#dateFrom').val()
				+"&dateTo="
				+ $('#dateTo').val()
				+"&pageNum="+page;
		$('#searchView').load(url);
	}
	
	function s2ab(s) { 
	    var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
	    var view = new Uint8Array(buf);  //create uint8array as viewer
	    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
	    return buf;    
	}
	
	function exportExcel() {
		// step 1. workbook 생성
	    var wb = XLSX.utils.book_new();

	    // step 2. 시트 만들기 
	    var newWorksheet = excelHandler.getWorksheet();
	    
	    // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
	    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

	    // step 4. 엑셀 파일 만들기 
	    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

	    // step 5. 엑셀 파일 내보내기 
	    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
	}
	
	var excelHandler = {
	        getExcelFileName : function(){
	            return '구매내역.xlsx';
	        },
	        getSheetName : function(){
	            return '구매내역';
	        },
	        getExcelData : function(){
	            return document.getElementById('tableData'); 
	        },
	        getWorksheet : function(){
	            return XLSX.utils.table_to_sheet(this.getExcelData());
	        }
	}
	
	
	
	$(document).ready(function() {
	    $("#exportExcel").click(function(){
	        exportExcel();
	    });
	});
	
</script>


</head>
<body>
	<div id="xlsx">
		<button type="button" id="exportExcel" class="cms-xlsx-btn">export as xlsx</button>
	</div>
	<div>
		<table id="tableData">
			<tr class="subject-container">
				<td id="subject-text" colspan="9">책 번호 : ${book_no }</td>
			</tr>
			<tr>
				<td class="sub-subject-text" colspan="9">${dateFrom } ~ ${dateTo }</td>
			</tr>
			<tr class="title-table-row">
				<td class="table-salesHistory-col1 center">번호</td>
				<td class="table-salesHistory-col2 center">아이디</td>
				<td class="table-salesHistory-col3 center">책번호</td>
				<td class="table-salesHistory-col4 center">제목</td>
				<td class="table-salesHistory-col5 center">주문번호</td>
				<td class="table-salesHistory-col6 center">주문일자</td>
				<td class="table-salesHistory-col7 center">가격</td>
				<td class="table-salesHistory-col8 center">수량</td>
				<td class="table-salesHistory-col9 center">분류</td>
			</tr>
			<c:if test="${empty salesHistory }">
			<tr>
				<td colspan="9">데이터가 없습니다</td>
			</tr>
			</c:if>
			<c:if test="${not empty salesHistory }">
				<c:forEach var="list" items="${salesHistory }">
			<tr class="table-row">
				<td class="table-salesHistory-col1 center">${list.rn }</td>
				<td class="table-salesHistory-col2 center">${list.purchase_id }</td>
				<td class="table-salesHistory-col3 center">${list.book_no }</td>
				<td class="table-salesHistory-col4 center">${list.book_title }</td>
				<td class="table-salesHistory-col5 center">${list.deal_no }</td>
				<td class="table-salesHistory-col6 center">${list.deal_date }</td>
				<td class="table-salesHistory-col7 center">${list.deal_price }</td>
				<td class="table-salesHistory-col8 center">${list.deal_count }</td>
				<td class="table-salesHistory-col9 center">${list.book_kind }</td>
			</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
		
	<div align="center">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button type="button" onclick="movePage('${startPage - 1}')" >이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i }">
				<button type="button" onclick="movePage('${i}')" >${i }</button>
			</c:if>
			<c:if test="${currentPage != i }">
				<button type="button" onclick="movePage('${i}')">${i }</button>
			</c:if>
		</c:forEach>
		<c:if test="${totalPage > endPage }">
			<button type="button" onclick="movePage('${endPage + 1}')" >다음</button>
		</c:if>
	</div>
		
</body>
</html>