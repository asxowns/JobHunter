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

</style>
<style>

</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> login page </h2>
    <div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">기업로그인</li>
			<li class="tab-link" data-tab="tab-2">일반로그인</li>
		</ul>
		<div id="tab-1" class="tab-content current">
			<h1>기업 login</h1>
			<form action="/loginEnterprise" method="post">
				아이디<input type="text" name="id"><br> 비밀번호<input
					type="text" name="pw"><br> <input type="submit"
					value="로그인"><br>
			</form>
		</div>

		<div id="tab-2" class="tab-content">
			<h1>일반 login</h1>
				<form action="/loginHunter" method="post">
					아이디<input type="text" name="id"><br> 비밀번호<input
						type="text" name="pw"><br> <input type="submit"
						value="로그인"><br>
				</form>
			</div>
		</div>
			<a href="registForm">회원가입</a>
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
	
	 document.getElementById("loginForm").addEventListener("submit", function(event) {
	        const memberRole = '<%= (String) request.getAttribute("msg") %>';
	        if (memberRole === "일반회원이 아닙니다") {
	            event.preventDefault(); // 폼 제출 막기
	            alert("일반회원이 아닙니다"); // 알림창 표시
	        }
	    });
</script>
</html>