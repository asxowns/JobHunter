<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
* {
    margin: 0;
    padding: 0;
}

section {
    width: 1240px;
    margin:0 auto;
}
h1{
    text-align:center;
}

table {
    width: 100%;
    border: 1px solid black;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid black;
    padding: 10px;
}
#tab-1{
    width:800px;
    margin:0 auto;
}
#tab-2{
    width:1100px;
    height:500px;
    margin:0 auto;
}
.tabs {
    list-style-type: none;
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

.tab-link {
    width: 190px;
    cursor: pointer;
    padding: 10px 0;
    border: 1px solid #EFEFEF;
    background-color: #f2f2f2;
    text-align:center;
}

.tab-link.current {
    background-color: #D44958;
    color: #FFF;
    border:1px solid #d44958;
}


.faq_box{
    width:800px;
    height:80px;
    border:1px solid #ccc;
    padding:15px;
    box-sizing:border-box;
    cursor:pointer;
    margin:7px 0;
}
.title_Q{
    color: #D44958;
}
.title_A{
    color: blue;
}
.title_area{
    width:100%;
    font-weight: bold;
    
}
.faq_content{
    padding: 27px 0;
    box-sizing:border-box;
    color: gray;
    font-weight: bold;
}
.cs_box_name{
    width:1100px;
    height:55px;
    padding:12px;
    box-sizing:border-box;
    border:1px solid rgb(255, 236, 250);
    background-color:rgb(255, 236, 250);
    font-weight: bold;
}
.cs_box{
    width:1100px;
    height:70px;
    padding:25px;
    box-sizing:border-box;
    cursor:pointer;
    border:1px solid #ccc;
    color: gray;
    font-weight: bold;
}
.active{
    display:none;
}
.cs_num, .cs_num2{
    margin-right:100px;
}
.cs_title, .cs_title2{
    margin-right:200px;
}
.cs_user, .cs_user2{
    margin-right:100px;
}
.cs_situation, .cs_situation2{
    margin-right:100px;
}
#writeButton {
    width:105px;
    height:35px;
    background-color: #D44958;
    color: white;
    font-weight: bold;
    border: none;
    font-size: 16px;
    cursor: pointer;
    margin:20px 0;
    right: 10%;
    position:right;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>

<section>  
    <br><br><br>
    <h1>고객센터</h1><br><br><br>
<div>
    <ul class="tabs">
        <li class="tab-link current" data-tab="tab-1">FAQ</li>
        <li class="tab-link" data-tab="tab-2">문의 게시판</li>
        <li class="tab-link" data-tab="tab-3">나의 문의</li>
    </ul><br><br><br>
    <div id="tab-1">
        <c:forEach var="faq" items="${list}" varStatus="stat">
            <div class="faq_box">
                <p class="title_area"><span class="title_Q">Q.&nbsp;&nbsp;</span>${faq.getTitle()}</p>
                <div class="faq_content active">
                    <span class="title_A">A.&nbsp;&nbsp;</span>${faq.getContent()}
                </div>
            </div>
        </c:forEach>
    </div>

    <div id="tab-2">
        <div class="writeForm"><button id="writeButton">문의하기</button></div>
        <div class="cs_box_name">
            <p><span class="cs_num">번호</span><span class="cs_title">제목</span><span class="cs_user">작성자</span><span class="cs_situation">상태</span><span>날짜</span></p>
        </div>
        <c:forEach var="cs" items="${list2}"  varStatus="stat">
            <div class="cs_box" onclick="location.href='/cs/forumDetail?cscode=${cs.cscode}'">
                <input type="hidden" name="cscode" value="${cs.cscode}">
                <p><span class="cs_num2">${stat.count}</span>
                <span class="cs_title2">${cs.title}</span>
                <span class="cs_user2">${cs.getHid().getMemberid()}${cs.getResult()}</span>
                <span class="cs_situation">${cs.getResult()}</span>
                <span>${cs.getCsdate()}</span><p>
            </div>
        </c:forEach>
    </div>
     <table id="tab-3">
        <thead>
            <tr>
                <th>문의 번호</th>
                <th>분류</th>
                <th>제목</th>
                <th>상태</th>
                <th>공개여부</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cs" items="${list3}"  varStatus="stat">
                <tr>
                    <td>${stat.count}</td>
                    <td>${cs.getType()}</td>
                    <td><a href="/cs/forumDetail?cscode=${cs.cscode}">${cs.title}</a></td>
                    <td>${cs.getResult()}</td>
                    <td>${cs.getPublictype()}</td>
                    <td>${cs.getCsdate()}</td>
                <tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</section>

<footer>

</footer>
    
</body>
<script type="text/javascript">
    document.getElementById("writeButton").addEventListener("click", function() {
        window.location.href = "/cs/forumWriteForm";
    });

    document.querySelectorAll(".faq_box").forEach(faqbox => {
        faqbox.addEventListener("click", () => {
            const faqcontent = faqbox.querySelector(".faq_content");
            faqcontent.classList.toggle("active");
            if (faqcontent.classList.contains("active")) {
                faqbox.style.height = "80px";
            } else {
                faqbox.style.height = "150px";
            }
        });
    });

     document.addEventListener("DOMContentLoaded", function() {
        const btn1 = document.querySelector("[data-tab='tab-1']");
        const btn2 = document.querySelector("[data-tab='tab-2']");
        const btn3 = document.querySelector("[data-tab='tab-3']");
        const tabContent1 = document.getElementById("tab-1");
        const tabContent2 = document.getElementById("tab-2");
        const tabContent3 = document.getElementById("tab-3");

        btn1.classList.add("current");
        tabContent1.style.display = "block";
        tabContent2.style.display = "none";
        tabContent3.style.display = "none";

        btn1.addEventListener("click", function() {
            btn1.classList.add("current");
            btn2.classList.remove("current");
            btn3.classList.remove("current");
            tabContent1.style.display = "block";
            tabContent2.style.display = "none";
            tabContent3.style.display = "none";
        });

        btn2.addEventListener("click", function() {
            btn2.classList.add("current");
            btn1.classList.remove("current");
            btn3.classList.remove("current");
            tabContent2.style.display = "block";
            tabContent1.style.display = "none";
            tabContent3.style.display = "none";
        });

        btn3.addEventListener("click", function() {
            btn3.classList.add("current");
            btn1.classList.remove("current");
            btn2.classList.remove("current");
            tabContent3.style.display = "block";
            tabContent1.style.display = "none"; 
            tabContent2.style.display = "none"; 
        });
    });
</script>
</html>