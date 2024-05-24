<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
    #chat-list-table{
        display: flex;
        flex-direction: column;
        max-width: 75%;
        margin : 0 auto;
    }
    .chat-list-item{
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
    #chat-item-1{
        padding-left:20px;
        width:20%;
        text-align:left;
    }
    #chat-item-2{
        width:60%;
        text-align: center;
    }
    #chat-item-3{
        width:20%;
        text-align:right;
    }
    #chat-write-btn {
        width:1140px; 
        text-align: right; 
        margin: 10px auto;
        margin-bottom: 10px; 

    }
    #chat-write-btn a{
        padding: 5px 10px;
        border: 1px solid #D44958;
        background-color: #D44958;
        color: white;
    }
    #chat-write-btn a:hover {
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
    <h2 style="text-align:center; margin:24px 0;"> 실시간 채팅 문의 답변 </h2>
    <div id="chat-list-table">
        <li class="chat-list-item">
            <span id="chat-item-1"> 문의자 아이디 </span> <span id="chat-item-2"> 최근 메세지 </span> <span id="chat-item-3"> 날짜 </span>
        </li>
        <c:forEach var="chat" items="${chatList}"> 
            <a class="a-nodecoration" href="/manage/chatDetail?chcode=${chat.chcode}">
            <li class="chat-list-item">
                <span id="chat-item-1">${chat.hid.memberid}</span>
                <span id="chat-item-2"> ${chat.message}</span>
                <span id="chat-item-3"> ${chat.timelog} </span>
            </li>
            </a>
        </c:forEach>
    </div>
</section>
<footer>

</footer>

</body>
</html>