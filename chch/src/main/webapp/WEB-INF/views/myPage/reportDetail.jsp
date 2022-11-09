<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/chch/resources/css/report_detail.css");
</style>
<style type="text/css">
</style>
<script type="text/javascript">
   function del(report_no) {
      var ch = confirm("정말로 삭제 하시나요?");
      if (ch) location.href = "reportDelete.do?report_no="+report_no;
      else {
         alert("삭제가 취소 되었어요");
      }
   }
</script>
<style type="text/css">
@import url("/chch/resources/css/report_detail.css");
</style>
</head>
<body>
   <div class="myReport-detail-wrap">
      <form action="reportUpdate.do" method="post">
         <input type="hidden" name="report_no" value="${report.report_no }">
         <!-- 회색선 전체 div -->
         
         <div id="report-write-box">
         <div id="back_click" onclick="location.href='reportList.do'"><span id="back">&lt; 돌아가기</span></div>
            <span id="book-input">${report.report_title }</span>
            <hr>
            <!-- 책 정보 wrap -->
            <div id="report-Img-report-wrap">
               <!-- 책 정보 이미지 div -->
               <div class="report-Infoimage-box">
               <div id="report-Img-box">
                  <img id="myReport_img" alt="이미지가 없습니다"
                     src="/chch/resources/images/bookImg/${report.book_image }">
               </div>
               <!-- <script type="text/javascript" src="/chackcheck/js/report.js"></script> -->

               <!-- 책 정보 텍스트(제목, 저자, 분류) div -->
               <div id="report-Infotext-box">
                     <input class="input1" value="분류 | ${report.book_kind }" readonly>
                     <input class="input1" value="도서명 | ${report.book_title }" readonly>
                     <input class="input1" value="저자 | ${report.book_author }" readonly>
                     <input class="input1" value="작성일 | ${report.report_date }" readonly>
               </div>
               </div>
               <div class="report-Infotext-box2">
                     <input class="input1-1" value="${report.report_title }" readonly>
                     <textarea class="input2" readonly>${report.report_content }</textarea>
                     <div id="expose-text">
                     	<span >독서록 공개 여부 | </span>
                     	<c:if test="${report.expose =='y' }"><span id="expose-y">허용</span></c:if>
                     	<c:if test="${report.expose =='n' }"><span id="expose-n">비허용</span></c:if>
                     </div>
               </div>
               <div class=btn-wrap>
                  <input id="update-btn" type="submit" value="수정"/>         
               </div>
            </div>
         </div>
      </form>
      <button id="delete-btn" onclick="del(${report.report_no })">삭제</button>   
   </div>

</body>
</html>