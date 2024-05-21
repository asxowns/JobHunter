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
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> hunterPerPostList page </h2> <!-- 해당공고의 지원자 관리 페이지(해당공고내용/지원자(구직자)리스트/해당공고의 통계 -->
    <br>
    <div> <!-- 해당공고내용 --> 
    	${posting.postcode }
    	${posting.title }
    </div>
    <br>
    <div> <!-- 지원자 리스트 -->
    	
    </div>
</section>
<footer>

</footer>

</body>
</html>