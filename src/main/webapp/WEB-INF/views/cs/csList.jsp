<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
*{
    margin: 0;
    padding: 0;
}
main{
    width:100%;
}
section{
    width: 1240px;
    margin: auto !important;
    display: flex;
    justify-content: center;
    text-align: center;
}
table{
    width: 80%;
    
    text-align: center;
    border: 1px solid black;
    border-collapse: collapse;
}
tr{
    border: 1px solid black;
}
th{
    border: 1px solid black;
}
td{
    border: 1px solid black;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<main>
<section>
    <table>
        <thead>
            <tr>
                <th>문의 번호</th>
                <th>제목</th>
                <th>작성자</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cs" items="${list}">
                <tr>
                    <td>${cs.getCs_code()}</td>
                    <td>${cs.getTitle()}</td>
                    <td>${cs.getMember().getMember_id()}</td>
                <tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/cs/forumWriteForm">문의글 작성</a>
</section>
</main>
<footer>

</footer>

</body>
</html>