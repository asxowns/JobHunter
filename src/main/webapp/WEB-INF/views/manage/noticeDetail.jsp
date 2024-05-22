<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
    section{
        width: 83.33%;
        margin: 32px auto;
        padding: 0;
    }
    #notice-head{
        display:flex;
        justify-content: space-between;
        align-items: center;
        margin: 12px 0 ;
        font-weight: bold;
    }
    .notice-title{
        font-size:28px;
    }
    .notice-date{
        color:darkgrey;
    }
    #notice-content{
        margin: 12px 0 ;
        min-height:400px;
    }
    .notice-btn{
        min-width:80px;
        max-width:155px;
        padding: 8px 0;
        margin: 0 6px;
        background-color: #D44958;
        color: #fff;
        border: 1px solid #D44958;
        border-radius: 5px;
        text-align:center;
        justify-content:center;
    }
    #notice-btns{
        display:flex;
        justify-content: space-between;
        margin:8px 0;
    }
    #btn-group2{
        display:flex;
    }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h1 style="text-align:center;margin-bottom:50px;"> 공지사항 </h1>
    <hr>
    <div id="notice-head"><span class="notice-title"> ${notice.title} </span> <span class="notice-date">${notice.regdate} </span></div>
    <hr>
    <div id="notice-content"> ${notice.content}</div>
    <hr>
    <div id="notice-btns">
        <div id="btn-group1" class="notice-btn"><a class="notice-btn" href="/manage/noticeList">목록으로 돌아가기</a></div>
        <div id="btn-group2">
            <c:if test="${logged_role eq 'm'}">
                <a class="notice-btn" href="/manage/noticeUpdateForm?ntcode=${notice.ntcode}">수정</a>
                <a class="notice-btn" href="/manage/noticeDelete?ntcode=${notice.ntcode}">삭제</a>
            </c:if>
        </didv>
    </div>
</section>
<footer>

</footer>

</body>
</html>