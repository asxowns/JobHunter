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
    <h2> 이력서 관리 </h2>
    <button type=button><a href="</button>
    <c:forEach var="title" items="${title }">
    	
    	${title }
    </c:forEach>
</section>
<footer>
    <%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>