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
	font-size: 16px;
	color: #333;
}

a {
	text-decoration: none;
	color: #333;
}

.title {
	width: 100%;
	margin-top: 100px;
}

.title h1 {
	text-align: center;
	margin-bottom: 75px;
}

section {
	width: 1240px;
	margin: 0 auto;
}

main {
	width: 800px;
	margin: 0 auto;
	border-top: 1px solid #B6B6B6;
	border-bottom: 1px solid #B6B6B6;
	position: relative;
	padding-bottom: 150px;
}

main b {
	color: #D44958;
	font-size: 15px;
	font-weight: 500;
	background: #fff;
	position: absolute;
	top: -10px;
	left: 30px;
	padding: 0px 8px;
}

.myInfo {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 50px;
}

.myInfo .myInfo_me {
	display: flex;
	align-items: center;
}

.myInfo .name {
	font-weight: 600;
	font-size: 18px;
	padding-right: 15px;
}

.myInfo .views {
	display: flex;
	height: 24px;
}

.myInfo .views img {
	display: inline-block;
	padding-right: 5px;
}

.myImg {
	background: #ccc;
	width: 45px;
	height: 45px;
	border-radius: 50%;
	margin-right: 13px;
}

.detailtitle {
	padding: 25px 0;
	font-size: 30px;
}

.detailcontent {
	font-weight: 500;
}

#main_bottom {
	width: 800px;
	margin: 0 auto;
}

#main_bottom .reply_count {
	padding: 10px 0;
	color: #848484;
}

.reply_box {
	width: 800px;
	height: 150px;
	border: 1px solid #b6b6b6;
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	position: relative;
	padding: 30px 60px;
	box-sizing: border-box;
}

.reply_box input[type="text"] {
	width: 100%;
	margin: 0 auto;
	height: 50px;
	border: 1px solid #B6B6B6;
	background: rgb(212, 73, 88, 0.05);
}

.reply_box input[type="submit"] {
	display: inline-block;
	width: 110px;
	color: #fff;
	background: #D44958;
	border: 1px solid #d44958;
	border-radius: 5px;
	padding: 10px 0;
	cursor: pointer;
	position: absolute;
	right: 60px;
	bottom: 15px;
}

.listup {
	width: 800px;
	margin: 50px auto 100px;
	text-align: center;
}

.listup a {
	display: inline-block;
	color: #d44958;
	border: 1px solid #d44958;
	padding: 12px 20px;
}

.listup a:hover {
	color: #fff;
	background: #d44958;
	border: 1px solid #d44958;
}

.regdate p{
	color:#aaa;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>

		<div class="title">
			<h1>기업 게시판</h1>
		</div>

		<main>
			<b>기업 게시판</b>

			<div class="myInfo">
				<div class="myInfo_me">
					<div class="myImg">
						<img src="">
					</div>
					<p class="name">${community.writer.memberid }</p>
					<p class="views">
						<img src="/resource/img/view_icon.png"> 22
					</p>
				</div>
				<div class="regdate">
					<p>${community.regdate }</p>
				</div>
			</div>
			<h1 class="detailtitle">${community.title }</h1>
			<h4 class="detailcontent">${community.content }</h4>

		</main>

		<!-- 댓글 -->
		<div id="main_bottom">
			<p class="reply_count">2개의 댓글</p>

			<div class="reply_box">
				<form action="enterCommuReply" method="post">
					<input type="text" name="comment">
					<input type="hidden" name="writer" value="${sessionScope.logged }">
					<input type="hidden" name="eccode" value="${community.eccode }">
					<input type="submit" value="댓글쓰기">
				</form>
			</div>
		</div>
		
		<c:forEach var="reply" items="${reply }">
			<div id="reply_list">
				<div class="reply_myinfo">
					<span class="img">
						<img src="">
					</span>
					<p>${sessionScope.logged }</p>
				</div>
				<div class="reply_content">
					<h4>${reply.comment }</h4>
					<h5>${reply.regdate }</h5>
				</div>
			</div>
		</c:forEach>

		<div class="active_menu">
			<div class="listup">
				<a href="openForum">목록보기</a>
			</div>
			<div class="upAndDel">
				<c:if test="${sessionScope.logged eq community.writer.memberid }">
					<a href="updateForm2?eccode=${community.eccode }&boardtype=2">수정</a>
					<a href="delete?eccode=${community.eccode }&boardtype=2">삭제</a>
				</c:if>	
			</div>
		</div>


	</section>
	<footer> </footer>

</body>
</html>