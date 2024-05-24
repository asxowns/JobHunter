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
	margin: 73px auto 100px;
}

h1 {
	font-size: 24px;
	text-align: center;
	margin-bottom: 105px;
}

.container {
	width: 500px;
	margin: 0 auto;
}

ul.tabs {
	text-align: center;
	margin-bottom: 30px;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 0px 10px;
	cursor: pointer;
}

.tabs .line {
	color: #333;
}

ul.tabs li.current {
	color: #d44958;
	font-weight: bold;
}

.tab-content {
	display: none;
	padding: 15px;
}

.tab-content.current {
	display: block;
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

.login_area {
	text-align: right;
}

.login_area input {
	width: 280px;
	height: 40px;
	background: #d44958;
	color: #fff;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	font-weight: bold;
}

table {
	border-collapse: separate;
	border-spacing: 0 15px;
}

table th {
	padding-right: 10px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h2>채용정보</h2>

		채용제목${dto.title} <br> 근무조건 기업정보

		<div id="heartLink">
			<img id="heartImg" src="/resource/img/heartempty.png">
		</div>
		<div id="demo"></div>

		<form action="applicate" method="get">
			<input type="hidden" name="postcode" value="${dto.postcode}">
			<input type="hidden" name="hid" value="<%= session.getAttribute("logged") %>">
			<input type="submit" value="즉시지원">
		</form>
		<form action="">
			<input type="button" value="스크랩">
		</form>

		<div class="container">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">상세정보</li>

				<li class="tab-link" data-tab="tab-2">기업정보</li>
			</ul>
			<div id="tab-1" class="tab-content current">
				<form action="/loginEnterprise" method="post">
					<div class="input_box">
						<table>

						</table>
					</div>
				</form>
			</div>

			<div id="tab-2" class="tab-content">
				<form action="/loginHunter" method="post">
					<div class="input_box">
						<table>

						</table>
					</div>
				</form>
			</div>
		</div>

	</section>
	<footer> </footer>

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
						} else {
							heartImg.src = "/resource/img/heartfill.png";
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