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
<%@ include file="./managerCheck.jsp" %>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> 공지사항 작성 </h2>
    <c:if test="${type ne '수정'}"><form method="post" action="/manage/noticeWrite"></c:if>
    <c:if test="${type eq '수정'}"><form method="post" action="/manage/noticeUpdate?ntcode=${notice.ntcode}"></c:if>
        공지사항 제목 : <input type="text" name="title" value="${notice.title}" /> <br>
        <label for="content"> 내용 : </label> <br>
        <textarea id="content" name="content" cols="100" rows="20">${notice.content} </textarea> <br>
        <input type="submit" value="등록">
        <input type="reset" value="reset">
    </form>
</section>
<footer>

</footer>

</body>
</html>