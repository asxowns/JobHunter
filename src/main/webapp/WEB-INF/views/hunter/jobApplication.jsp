<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
#post-list-table{
        display: flex;
        flex-direction: column;
        max-width: 75%;
        margin : 0 auto;
    }
    .post-list-item{
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
    #post-item-1{
        padding-left:20px;
        width:20%;
        text-align:left;
    }
    #post-item-2{
        width:60%;
        text-align: center;
    }
    #post-item-3{
        width:20%;
        text-align:right;
    }
    .app-post-list-tab{
        min-width:1240px;
        padding-bottom:10px;
        margin: 10px auto;
        display: flex;
        justify-content: center;
    }
    #app-post-tab{
        width: 48px;
        text-align: center;
        padding:10px 30px;
        margin: 0 20px;
    }
    #app-post-tab:hover{
        background-color: #D44958;
        color:white;
    }
    .result-selection{
        background-color: #D44958;
        color:white;
    }

</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2 style="text-align:center; margin:24px 0;"> 입사 지원 현황 </h2>
    <div class="app-post-list-tab">
        <c:if test="${result eq '대기'}">
            <a id="app-post-tab" class="result-selection" href="/hunter/jobApplication">대기</a>
        </c:if>
        <c:if test="${result ne '대기'}">
            <a id="app-post-tab" href="/hunter/jobApplication">대기</a>
        </c:if>
        <c:if test="${result eq '합격'}">
            <a id="app-post-tab" class="result-selection" href="/hunter/jobApplication?result=합격">합격</a>
        </c:if>
        <c:if test="${result ne '합격'}">
            <a id="app-post-tab" href="/hunter/jobApplication?result=합격">합격</a>
        </c:if>
        <c:if test="${result eq '불합격'}">
            <a id="app-post-tab" class="result-selection" href="/hunter/jobApplication?result=불합격">불합격</a>
        </c:if>
        <c:if test="${result ne '불합격'}">
            <a id="app-post-tab" href="/hunter/jobApplication?result=불합격">불합격</a>
        </c:if>
    </div>
    <div id="post-list-table">
        <c:forEach var="post" items="${appPostList}"> 
            <a class="a-nodecoration" href="/hunter/postDetail?postcode=${post.postcode}">
                <li class="post-list-item">
                    <span id="post-item-1">${post.postcode}</span>
                    <span id="post-item-2"> ${post.title} </span>
                    <span id="post-item-3"> ${post.deadline} </span>
                </li>
            </a>
        </c:forEach>
    </div>
    
</section>
<script>
</script>

</body>
</html>