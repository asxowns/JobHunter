<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
body {
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}

.container {
	width: 500px;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	color:;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current {
	display: block;
}

input[type="radio"] {
	appearance: none; /* 기본 라디오 버튼 숨기기 */
	width: 20px; /* 원의 지름 설정 */
	height: 20px; /* 원의 지름 설정 */
	border-radius: 50%; /* 원 모양으로 만듦 */
	border: 2px solid #ccc; /* 테두리 스타일 지정 */
}

input[type="radio"] {
	position: absolute;
	opacity: 0;
}

/* 라디오 버튼 대신 사용할 스타일 지정 */
.radio-container {
	display: inline-block;
	cursor: pointer;
}

.radio-container input[type="radio"]+label {
	display: inline-block;
	width: 50px;
	height: 30px;
	border: 2px solid #ccc;
	border-radius: 4px; /* 박스의 모서리를 둥글게 만듦 */
	margin-right: 5px;
	vertical-align: middle;
}

.radio-container input[type="radio"]:checked+label {
	background-color: #007bff;
	border-color: #007bff;
}

/* 라디오 버튼에 텍스트를 수직 정렬 */
.radio-container label {
	vertical-align: middle;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> signUp page </h2>
    <div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">메뉴1</li>
			<li class="tab-link" data-tab="tab-2">메뉴2</li>
		</ul>
		<div id="tab-1" class="tab-content current">
			<h1>일반회원 signUpForm</h1>
			<form action="signUp" method="post">
				이름<input type="text" name="name"><br> 아이디<input
					type="text" name="id"><br> 비밀번호<input type="text"
					name="pw"><br>
				<div class="gender-box">
					<div class="radio-container">
						<input type="radio" id="male" name="gender" value="male">
						<label for="male">남자</label>
					</div>
					<div class="radio-container">
						<input type="radio" id="female" name="gender" value="female">
						<label for="female">여자</label>
					</div>
					<br> <input type="submit" value="회원가입"><br>
				</div>
			</form>
		</div>

		<div id="tab-2" class="tab-content">
			<h1>기업 signUpForm</h1>
			<form action="signUp" method="post">
				아이디<input type="text" name="id"><br> 비밀번호<input
					type="text" name="pw"><br> 기업명<input type="text"
					name="corname"><br> 산업군<input type="text"
					name="industryName"><br> 담당자연락처<input type="text"
					name="corTel"><br> 이메일<input type="text" name="email"><br>
				사업자등록번호<input type="text" name="corNum"><br> <input
					type="submit" value="회원가입"><br>
			</form>
		</div>

	</div>
</section>
<footer>

</footer>

</body>
<script type="text/javascript">
	const btn1 = document.querySelector("[data-tab='tab-1']");
	const btn2 = document.querySelector("[data-tab='tab-2']");
	const tabContent1 = document.getElementById("tab-1");
	const tabContent2 = document.getElementById("tab-2");

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
</script>
</html>