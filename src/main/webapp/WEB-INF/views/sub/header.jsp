<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- 폰트 첨부 -->
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
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
	width: 100%;
	height: 150px;
	border-bottom: 1px solid #eee;
	box-shadow:0px 2px 10px #eee;
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
#search{
	width:413px;
	height:47px;
	border:2px solid #D44958;
	border-radius:10px;
	padding:10px;
	padding-left:80px;
	box-sizing:border-box;
	margin-right:0;
	cursor: pointer;
}
#search:focus{
	border-color:#D44958;
	outline:none;
}

.search_label{
	position: relative;
	justify-content:space-between;
	
}
.search_bar_select{
	position: absolute;
	left:10px;
	top:5px;
	border:none;
	width:65px;
	color:#D44958;
	font-weight:600;
	border-right:1px solid #D44958;
	box-sizing:border-box;
	cursor: pointer;
}
.search_bar_select:focus{
	outline:none;
}
.search_glasses{
	position:absolute;
	right:10px;
	top:5px;
	cursor: pointer;
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
	padding:0px 10px;
	margin:0px 5px;
	font-size:18px;
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
</head>
<body>
	<header>
		<div class="head">
			<div class="head_top">
				<div class="logo">
					<a href="/"><img src="/resource/img/logo.png"></a>
				</div>
				<div class="search_bar">
					<label for="search" class="search_label">
						<input type="text" id="search" name="search">
						<select class="search_bar_select">
							<option value="전체">전체</option>
							<option value="기업">기업</option>
							<option value="공고">공고</option>
						</select>
						<img src="/resource/img/search.png" class="search_glasses">
					</label>
				</div>
				<div class="logo2">
					<a href="/"><img src="/resource/img/logo2.png"></a>
				</div>
			</div>
			<div class="head_bottom">
				<div class="menu_list">
						<ul id="menu_list_item">
							<li><a href="/">채용공고</a></li>
							<li><a href="/enter/hunterList">인재정보</a></li>
							<li><a href="/board/openForumList">커뮤니티</a></li>
							<li><a href="/cs/csList">고객센터</a></li>
						</ul>
					</div>
					
					<div class="user_log_list">
						<ul>
							<li><a href="/loginForm">로그인</a></li>
							<li><a href="/registForm">회원가입</a></li>
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
	</header>
	
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
</body>
</html>