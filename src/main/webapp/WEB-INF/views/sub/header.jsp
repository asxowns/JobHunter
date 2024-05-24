<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">

<style>
* {
	margin: 0;
	padding: 0;
}
body{
	font-size:16px;
	color:#333;
}
ul{
	list-style:none;
}
a{
	text-decoration:none;
	color:#333;
}

header {
	min-width:1240px;
	margin:0 auto;
	height: 150px;
	border-bottom: 1px solid #eee;
	box-shadow:0px 2px 10px #eee;
	background:#fff;
}

.head {
	width: 1240px;
	height:100%;
	margin: 0 auto;
}
.head_top{
	padding-top:20px;
	display:flex;
	justify-content:space-between;
	position:relative;
}
.head_top .logo{
	padding-left:15px;
}
.head_top .logo2{
	padding-right:15px;
}


.search_bar{
	position:absolute;
	top:20px;
	left:calc(50% - 206.5px);
	
}
#header_search_input{
	width:413px;
	height:47px;
	border:2px solid #D44958;
	border-radius:10px;
	padding:10px;
	padding-left:80px !important;
	box-sizing:border-box;
	margin-right:0;
	cursor: pointer;
}
#header_search_input:focus{
	border-color:#D44958;
	outline:none;
}

.search_label{
	position: relative;
	justify-content:space-between;
	
}
.header_search_bar_select{
	width:65px;
	height:25px;
	position: absolute;
	left:10px;
	top:1px;
	border-right:1px solid #D44958;
	box-sizing:border-box;
	padding-right:0px !important;
}
.header_search_bar_select select{
	height:22px;
	border:none;
	color:#D44958;
	font-weight:600;
	padding-right:10px;
	cursor: pointer;
}
.header_search_bar_select select:focus{
	outline:none;
}
.search_glasses{
	position:absolute;
	right:10px;
	top:5px;
	cursor: pointer;
}
#search_glass_label input[type="submit"]{
	display:none;
}

.head_bottom{
	display:flex;
	justify-content:space-between;
	padding-top:50px;
}
.head_bottom .menu_list #menu_list_item{
	display:flex;
}
.head_bottom .menu_list #menu_list_item li a{
	padding:0px 25px;
	font-size:18px;
	font-weight:600;
}
.head_bottom .menu_list #menu_list_item li a:hover{
	color:#D44958;
}

.head_bottom .menu_list #menu_list_item li:first-child a{
	padding-left:15px;
}

.user_log_list ul{
	display:flex;
}
.user_log_list ul li a{
	padding:0px 5px;
	margin:0px 4px;
	font-size:16px;
	font-weight:600;
}

#head_menu_slide_container{
	width:100%;
	background:#fff;
	border-bottom:1px solid #D44958;
	position:relative;
	z-index: 9999;
}
.active{
	display:none;
}
#head_menu_slide{
	width:1240px;
	margin:0 auto;
	display:flex;
	padding-top:15px;
}
#head_menu_slide ul{
	padding:0px 25px;
	
}
#head_menu_slide ul:first-child{
	padding-left:15px;
}
#head_menu_slide ul:nth-child(2){
	padding-left:27px;
}
#head_menu_slide ul:nth-child(3){
	padding-left:15px;
}
#head_menu_slide ul:nth-child(4){
	padding-left:15px;
}

#head_menu_slide ul li{
	text-align:center;
}
#head_menu_slide ul li a{
	display:inline-block;
	font-size:18px;
	padding-bottom:15px;
	color:#666;
}
#head_menu_slide ul li a:hover{
	color:#D44958;
}
</style>
	<div id="header">
		<div class="head">
			<div class="head_top">
				<div class="logo">
					<a href="/"><img src="/resource/img/logo.png"></a>
				</div>
				<form action="" method="get">
				<div class="search_bar">
						<label for="search_input" class="search_label">
							<input type="text" id="header_search_input" name="search">
							<div class="header_search_bar_select">
								<select>
									<option value="전체">전체</option>
									<option value="기업">기업</option>
									<option value="공고">공고</option>
								</select>
							</div>
							<label id="search_glass_label">
								<input type="submit" value="">
								<img src="/resource/img/search.png" class="search_glasses">
							</label>
						</label>
					</div>
				</form>
				<div class="logo2">
					<a href="/manage/manageLoginForm"><img src="/resource/img/logo2.png"></a>
				</div>
			</div>
			<div class="head_bottom">
				<div class="menu_list">
						<ul id="menu_list_item">
							<li><a href="/">채용공고</a></li>
							<li><a href="/enter/hunterList">기업·인재</a></li>
							<li><a href="/board/openForumList">커뮤니티</a></li>
							<li><a href="/cs/csList">고객센터</a></li>
						</ul>
					</div>
					
					<div class="user_log_list">
						<ul>
							<c:if test="${sessionScope.logged eq null }">
								<li><a href="/loginForm">로그인</a></li>
								<li><a href="/registForm">회원가입</a></li>
							</c:if>
							<c:if test="${sessionScope.logged ne null }">
								<c:if test="${fn:trim(sessionScope.role) eq 'h'}">
									<li><a href="/hunter/">${sessionScope.logged } 님 </a></li>
								</c:if>
								<c:if test="${fn:trim(sessionScope.role) eq 'e'}">
									<li><a href="/enter/">${sessionScope.logged } 님 </a></li>
								</c:if>
								<c:if test="${fn:trim(sessionScope.role) eq 'm'}">
									<li><a href="/manage/">${sessionScope.logged } 님 </a></li>
								</c:if>
								<li><a href="/logout">로그아웃</a></li>
							</c:if>
						</ul>
					</div>
				</div>
		</div>
		<div id="head_menu_slide_container" class="active">
			<div id="head_menu_slide">
					<ul>
						<li><a href="/">추천공고</a></li>
					</ul>
					<ul>
						<li><a href="/enterpriseList">기업전체</a></li>
						<li><a href="/enter/hunterList">인재정보</a></li>
					</ul>
					<ul>
						<li><a href="/board/openForum">자유게시판</a></li>
						<li><a href="/manage/noticeList">공지사항</a></li>
					</ul>
					<ul>
						<li><a href="/cs/csList">FAQ</a></li>
						<li><a href="/cs/csList">문의/신고</a></li>
						<li><a href="/cs/csList">나의문의</a></li>
					</ul>
				</div>
		</div>
	</div>
<script>

	const slide = document.getElementById("head_menu_slide_container");
	const menu = document.getElementById("menu_list_item");
	
	menu.addEventListener("mouseover", () => {
		slide.classList.remove("active");
	});
	slide.addEventListener("mouseleave", () => {
		slide.classList.add("active");
	});
	
	
	
</script>
<%@ include file="./chat.jsp" %>