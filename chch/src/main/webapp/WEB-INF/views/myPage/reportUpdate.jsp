<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@import url("/chch/resources/css/report_detail.css");
</style>
</head>
<body>
   <div class="myReport-detail-wrap">
      <form action="reportUpdateConfirm.do" method="post" >
         <input type="hidden" name="report_no" value="${report.report_no }">
         
         <!-- 회색선 전체 div -->
         <div id="report-write-box">
         <div id="back_click" onclick="location.href='reportDetail.do?report_no=${report.report_no}'"><span id="back">&lt; 돌아가기</span></div>
            <span id="book-input">${report.report_title }</span>
            <hr>
            <!-- 책 정보 wrap -->
            <div id="report-Img-report-wrap">
               <!-- 책 정보 이미지 div -->
               <div class="report-Infoimage-box">
               <div id="report-Img-box">
                  <img id="myReport_img" alt="이미지가 없습니다"
                     src="/chackcheckPrac/resources/images/bookImg/${report.book_image }">
               </div>
               <!-- <script type="text/javascript" src="/chackcheck/js/report.js"></script> -->

               <!-- 책 정보 텍스트(제목, 저자, 분류) div -->
               <div id="report-Infotext-box">
                     <input class="input1-3" value="분류 | ${report.book_kind }" readonly>
                     <input class="input1-3" value="도서명 | ${report.book_title }" readonly>
                     <input class="input1-3" value="저자 | ${report.book_author }" readonly>
                     <input class="input1-3" value="작성일 | ${report.report_date }" readonly>
               </div>
               </div>
               <div class="report-Infotext-box2">
                    <input type="text" name="report_title" class="input1-1" value="${report.report_title }" autofocus="autofocus" >
                    <textarea style="white-space:pre;" name="report_content" class="input2">${report.report_content }</textarea>
					<div id="row-div">
						<span>독서록 공개여부 | </span>
						<c:if test="${report.expose == 'y' }">
							<input type="radio" id="yes" name="expose" value="y" checked>
							<label for="yes">예</label>
							<input type="radio" id="no" name="expose" value="n">
							<label for="no">아니오</label>
						</c:if>
						<c:if test="${report.expose == 'n' }">
							<input type="radio" id="yes" name="expose" value="y">
							<label for="yes">예</label>&nbsp;&nbsp;
							<input type="radio" id="no" name="expose" value="n" checked>
							<label for="no">아니오</label>
						</c:if>
						<span id="expose-warn">&nbsp;&nbsp;&nbsp;*독서록 공개여부 '예'선택시 도서 판매 목록에 해당 독서록이 노출됩니다</span> 
					</div>  
					<p>
					       
               </div>
               <div class=btn-wrap>
                  <input type="submit" id="input-btn" value="수정하기"> 
                              
               </div>
            </div>
         </div>
      </form>
   </div>

</body>
</html>