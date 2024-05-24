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
*{
	margin:0;
	padding:0;
}
body {
	color: #333;
}

ul {
	list-style: none;
}

section {
	width: 1240px;
	margin: 75px auto 100px;
}

h1 {
	font-size: 24px;
	text-align: center;
	margin-bottom: 105px;
}


input[type="text"] {
	width: 280px;
	height: 40px;
	border: 1px solid #bbb;
	border-radius: 10px;
	padding-left: 5px;
	box-sizing: border-box;
}

.input_box {
	padding-left: 20px;
}


table {
	border-collapse: separate;
	border-spacing: 0 15px;
}

table th {
	padding-right: 10px;
}

.posting_info{
	width:900px;
	margin:0 auto;
	display:flex;
	border:1px solid #ddd;
	border-top:2px solid #000;
	box-sizing:border-box;
}
.posting_info_left{
	width:75%;
	border-right:1px solid #ddd;
	padding:20px;
	box-sizing:border-box;
}
.posting_info_right{
	width:25%;
	padding:20px;
	box-sizing:border-box;
}

.posting_info_left_top{
	border-bottom:1px solid #ddd;
	padding-bottom:20px;
}
.posting_info_left_top p{
	padding-bottom:10px;
}

.posting_info_left_bot{
	display:flex;
	padding-top:20px;
	padding-bottom:30px;
	gap:300px;
}
.posting_info_left_bot-left p,
.posting_info_left_bot-right p{
	padding:3px 0;
	padding-left:20px;
}

.posting_info_right p{
	padding:5px 0;
}
.posting_info_right h3{
	padding-top:50px;
}
.posting_info_right #heartLink{
	padding-top:20px;
}

.btns{
	width:900px;
	margin:40px auto 100px;
	display:flex;
	justify-content:center;
	align-items:center;
	gap:20px;
}
#submitnow{
	background:#d44958;
	color:#fff;
	border:0;
	padding:15px 45px;
	font-size:18px;
	font-weight:bold;
	cursor:pointer;
}
#postscrap{
	background:#d44958;
	color:#fff;
	border:0;
	padding:15px 30px;
	font-size:18px;
	font-weight:bold;
	cursor:pointer;
}

.container{
	width:900px;
	margin:0 auto;
	border:1px solid #ddd;
	border-top:2px solid #000;
	position:relative;
}

ul.tabs {
	text-align:left;
	margin-bottom: 30px;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	cursor: pointer;
	background:#eee;
	padding:15px 20px;
	color:#888;
}

.tabs .line {
	color: #333;
}

ul.tabs li.current {
	color: #d44958;
	font-weight: bold;
	background:#fff;
}

.tab-content {
	min-height:1000px;
	display: none;
	padding: 15px;
}

.tab-content.current {
	display: block;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h1>채용정보</h1>
		<div class="posting_info">
			<div class="posting_info_left">
				<div class="posting_info_left_top">
					<p>${companyname}</p>
					<h2>${dto.title}</h2>
				</div>
				<div class="posting_info_left_bot">
					<div class="posting_info_left_bot-left">
						<h3>지원자격</h3>
						<p>경력2년이상</p>							
						<p>고졸이상</p>							
						<p>스킬: Java Script, React, 영어</p> 
						<p>인공지능, AntDesign</p>
						
													
					</div>
					<div class="posting_info_left_bot-right">
						<h3>근무조건</h3>
						<p>정규직 수습 3개월</p>
						<p>회사내규에 따름</p>
						<p>서울시 영등포구</p>
						<p>주 5일(월~금)</p>
						<p>유연 근무제</p>
					</div>
				</div>
			</div>
			<div class="posting_info_right">
				<div id="heartLink">
					<img id="heartImg" src="/resource/img/heartempty.png">
				</div>
			<div id="demo"></div>
				<h3>기업정보</h3>
				<p>산업(업종):솔루션 SI CRM</p>
				<p>사원수 36명</p>
				<p>설립년도</p>
				<p>기업형태</p>
				<p>홈페이지 www.happy.com</p>
			</div>			
		</div>

		<!-- 즉시지원 스크랩 버튼 -->
		<div class="btns">
			<form action="applicate" method="get">
				<input type="hidden" name="postcode" value="${dto.postcode}">
				<input type="hidden" name="hid" value="<%= session.getAttribute("logged") %>">
				<input type="submit" id="submitnow" value="즉시지원">
			</form>
			<form action="">
				<input type="button" id="postscrap" value="스크랩">
			</form>
		</div>

		<!-- 기업 상세 요강 -->
		<div class="container">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">상세정보</li>

				<li class="tab-link" data-tab="tab-2">기업정보</li>
			</ul>
			<div id="tab-1" class="tab-content current">
				<form action="/loginEnterprise" method="post">
					<div class="input_box">
										기업명
테크솔루션즈 (TecSolutions Inc.)

설립연도
2010년

본사 위치
서울특별시 강남구 테크로 123, 테크솔루션즈 타워

CEO
이민호 (Minho Lee)

직원 수
약 1,500명

사업 분야
소프트웨어 개발
인공지능(AI) 및 머신러닝
클라우드 컴퓨팅
빅데이터 분석
사이버 보안
주요 제품 및 서비스
클라우드 플랫폼 (CloudHub)

대규모 데이터를 효율적으로 관리하고 분석할 수 있는 클라우드 솔루션.
유연한 스케일링과 높은 보안성을 제공.
인공지능 분석 툴 (AInalytics)

머신러닝 알고리즘을 통해 데이터를 분석하고 예측하는 AI 기반 소프트웨어.
다양한 산업군에서 활용 가능.
사이버 보안 솔루션 (SecureNet)

실시간 위협 감지 및 차단, 데이터 암호화 등 종합적인 보안 서비스 제공.
모바일 애플리케이션 개발 (MobileCraft)

사용자 친화적이고 고성능의 모바일 앱 개발 서비스.
iOS 및 안드로이드 플랫폼 지원.
최근 주요 성과
2023년: 국내외 주요 기업들과 AI 협력 프로젝트 진행, 클라우드 플랫폼 사용 고객 수 50만 명 돌파.
2022년: 글로벌 사이버 보안 어워드에서 최우수 보안 솔루션상 수상.
2021년: 빅데이터 분석 소프트웨어 글로벌 판매량 1위 달성.
기업 미션 및 비전
미션: 혁신적인 기술을 통해 고객의 성공을 돕고, 사회에 긍정적인 변화를 만들어 나간다.

비전: 글로벌 리더로서 IT 기술 혁신을 선도하고, 스마트하고 안전한 디지털 세상을 구축한다.	
					</div>
				</form>
			</div>

			<div id="tab-2" class="tab-content">
				<form action="/loginHunter" method="post">
					<div class="input_box">
					기업명
테크솔루션즈 (TecSolutions Inc.)

설립연도
2010년

본사 위치
서울특별시 강남구 테크로 123, 테크솔루션즈 타워

CEO
이민호 (Minho Lee)

직원 수
약 1,500명

사업 분야
소프트웨어 개발
인공지능(AI) 및 머신러닝
클라우드 컴퓨팅
빅데이터 분석
사이버 보안
주요 제품 및 서비스
클라우드 플랫폼 (CloudHub)

대규모 데이터를 효율적으로 관리하고 분석할 수 있는 클라우드 솔루션.
유연한 스케일링과 높은 보안성을 제공.
인공지능 분석 툴 (AInalytics)

머신러닝 알고리즘을 통해 데이터를 분석하고 예측하는 AI 기반 소프트웨어.
다양한 산업군에서 활용 가능.
사이버 보안 솔루션 (SecureNet)

실시간 위협 감지 및 차단, 데이터 암호화 등 종합적인 보안 서비스 제공.
모바일 애플리케이션 개발 (MobileCraft)

사용자 친화적이고 고성능의 모바일 앱 개발 서비스.
iOS 및 안드로이드 플랫폼 지원.
최근 주요 성과
2023년: 국내외 주요 기업들과 AI 협력 프로젝트 진행, 클라우드 플랫폼 사용 고객 수 50만 명 돌파.
2022년: 글로벌 사이버 보안 어워드에서 최우수 보안 솔루션상 수상.
2021년: 빅데이터 분석 소프트웨어 글로벌 판매량 1위 달성.
기업 미션 및 비전
미션: 혁신적인 기술을 통해 고객의 성공을 돕고, 사회에 긍정적인 변화를 만들어 나간다.

비전: 글로벌 리더로서 IT 기술 혁신을 선도하고, 스마트하고 안전한 디지털 세상을 구축한다.
					</div>
				</form>
			</div>
		</div>

	</section>
	<footer> 
		<%@ include file="../sub/footer.jsp" %>
	</footer>

</body>
<script type="text/javascript">
	const btn1 = document.querySelector("[data-tab='tab-1']");
	const btn2 = document.querySelector("[data-tab='tab-2']");
	const tabContent1 = document.getElementById("tab-1");
	const tabContent2 = document.getElementById("tab-2");

	const heartLink = document.getElementById("heartLink");
	const heartImg = document.getElementById("heartImg");
	let isFilled = false;

	var posteid = "${posteid}";

	btn1.addEventListener("click", function() {
		btn1.classList.add("current");
		btn2.classList.remove("current");
		tabContent1.classList.add("current");
		tabContent2.classList.remove("current");
	});

	btn2.addEventListener("click", function() {
		btn2.classList.add("current");
		btn1.classList.remove("current");
		tabContent2.classList.add("current");
		tabContent1.classList.remove("current");
	});

	document
			.getElementById("heartLink")
			.addEventListener(
					"click",
					function(event) {
						event.preventDefault(); // 기본 이벤트 동작 방지
						if (isFilled) {
							heartImg.src = "/resource/img/heartempty.png";
							alert("관심기업이 해제되었습니다");
						} else {
							heartImg.src = "/resource/img/heartfill.png";
							alert("관심기업이 등록되었습니다");
						}
						isFilled = !isFilled;
						var outputDivPw = document
								.getElementById('outputDivPw');

						const xhttp = new XMLHttpRequest();
						xhttp.onload = function() {
							if (this.readyState == 4 && this.status == 200) {
								document.getElementById("demo").innerHTML = this.responseText;
							}
						};
						xhttp.open("GET", "/subscribe?posteid=" + posteid
								+ "&isFilled=" + isFilled, true);
						xhttp.send();
					});
</script>
</html>