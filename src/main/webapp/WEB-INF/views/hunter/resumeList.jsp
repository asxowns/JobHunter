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
	.container{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		text-align: center;
		background-color: #d44958;
		padding: 20px;
		border-radius: 10px;
	}
	#addResume{
		position: absolute;
		top: 35%;
		left: 60%;
		transform: translate(-50%, -50%);
		text-align: center;
		background-color: #d44958;
		padding: 20px;
		border-radius: 10px;
	}

</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h2>내 이력서</h2>
		<span id="addResume"><a href="/hunter/resumeWriteForm">이력서등록</a></span>
		<div class="container">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일/최종수정일</th>
				</tr>
				<c:forEach var="resume" items="${resume }" varStatus="status">
					<tr>
						<td><a href="/hunter/resumeUpdateForm?resumecode=${resume.resumecode}"> ${status.count} </a></td>
						<td><a href="/hunter/resumeUpdateForm?resumecode=${resume.resumecode}">${resume.title  }</a></td>
						<td><a href="/hunter/resumeUpdateForm?resumecode=${resume.resumecode}">${resume.modifydate }</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<footer> </footer>

</body>
</html>