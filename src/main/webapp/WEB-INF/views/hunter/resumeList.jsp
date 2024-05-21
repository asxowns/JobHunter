<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h2>내 이력서</h2>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일/최종수정일</th>
			</tr>

			<c:forEach var="resume" items="${resume }">
				<tr>
					<td>${resume.resumecode }</td>
					<td>${resume.title  }</td>
					<td>${resume.modifydate }</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<footer> </footer>

</body>
</html>