<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
	body, html {
    height: 100%;
    margin: 0;
  }
  .container, h2 {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column; 
  }
  td {
            padding: 15px; /* 셀 내부 패딩 설정 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> hunterList page </h2>
    <br>
    <div class="container">
    <table border="1">
	    <c:forEach var="resume" items="${resume}">
    	<tr>
    		<td>${resume.resumecode }</td>
    		<td>${hunter.username }</td>
    		<td>${resume.title}</td>
    		<td>${resume.eduname }</td>
    		<td>${resume.edumajor }</td>
    	</tr>
	    </c:forEach>
    </table>
    </div>	
</section>
<footer>

</footer>

</body>
</html>