<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
    #csList-list-table{
        display: flex;
        flex-direction: column;
        max-width: 75%;
        margin : 0 auto;
    }
    .csList-list-item{
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
        width:10%;
        text-align:left;
    }
    #notice-item-2{
        width:74%;
        text-align: center;
    }
    #notice-item-3{
        width:8%;
        text-align:right;
    }
    .notice-item-span{
        display:flex;
        align-items:center;
        justify-content:center;
        width: 105px;
        height: 35px;
        color: white;
        font-weight: bold;
        border: none;
        font-size: 16px;
        cursor: pointer;
        margin: 20px 0;
    }
    #qeust{
        background-color: cornflowerblue;
    }
    #report{
        background-color: #D44958;
    }
    
</style>
<%@ include file="./managerCheck.jsp" %>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2 style="text-align:center; margin:24px 0;"> 문의/신고 답변 처리 </h2>
    <div id="csList-list-table">
        <li class="csList-list-item">
            <span id="notice-item-1"> 유형 </span> <span id="notice-item-2"> 제목 </span> <span id="notice-item-3"> 작성된 날짜 </span><span id="notice-item-3"> 경과일 </span>
        </li>
        <c:forEach var="cs" items="${csDtoList}" varStatus="stat"> 
            <a class="a-nodecoration" href="/hunter/csDetail?ntcode=${cs.getCscode()}" >
            <li class="csList-list-item">

                <c:if test="${fn:trim(cs.getType()) == 'A' }"> 
                    <span class="notice-item-span"id="qeust"> 문의 </span>
                </c:if>
                <c:if test="${fn:trim(cs.getType()) == 'B' }"> 
                    <span class="notice-item-span"id="report"> 신고 </span>
                </c:if>

                <span id="notice-item-2"> ${cs.getTitle()} </span>
                <span id="notice-item-3"> ${cs.getCsdate()}</span>
                <span id="notice-item-3"> ${cs.getBetween()}일 경과 </span>
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