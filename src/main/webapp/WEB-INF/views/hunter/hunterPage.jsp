<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구직자 마이페이지</title>
<style>

</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> 구직자 마이페이지 </h2>
     	<aside class ="side-bar">
 		<section class="side-bar__icon-box">
 			<section class="side-bar__icon-1">
 				<div></div>
 				<div></div>
 				<div></div>
 			</section>
 		</section>
 		<ul>
 			<li>
 				<a href="resumeList.jsp">이력서 관리</a>
 			</li>
 			<li>
 				<a href="jobApplication.jsp">입사 지원 관리</a>
 			</li>
 			<li>
 				<a href="subscribeList.jsp">관심기업 관리</a>
 			</li>
 			<li>
 				<a href="positionList.jsp">입사 제안 현황</a>
 			</li>
 			<li>
 				<a href="favorList.jsp">스크랩한 채용 공고</a>
 			</li>
 			<li>
 				<a href="informList.jsp">내정보 관리</a>
 			</li>
 		</ul>
 	</aside>
</section>
<footer>

</footer>

</body>
</html>