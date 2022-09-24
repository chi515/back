<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/member.css">
    <script src="https://kit.fontawesome.com/fd5006d268.js" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
    <div class="bg">
        <img src="../assets/photos/question.png" >
        <div class="member">
        <div class="title">成員介紹</div>
        <br>
        <div class="tabs">
            <button class="tablinks" onclick="openCity(event, '劉兆禹')" id="defaultOpen">劉兆禹</button>
            <button class="tablinks" onclick="openCity(event, '黃迦軒')">黃迦軒</button>
            <button class="tablinks" onclick="openCity(event, '黃昱瑋')">黃昱瑋</button>
            <button class="tablinks" onclick="openCity(event, '劉殷琪')">劉殷琪</button>
        </div>
        <div id="劉兆禹" class="tabcontent">
            <h3>劉兆禹</h3>
            <p>負責部分 : 前端</p>
            <p>心得 : 這次的期末報告跟以往不同的地方是採用了甲乙班合作的方式，我們負責前端，乙班負責後端，雖然在製作的過程大家都非常辛苦，但付出的汗水都將成為我們寶貴的經驗，在這次專題中我也學到許多新的東西，期望未來能做出更專業的網站。</p>
            <p>聯絡方法</p>
            <p><a href="https://www.instagram.com/zhaoyu73000/" class="fa fa-instagram"></a></p>
          </div>
          <div id="黃迦軒" class="tabcontent">
            <h3>黃迦軒</h3>
            <p>負責部分 : 前端</p>
            <p>心得 : 這次的期末報告是要把整個購物網站都做出來 , 要透過前後端合作才可以完成 , 在製作過程時我們大部分不會的動畫和功能都是在w3school裡面找 , 並加以改良 , 雖然功能上有些許不一樣 , 但總體來說都算是有完成到。在這次的專案中我學到了很多動畫的做法 , 希望之後能夠更精進一些。</p>
            <p>聯絡方法</p>
            <p><a href="#" class="fa fa-facebook"></a><a href="" class="fa fa-instagram"></a></p>
          </div>
          <div id="黃昱瑋" class="tabcontent">
            <h3>黃昱瑋</h3>
            <p>負責部分 : 後端</p>
            <p>心得 : 在上這堂課前，本來以為是只要查詢一下資料就能完成的功課，但實作起來卻困難重重，甚至在製作的過程中，也碰到很多問題，像是數值的轉換、如何設計一連串的迴圈，需要去問助教、同學或組員，也對資料庫的撰寫有了極大的認識，以後可能還要多加練習，才能將寫網站的技術寫的更精深。</p>
            <p>聯絡方法</p>
            <p><a href="https://www.facebook.com/profile.php?id=100005577347643" class="fa fa-facebook"></a><a href="https://www.instagram.com/uwei_0109/" class="fa fa-instagram"></a></p>
          </div>
          <div id="劉殷琪" class="tabcontent">
            <h3>劉殷琪</h3>
            <p>負責部分 : 後端</p>
            <p>心得 : 這學期網頁後端的撰寫過程中遇到了許多困難，需要更多的邏輯來思考應該如何讓前端的網頁有功能，但也藉由這次的期末專案我學到了很多經驗，也慢慢熟悉資料庫的應用，期望在未來我能靈活的應用所學的技術。</p>
            <p>聯絡方法</p>
            <p><a href="https://www.facebook.com/profile.php?id=100002505771555" class="fa fa-facebook"></a><a href=https://www.instagram.com/yinyinjk_0515"" class="fa fa-instagram"></a></p>
          </div>
          </div>
          <a href="index.jsp" class="back">返回</a>
    </div>
    <script src="../assets/js/backstage.js"></script>
</body>
</html>