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
        margin: 24px auto;
        padding: 0;
    }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> ${notice.ntcode} </h2>
    <h2> ${notice.title} </h2><br>
    <h3> ${notice.content} </h3>
    <c:if test="${logged_role eq 'm'}">
        <a href="/manage/noticeUpdateForm?ntcode=${notice.ntcode}">수정</a>
        <a href="/manage/noticeDelete?ntcode=${notice.ntcode}">삭제</a>
    </c:if>
</section>
<footer>

</footer>

</body>
</html>