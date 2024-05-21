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
    <h2> enterprisePostList page </h2>
    <br>
    <div><a href="enterprisePostWriteForm"><button>채용공고등록</button></a></div>
    <div>
    <table border="1">
    <c:forEach var="posting" items="${posting }">
    	<tr>
    		<td>${posting.postcode }</td>
    		<td>${posting.title }</td>   
    		<td>${posting.regdate }
    		<td>
    			<a href="hunterPerPostList?postcode=${posting.postcode }"><button>지원자보기</button></a>
    			<a href="enterprisePostUpdateForm?postcode=${posting.postcode }"><button>수정</button></a>
    			<a href="enterprisePostDelete?postcode=${posting.postcode }"><button>삭제</button></a>
    		</td>
    	</tr>
    </c:forEach>	
    </table>
    </div>
</section>
<footer>

</footer>

</body>
</html>