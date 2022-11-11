<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style type="text/css">

 .bi{
    
    
   font-size: 40px;
} 

#title{
    text-align: center;
    padding-top: 50px;
}
.flex-container{
           display: inline-flex;
         flex-flow: row wrap;
         height: 600px;
         width: 80%;
           padding: 180px;
           border-radius: 10px;
           margin:5px;
           text-align: center;
           justify-content: space-evenly;
        }
       
.flex-container.center{align-content: center;}
       

.flex-item{
            width: 200px;
            height: 80px;
            margin: 30px;
            color: white;
            font-size: 22px;
            text-align: center;
            
        }

       
</style>
</head>
<body>
<h1 id="title" ><i class=" bi-person-circle"></i>프로필<br></h1>
<div style="display:flex;flex-wrap: nowrap;align-content: center;justify-content: center;">
  
    <div class="flex-container center">
        <div class="flex-item "><a href="mypage/cart.do"><i class="bi bi-cart"></i><br>장바구니</a></div>
        <div class="flex-item "><a href="mypage/purchase_list.do"><i class="bi bi-list-check"></i><br>구매목록</a></div>
        <div class="flex-item "><a href="mypage/sales_list.do"><i class="bi bi-list-check"></i><br>판매목록</a></div>
        <div class="flex-item "><a href="mypage/like_list.do"><i class="bi bi-heart-fill"></i><br>찜목록</a></div>
       <div class="flex-item "><a href="updateForm.do"><i class="bi bi-pencil-square"></i><br>개인정보 수정</a></div>
        <div class="flex-item "><a href="#"><i class="bi bi-brush"></i><br>나도 작가되기</a></div>
        <div class="flex-item "><a href="reportList.do"><i class="bi bi-journals"></i><br>독서록</a></div>
        <div class="flex-item "><a href="#"><i class="bi bi-megaphone"></i><br>내 문의함</a></div>
      </div>
 </div>

</body>
</html>