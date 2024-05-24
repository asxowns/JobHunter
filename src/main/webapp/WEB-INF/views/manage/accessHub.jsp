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
    section{
        text-align:center;
        margin:20px 0;
    }
    #table-list{
        width:83.33%;
        margin:20px auto;
    }
    #searchId{
        width:43.33%;
    }
    #table-list-item{
        width:1%;
    }
    #table-for-gap{
        border-spacing: 5px 1rem;
    }
    #accesshub-btn{
        width:80px;
        height:30px;
        background-color: #D44958;
        color: #fff;
        border: 1px solid #D44958;
        border-radius: 5px;
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
    <h2 >권한 관리</h2>
    <div id="table-list">
        <form method="get" action="/manage/accessHub">
            <label for="searchId">아이디</label>
            <input type="text" id="searchId" name="searchId">
            <button id="accesshub-btn" type="submit">검색</button>
        </form>
        <table id="table-for-gap">
            <thead>
                <tr>
                    <th id="table-list-item">아이디</th>
                    <th id="table-list-item">권한</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="member" items="${members}">
                <tr>
                    <td id="table-list-item">${member.memberid}</td>
                    <td id="table-list-item">
                        <form method="post" action="/manage/updateRole">
                            <input type="hidden" name="memberId" value="${member.memberid}">
                            <c:if test="${fn:trim(member.role) ne 'm'}">
                                <button id="accesshub-btn" type="submit" name="action" value="grant">권한 부여</button>
                            </c:if>
                            <c:if test="${fn:trim(member.role) eq 'm'}">
                                <button id="accesshub-btn" type="submit" name="action" value="delete">권한 삭제</button>
                            </c:if>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>
<footer>
    <%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>