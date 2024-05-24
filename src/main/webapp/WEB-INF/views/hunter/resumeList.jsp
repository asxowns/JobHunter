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
* {
	margin: 0;
	padding: 0;
}

body {
	color: #333;
}

section {
	width: 1240px;
	margin: 0 auto;
}

h1 {
	text-align: center;
	margin: 75px 0;
}

.container {
	width: 800px;
	margin: 0 auto;
	border-top: 1px solid #ddd;
	margin-top:40px;
	
}
.container ul li{
	padding-bottom:10px;
}

.resume_write {
	width: 800px;
	margin: 0 auto;
	text-align: right;
}

.resume_write_btn {
	display: inline-block;
	background: #ddd;
	border:1px solid #ddd;
	padding: 10px 17px;
}
.resume_write_btn:hover{
	border:1px solid #d44958;
	color:#d44958;
	background:#fff;
}

.resume_list{
	width:800px;
	margin:0 auto;
	border-bottom:1px solid #ddd;
	display:flex;
	align-items:center;
	justify-content:space-between;
	padding:20px;
	box-sizing:border-box;
}

.resume_title {
	font-size: 30px;
}

.resume_date {
	color: #aaa;
}
.modify_btn{
	display:inline-block;
	border:1px solid #aaa;
	padding:10px 20px;
}
.modify_btn:hover{
	background:#d44958;
	border:1px solid #d44958;
	color:#fff;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h1>이력서 관리</h1>
		<div class="resume_write">
			<a href="/hunter/resumeWriteForm" class="resume_write_btn">이력서등록</a>
		</div>
		<div class="container">
			<c:forEach var="resume" items="${resume }" varStatus="status">
				<div class="resume_list">
					<ul>
						<li>${sessionScope.logged } 님의 이력서</li>
						<li class="resume_title">${resume.title  }</li>
						<li class="resume_date">${resume.modifydate }</li>
					</ul>
					<a href="/hunter/resumeUpdateForm?resumecode=${resume.resumecode}"
						class="modify_btn">수정</a>
				</div>
				<div class="resume_list">
					<ul>
						<li>${sessionScope.logged } 님의 이력서</li>
						<li class="resume_title">${resume.title  }</li>
						<li class="resume_date">${resume.modifydate }</li>
					</ul>
					<a href="/hunter/resumeUpdateForm?resumecode=${resume.resumecode}"
						class="modify_btn">수정</a>
				</div>
			</c:forEach>
		</div>
	</section>
	<footer> 
		<%@ include file="../sub/footer.jsp" %>
	</footer>

</body>
</html>