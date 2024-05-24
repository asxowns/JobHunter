<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  prefix="f" uri="http://kr.pe.skyer9.warehouseweb/functions"%>
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
	margin: 0 auto 100px;
}

main {
	width: 800px;
	margin: 0 auto;
}

#forum_tap {
	border-bottom: 1px solid #eee;
	padding-bottom: 20px;
}

#forum_tap ul {
	display: flex;
	justify-content: center;
	text-align: center;
}

#forum_tap ul li {
	width: 190px;
	padding: 14px 0;
	cursor: pointer;
	font-size: 20px;
}

#forum_tap #open {
	border: 1px solid #D44958;
	background: #D44958;
	color: #fff;
}

#forum_tap #enterprise {
	border: 1px solid #EFEFEF;
	background: #fff;
	colod: #D44958;
}

#search_area {
	width: 100%;
	height: 80px;
	margin: 0 auto;
	display: flex;
	padding: 20px 0;
	position: relative;
	border-bottom: 1px solid #efefef;
}

.search_area_select {
	position: absolute;
	left: 218px;
	top: 28px;
	border-right: 1px solid #969696;
	padding-right:5px;
	padding-bottom:5px;
}

.search_area_select select {
	border: none;
	cursor: pointer;
	text-align:center;
}

.search_area_select select:focus {
	outline: none;
}

#submit_label {
	position: absolute;
	top: 29px;
	right: 220px;
	cursor: pointer;
}

form{
	width:380px;
	margin: 0 auto;
}
input[type="text"] {
	width: 380px;
	height: 100%;
	border: 1px solid #969696;
	padding-left: 100px;
	box-sizing: border-box;
	cursor: pointer;
	border-radius: 5px;
}
.boardSearch{
	padding-left:110px !important;
}

input[type="submit"] {
	display: none;
}

#list_area a {
	display: block;
	padding: 10px;
	border-bottom: 1px solid #efefef;
}

#list_area a p {
	font-size: 12px;
	color: #9e9e9e;
}

#list_area a h2 {
	padding: 3px 0 8px;
}

#list_area a h4 {
	font-size: 13px;
}

.list_bottom {
	display: flex;
	justify-content: space-between;
}

.list_bottom_info {
	display: flex;
	align-items: center;
}

.list_bottom_info p {
	height: 20px;
	display: flex;
	padding-left: 5px;
}
.list_bottom .user_img{
	display:inline-block;
	width:20px;
	height:20px;
	background:#ddd;
	border-radius:50%;
}

.write_btn {
	margin-top: 50px;
}

.write_btn a {
	display: inline-block;
	float: right;
	background: #fff;
	border: 1px solid #D44958;
	color: #D44958;
	padding: 11px 25px;
	font-weight:600;
}

.write_btn a:hover {
	background: #d44958;
	color: #fff;
}


.page_navi{
	text-align:center;
}

.page_navi span{
	color:#d44958;
	font-size:22px;
	padding:0 5px;
}

.page_navi a{
	color:#555;
	font-size:20px;
	padding:0 8px;
}
.page_navi a:hover {
	color:#d44958;
}

.prev{
	font-size:30px !important;
}
.next{
	font-size:30px !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<main>
			<div class="title">
				<h1>일반 게시판</h1>
			</div>

			<div id="forum_tap">
				<ul>
					<a href="openForum?boardtype=1" id="open_link"><li id="open">일반</li></a>
					<a href="enterpriseForum?boardtype=2" id="enterprise_link"><li id="enterprise">기업</li></a>
				</ul>
			</div>

			<div id="search_area">
				<div class="search_area_select">
					<select name="order">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="titleAndContent">제목+내용</option>
					</select>
				</div>
				<form action="search" method="get">
					<input type="text" name="keyword" class="boardSearch">
						<label for="submit"	id="submit_label">
							<img src="/resource/img/search_gray.png">
							<input type="hidden" name="boardtype" value="1">
							<input type="submit" value="" id="submit">
						</label>
				</form>
			</div>

			<div id="list_area">
				<c:forEach var="comm" items="${list }" varStatus="stat">
					<a href="forumDetail?cmcode=${comm.cmcode }">
						<p>${f:formatLocalDateTime(comm.regdate, 'yyyy-MM-dd HH:mm:ss')}</p>
						<h2>${comm.title }</h2>
						<h4>
							<div class="list_bottom">
								<div>
									<span class="user_img">
										<img src="">
									</span>
									<span>${comm.writer.memberid }</span>
								</div>
								<div class="list_bottom_info">
									<p>
										<img src="/resource/img/view_icon.png"> <span>11</span>
									</p>
									<p>
										<img src="/resource/img/reply_icon.png"> <span>${reply_cnt[stat.index]}</span>
									</p>
								</div>
							</div>
						</h4>
					</a>
				</c:forEach>
				
				<c:forEach var="search" items="${searchList }" varStatus="stat">
					<a href="forumDetail?cmcode=${search.cmcode }">
						<p>${f:formatLocalDateTime(search.regdate, 'yyyy-MM-dd HH:mm:ss')}</p>
						<h2>${search.title }</h2>
						<h4>
							<div class="list_bottom">
								<div>
									<span class="user_img"></span> <span>${search.writer.memberid }</span>
								</div>
								<div class="list_bottom_info">
									<p>
										<img src="/resource/img/view_icon.png"> <span>11</span>
									</p>
									<p>
										<img src="/resource/img/reply_icon.png"> <span>${reply_cnt[stat.index]}</span>
									</p>
								</div>
							</div>
						</h4>
					</a>
				</c:forEach>
			</div>

			<c:if test="${sessionScope.logged ne null }">
				<div class="write_btn">
					<a href="/board/forumWriteForm?boardtype=1">글쓰기</a>
				</div>
			</c:if>

			<!-- 페이지 네비게이션 -->
    <div class="page_navi">
        <!-- 이전 페이지 링크 -->
        <c:if test="${hasPrevious}">
            <a href="?page=${currentPage - 1}&size=${pageSize}&keyword=${keyword}&boardtype=1" class="prev">&#8249;</a>
        </c:if>

        <!-- 페이지 번호 표시 -->
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <span>${i + 1}</span>
                </c:when>
                <c:otherwise>
                    <a href="?page=${i}&size=${pageSize}&keyword=${keyword }&boardtype=1">${i + 1}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- 다음 페이지 링크 -->
        <c:if test="${hasNext}">
            <a href="?page=${currentPage + 1}&size=${pageSize}&keyword=${keyword}&boardtype=1" class="next">&#8250;</a>
        </c:if>
    </div>

		</main>
	</section>
	<footer> 
	</footer>

</body>
</html>