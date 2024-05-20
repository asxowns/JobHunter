<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
   
</style>
</head>
<body>

<section>
    <h2> 나의 디테일 페이지 </h2>
    <hr>
    <div>
        <strong>Title:</strong> ${cs.getTitle()}<br>
        <strong>Content:</strong> ${cs.getContent()}<br>
        <strong>Date:</strong> ${cs.getCsdate()}<br>
        <strong>Id:</strong> ${cs.getHid().getMemberid()}<br>
        <strong>Type:</strong> ${cs.getType()}<br>
        <strong>Publictype:</strong> ${cs.getPublictype()}<br>
        <strong>Result:</strong> ${cs.getResult()}<br>
        <a href="/cs/forumUpdateForm?cscode=${cs.cscode}">수정</a>
        <a href="/cs/delete?cscode=${cs.cscode}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
    </div>
</section>
<footer>

</footer>

</body>
</html>