<%@page import="com.green.jobhunter.entity.Posting"%>
<%@page import="java.util.List"%>
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
	font-size: 16px;
}

a {
	text-decoration: none;
}

ul {
	list-style: none;
}

section{
	width:1240px;
	margin:0 auto;
}

.choose_job{
	margin:10px 0;
}
.choose_job span{
	padding:0px 5px;
	color:#aaa;
}
.choose_job span:nth-child(1){
	font-weight:bold;
	color:#333;
	font-size:20px;
}

.search-container{
	display:flex;
	justify-content:space-between;
	align-items:center;
	height:40px;
	border-bottom:1px solid #ccc;
	margin-bottom:40px;
	padding-bottom:15px;
}

.search-select-filter{
	height:auto;
}
.search-select-filter select{
	width:80px;
	height:35px;
	border:1px solid #666;
	border-radius:5px;
	padding:5px;
	color:#666;
}

.search-input-filter{
	position:relative;
}
.search-input-filter input[type="text"]{
	width:300px;
	height:40px;
	border:1px solid #666;
	border-radius:5px;
	color:#666;
	padding-left:5px;
	box-sizing:border-box;
}
.search-input-filter input[type="submit"]{
	display:none;
}
.search-input-filter img{
	position:absolute;
	right:5px;
	bottom:5px;
	cursor:pointer;
}

.post_area{
	width:100%;
	display:flex;
	flex-wrap:wrap;
	gap:20px;
}
.post_box{
	width:290px;
	height:350px;
	border:1px solid #eee;
	border-radius:10px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, .05);
	overflow:hidden;
	transition:all 0.3s;
}
.post_box:hover{
	transform: translateY(-10px);
}
.post_img{
	height:150px;
}
.post_img img{
	width:100%;
	height:100%;
	object-fit:cover;
}

.post_info{
	padding:20px;
	overflow: hidden;
}
.post_info .ent_name{
	font-size:15px;
	font-weight:bold;
	padding-bottom:20px;
}
.post_info .post_title{
	font-size:16px;
	padding-bottom:15px;
	font-weight:400;
}
.post_info .industry{
	font-size:13px;
	display:flex;
	color:#6a6a6a;
	font-weight:400;
}
.post_info .industry .line{
	padding:0 5px;
}

.post_info_bot{
	font-size:14px;
	display:flex;
	justify-content:space-between;
	border-top:1px solid #ccc;
	margin-top:30px;
	padding-top:10px;
}
.post_info .endDate{
	font-size:13px;
	color:#888;
	font-weight:400;

}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>

	<section>
		<h2>추천공고</h2>

		<article class="post_area">
				<div class="post_box">
					<a
						href="">
						<div class="post_img">
							<img src="/resource/img/post_common.jpg">
						</div>
						<div class="post_info">

							<h1 class="ent_name">삼성전자</h1>
							<h2 class="post_title">영업 전산실 모집</h2>
							<h3 class="industry">${dto.job}<span class="line">|</span><span class="area">부산</span></h3>
							<div class="post_info_bot">
								<p>💰합격 축하금 100만원<p>
								<h4 class="endDate">~2024/05/30</h4>
							</div>
						</div>
						<div class="post_info">

							<h1 class="ent_name">라온소프트</h1>
							<h2 class="post_title">영업 전산실 모집</h2>
							<h3 class="industry">${dto.job}<span class="line">|</span><span class="area">부산</span></h3>
							<div class="post_info_bot">
								<p>💰합격 축하금 100만원<p>
								<h4 class="endDate">~2024/05/30</h4>
							</div>
						</div>
						<div class="post_info">

							<h1 class="ent_name">시원</h1>
							<h2 class="post_title">영업 전산실 모집</h2>
							<h3 class="industry">${dto.job}<span class="line">|</span><span class="area">부산</span></h3>
							<div class="post_info_bot">
								<p>💰합격 축하금 100만원<p>
								<h4 class="endDate">~2024/05/30</h4>
							</div>
						</div>
						<div class="post_info">

							<h1 class="ent_name">삼성전자</h1>
							<h2 class="post_title">영업 전산실 모집</h2>
							<h3 class="industry">${dto.job}<span class="line">|</span><span class="area">부산</span></h3>
							<div class="post_info_bot">
								<p>💰합격 축하금 100만원<p>
								<h4 class="endDate">~2024/05/30</h4>
							</div>
						</div>
					</a>
				</div>
				
		</article>
		<div class="choose_job">
			<span>직무전체</span>
			<span>|</span>
			<span>직무를 선택해주세요</span>
		</div>

	<form id="searhForm" action="searchFilter" method="get">
		<div class="search-container">
			<div class="search-select-filter">

				<select id="area" name="area_">
					<option value="">지역</option>
					<option value="서울">서울</option>
					<option value="부산">부산</option>
					<option value="경기">경기</option>
				</select> <select id="career" name="career_">
					<option value="">경력</option>
					<option value="신입">신입</option>
					<option value="경력">경력</option>
				</select> <select id="edutype" name="edutype_">
					<option value="">학력</option>
					<option value="대졸">대졸</option>
					<option value="초대졸">초대졸</option>
					<option value="고졸">고졸</option>

				</select> 
			</div>
			<div class="search-input-filter">
				<input type="text" id="search" name="companyname_" placeholder="기업명 공고명 검색">
				<label for="search-button">
					<img src="/resource/img/search_gray.png">
					<input type="submit" id="search-button" value="검색">
				</label>
			</div>
		</div>
	</form>

		<article class="post_area">
			<c:if test="${not empty msg}" >
			<div>${msg}</div>
			</c:if>
			<c:forEach var="dto" items="${list1}" varStatus="status">
				<div class="post_box">
					<a
						href="postDetail?postcode=${dto.postcode}&posteid=${dto.eid.memberid}">
						<div class="post_img">
							<img src="/resource/img/${dto.mainurl }">
						</div>
						<div class="post_info">

							<h1 class="ent_name">${list2[status.index].companyname}</h1>
							<h2 class="post_title">${dto.title }</h2>
							<h3 class="industry">${dto.industry }<span class="line">|</span><span class="area">${dto.area }</span></h3>
							<div class="post_info_bot">
								<p>💰합격 축하금 100만원<p>
								<h4 class="endDate">${dto.deadline }</h4>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</article>



	</section>
	<footer> 

	</footer>

</body>
<script>
	window.addEventListener("load", function() {
		var selectedRegion = "${param.area_}"; // 서블릿에서 전달된 region 파라미터 값
		if (selectedRegion) {
			document.getElementById("area").value = selectedRegion;
		}

		var selectedCareer = "${param.career_}"; // 서블릿에서 전달된 career 파라미터 값
		if (selectedCareer) {
			document.getElementById("career").value = selectedCareer;
		}

		var selectedDegree = "${param.edutype_}"; // 서블릿에서 전달된 degree 파라미터 값
		if (selectedDegree) {
			document.getElementById("edutype").value = selectedDegree;
		}

		// select 요소의 변경 이벤트 처리
		document.getElementById("area").addEventListener("change", function() {
			// 서블릿 호출을 위해 form을 submit
			document.getElementById("searhForm").submit();
		});

		document.getElementById("career").addEventListener("change",
				function() {
					// 서블릿 호출을 위해 form을 submit
					document.getElementById("searhForm").submit();
				});

		document.getElementById("edutype").addEventListener("change",
				function() {
					// 서블릿 호출을 위해 form을 submit
					document.getElementById("searhForm").submit();
				});
	});
</script>

</html>