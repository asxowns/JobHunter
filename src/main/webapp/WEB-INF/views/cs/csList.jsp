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
#tab-3{
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
    border:1px solid rgb(255, 236, 250);
    background-color:rgb(255, 236, 250);
    font-weight: bold;
    display:flex;
    align-items:center;
}
.cs_box_name, .cs_box p{
    text-align:center;
}
.cs_num, .cs_num2{
    width:5%;
}
.cs_title, .cs_title2{
    width:40%;
}
.cs_user, .cs_user2{
    width:30%;
}
.cs_situation, .cs_situation2{
    width:5%;
}
.cs_date, .cs_date2{
    width:20%;
}
.cs_box{
    width:1100px;
    height:70px;
    cursor:pointer;
    border-bottom: 2px solid gray;
    color: gray;
    font-weight: bold;
    display:flex;
    align-items:center;
}

.my_box_name{
    width:1100px;
    height:55px;
    border:1px solid rgb(255, 236, 250);
    background-color:rgb(255, 236, 250);
    font-weight: bold;
    display:flex;
    align-items:center;
}
.my_box_name, .my_box p{
    text-align:center;
}
.my_num, .my_num2{
    width:10%
}
.my_type, .my_type2{
    width:5%
}
.my_title, .my_title2{
    width:35%
}
.my_result, .my_result2{
    width:5%
}
.my_public, .my_public2{
    width:10%
}
.my_date, .my_date2{
    width:35%
}

.my_box{
    width:1100px;
    height:70px;
    cursor:pointer;
    border-bottom: 2px solid gray;
    color: gray;
    font-weight: bold;
    display:flex;
    align-items:center;

}

.active{
    display:none;
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
            <p class="cs_num">번호</p>
            <p class="cs_title">제목</p>
            <p class="cs_user">작성자</p>
            <p class="cs_result">상태</p>
            <p class="cs_date">날짜</p>
        </div>
        <c:forEach var="cs" items="${list2}"  varStatus="stat">
            <div class="cs_box" onclick="location.href='/cs/forumDetail?cscode=${cs.cscode}'">
                <input type="hidden" name="cscode" value="${cs.cscode}">
                <p class="cs_num2">${stat.count}</p>
                <p class="cs_title2">${cs.title}</p>
                <p class="cs_user2">${cs.getHid().getMemberid()}</p>
                <p class="cs_result2"><span class="cs_result_ex" id="resultSpan">${cs.getResult()}</span></p>
                <p class="cs_date2">${cs.getCsdate()}</p>
            </div>
        </c:forEach>
    </div>
    <div id="tab-3">
        <div class="my_box_name">
            <p class="my_num">문의 번호</p>
            <p class="my_type">분류</p>
            <p class="my_title">제목</p>
            <p class="my_result">상태</p>
            <p class="my_public">공개여부</p>
            <p class="my_date">날짜</p>
        </div>
        <c:forEach var="cs" items="${list3}"  varStatus="stat">
            <div class="my_box" onclick="location.href='/cs/forumDetail?cscode=${cs.cscode}'">
                <p class="my_num2">${stat.count}</p>
                <p class="my_type2"><span class="my_type_ex" id="typeSpan">${cs.getType()}<span></p>
                <p class="my_title2">${cs.getTitle()}</p>
                <p class="my_result2"><span class="my_result_ex" id="resultSpan">${cs.getResult()}<span></p>
                <p class="my_public2"><span class="my_publictype_ex" id="publictypeSpan">${cs.getPublictype()}</span></p>
                <p class="my_date2">${cs.getCsdate()}</p>
            </div>
        </c:forEach>
    </div>
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

    document.addEventListener("DOMContentLoaded", function() {
        const typeSpan = document.querySelectorAll(".my_type_ex");

        typeSpan.forEach((typeSpan, index) => {
            const type = typeSpan.innerText.trim();
            if (type === "A") {
                typeSpan.style.color = "blue";
                typeSpan.innerText = "문의";
            } else if (type === "B") {
                typeSpan.style.color = "red";
                typeSpan.innerText = "신고";
            }
        });
    });

    document.addEventListener("DOMContentLoaded", function(){
        const resultSpan = document.querySelectorAll(".my_result_ex");

        resultSpan.forEach((resultSpan, index) =>{
            const result = resultSpan.innerText.trim();
            if (result === 'N') {
                resultSpan.style.color = "red";
                resultSpan.innerText ='미답변';
            } else if( result === 'Y'){
                resultSpan.style.color = "blue";
                resultSpan.innerText = '답변'
            }
        });
    });

    document.addEventListener("DOMContentLoaded", function(){
        const resultSpan = document.querySelectorAll(".cs_result_ex");

        resultSpan.forEach((resultSpan, index) =>{
            const result = resultSpan.innerText.trim();
            if (result === 'N') {
                resultSpan.style.color = "red";
                resultSpan.innerText ='미답변';
            } else if( result === 'Y'){
                resultSpan.style.color = "blue";
                resultSpan.innerText = '답변'
            }
        });
    });

    document.addEventListener("DOMContentLoaded", function(){
        const publictypeSpan = document.querySelectorAll(".my_publictype_ex");

        publictypeSpan.forEach((publictypeSpan, index) =>{
            const publictype = publictypeSpan.innerText.trim();
            if (publictype === 'N') {
                publictypeSpan.innerText ='비공개';
            } else if( publictype === 'Y'){
                publictypeSpan.innerText = '공개'
            }
        });
    });

</script>
</html>