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

main {
    width: 100%;
}

section {
    width: 80%;
    margin: auto;
    text-align: center;
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

.tabs {
    list-style-type: none;
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

.tab-link {
    cursor: pointer;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: #f2f2f2;
    margin-right: 10px; /* 메뉴 간 간격 조절 */
}

.tab-link.current {
    background-color: #ccc;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<main>
<section>
    로그인된 아이디 : ${sessionScope.logged}<br>
<div>
    <ul class="tabs">
        <li class="tab-link current" data-tab="tab-1">FAQ</li>
        <li class="tab-link" data-tab="tab-2">문의 게시판</li>
        <li class="tab-link" data-tab="tab-3">나의 문의</li>
    </ul>
    <table id="tab-1">
        <thead>
            <tr>
                <th>번호</th>
                <th>자주 묻는 질문(FAQ)</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cs" items="${list}" varStatus="stat">
                <tr>
                    <td>${stat.count}</td>
                    <td>제목이 들어가는 부분...</td>
                <tr>
            </c:forEach>
        </tbody>
    </table>
     <table id="tab-2">
        <thead>
            <tr>
                <th>문의 번호</th>
                <th>제목</th>
                <th>상태</th>
                <th>작성자</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cs" items="${list2}"  varStatus="stat">
                <tr>
                    <td>${stat.count}</td>
                    <td><a href="/cs/forumDetail?cscode=${cs.cscode}">${cs.title}</a></td>
                    <td>${cs.getResult()}</td>
                    <td>${cs.getHid().getMemberid()}</td>
                    <td>${cs.getCsdate()}</td>
                <tr>
            </c:forEach>
        </tbody>
    </table>
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
    <a href="/cs/forumWriteForm">문의글 작성</a>
</div>
</section>
</main>
<footer>

</footer>

</body>
<script type="text/javascript">
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