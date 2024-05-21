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

</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2>권한 관리</h2>
    <form method="get" action="/manage/accessHub">
        <label for="searchId">아이디</label>
        <input type="text" id="searchId" name="searchId">
        <button type="submit">검색</button>
    </form>
    <table>
        <thead>
        <tr>
            <th>아이디</th>
            <th>권한</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="member" items="${members}">
            <tr>
                <td>${member.memberid}</td>
                <td>
                    <form method="post" action="/manage/updateRole">
                        <input type="hidden" name="memberId" value="${member.memberid}">
                        <c:if test="${fn:trim(member.role) ne 'm'}">
                            <button type="submit" name="action" value="grant">권한 부여</button>
                        </c:if>
                        <c:if test="${fn:trim(member.role) eq 'm'}">
                            <button type="submit" name="action" value="delete">권한 삭제</button>
                        </c:if>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
</section>
<footer>

</footer>

</body>
</html>