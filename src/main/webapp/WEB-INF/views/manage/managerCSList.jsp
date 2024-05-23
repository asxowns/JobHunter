<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="f" uri="http://kr.pe.skyer9.warehouseweb/functions"%>
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
        width: 100%;
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
            <span> 번호 </span> <span> 제목 </span> <span> 날짜 </span>
        </li>
        <c:forEach var="cs" items="${csList}"> 
            <a class="a-nodecoration" href="/manage/csDetail?ntcode=${cs.cscode}" varStatus="stat">
            <li class="csList-list-item">
                <span>${stat.count}</span>
                <span> ${cs.title} </span>
                <span> ${cs.title} </span>
                <span> ${f:formatLocalDateTime(cs.csdate, 'yyyy-MM-dd HH:mm:ss')}</span>
            </li>
            </a>
        </c:forEach>
    </div>
</section>
<footer>

</footer>

</body>
</html>