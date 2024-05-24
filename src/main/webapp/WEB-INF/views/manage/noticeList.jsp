<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
    #notice-list-table{
        display: flex;
        flex-direction: column;
        max-width: 75%;
        margin : 0 auto;
    }
    .notice-list-item{
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
        height: 50px;
        border-bottom: 1px solid black;
        padding-left: 10px;
        padding-right: 10px;
        margin-bottom: 10px;
        margin-top: 10px;
        font-size: 15px;
        font-weight: bold;
    }
    .a-nodecoration{
        text-decoration: none;
        color: black;
        cursor: pointer;
    }
    #notice-item-1{
        padding-left:20px;
        width:20%;
        text-align:left;
    }
    #notice-item-2{
        width:60%;
        text-align: center;
    }
    #notice-item-3{
        width:20%;
        text-align:right;
    }
    #notice-write-btn {
        width:1140px; 
        text-align: right; 
        margin: 10px auto;
        margin-bottom: 10px; 

    }
    #notice-write-btn a{
        padding: 5px 10px;
        border: 1px solid #D44958;
        background-color: #D44958;
        color: white;
    }
    #notice-write-btn a:hover {
        background-color: #A6303E;
        color: white;
    }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2 style="text-align:center; margin:24px 0;"> 공지사항 </h2>
    <div id="notice-write-btn"><a href="/manage/noticeWriteForm"> 공지사항 작성 </a> </div>
    <div id="notice-list-table">
        <li class="notice-list-item">
            <span id="notice-item-1"> 번호 </span> <span id="notice-item-2"> 제목 </span> <span id="notice-item-3"> 날짜 </span>
        </li>
        <c:forEach var="notice" items="${noticeList}"> 
            <a class="a-nodecoration" href="/manage/noticeDetail?ntcode=${notice.ntcode}">
            <li class="notice-list-item">
                <span id="notice-item-1">${notice.ntcode}</span>
                <span id="notice-item-2"> ${notice.title} </span>
                <span id="notice-item-3"> <fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd hh:mm"/> </span>
            </li>
            </a>
        </c:forEach>
    </div>
</section>
<footer>
    <%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>