<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
		if ($('#book_kind option:selected').val() == null || $('#book_kind option:selected').val() == "" || $('#dateFrom').val() == null || $('#dateFrom').val() =="" || $('#dateTo').val() == null || $('#dateTo').val() =="" || $('#sort option:selected').val() == null || $('#sort option:selected').val() == "") {
			alert("값을 입력하고 조회하세요");
			return false;
		}
		
		var url = "salesRankingSelect.do?book_kind="
				+ $('#book_kind option:selected').val()
				+"&dateFrom="
				+ $('#dateFrom').val()
				+"&dateTo="
				+ $('#dateTo').val()
				+"&sort="
				+ $('#sort option:selected').val()
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
	            return '판매순위.xlsx';
	        },
	        getSheetName : function(){
	            return '판매순위';
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
				<td id="subject-text" colspan="9">${book_kind }</td>
			</tr>
			<tr>
				<td class="sub-subject-text" colspan="9">${dateFrom } ~ ${dateTo }</td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${sort == 1 }"><td colspan="9">판매량 기준 순위</td></c:when>
					<c:when test="${sort == 2 }"><td colspan="9">판매금액 기준 순위</td></c:when>
				</c:choose>
			</tr>
			<tr class="title-table-row">
				<td class="table-salesRanking-col1 center">순위</td>
				<td class="table-salesRanking-col2 center">책번호</td>
				<td class="table-salesRanking-col3 center">제목</td>
				<td class="table-salesRanking-col4 center">분야</td>
				<td class="table-salesRanking-col5 center">작가</td>
				<td class="table-salesRanking-col6 center">출판사</td>
				<td class="table-salesRanking-col7 center">출간일</td>
				<td class="table-salesRanking-col8 center">판매량</td>
				<td class="table-salesRanking-col9 center">판매금액</td>
			</tr>
			<c:if test="${empty salesRanking }">
			<tr>
				<td colspan="9">데이터가 없습니다</td>
			</tr>
			</c:if>
			<c:if test="${not empty salesRanking }">
				<c:forEach var="list" items="${salesRanking }">
			<tr class="table-row">
				<td class="table-salesRanking-col1 center">${list.rn }</td>
				<td class="table-salesRanking-col2 center">${list.book_no }</td>
				<td class="table-salesRanking-col3 left">${list.book_title }</td>
				<td class="table-salesRanking-col4 center">${list.book_kind }</td>
				<td class="table-salesRanking-col5 center">${list.book_author }</td>
				<td class="table-salesRanking-col6 center">${list.book_publisher }</td>
				<td class="table-salesRanking-col7 center">${list.book_publish_date }</td>
				<td class="table-salesRanking-col8 right">${list.deal_count }</td>
				<fmt:formatNumber var="deal_price" value="${list.deal_price }" pattern="#,###"></fmt:formatNumber>
				<td class="table-salesRanking-col9 right">${deal_price }</td>
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