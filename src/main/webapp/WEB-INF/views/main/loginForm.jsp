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
	color:#333;
}
ul{
	list-style: none;
}

section{
	width:1240px;
	margin:73px auto 100px;
}
h1{
	font-size:24px;
	text-align:center;
	margin-bottom:105px;
}
.container {
	width: 500px;
	margin: 0 auto;
}

ul.tabs {
	text-align:center;
	margin-bottom:30px;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding:0px 10px;
	cursor: pointer;
}
.tabs .line{
	color:#333;
}

ul.tabs li.current {
	color:#d44958;
	font-weight:bold;
}

.tab-content {
	display: none;
	padding: 15px;
}

.tab-content.current {
	display: block;
}

input[type="text"]{
	width:280px;
	height:40px;
	border:1px solid #bbb;
	border-radius:10px;
	padding-left:5px;
	box-sizing:border-box;
}
.input_box{
	padding-left:30px;
}
tr{
	margin-bottom:15px;
}
.login_area{
	text-align:right;
}
.login_area input{
	width:280px;
	height:40px;
	background:#d44958;
	color:#fff;
	border:none;
	border-radius:10px;
	font-size:16px;
	font-weight:bold;
}


</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h1>로그인</h1>
    <div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">기업로그인</li>
			<li class="line">|</li>
			<li class="tab-link" data-tab="tab-2">일반로그인</li>
		</ul>
		<div id="tab-1" class="tab-content current">
			<form action="/loginEnterprise" method="post">
				<div class="input_box">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="text" name="pw"></td>
						</tr>
						<tr>
							<td colspan="2" class="login_area"><input type="submit" value="기업로그인"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>

		<div id="tab-2" class="tab-content">
				<form action="/loginHunter" method="post">
					<div class="input_box">
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id"><td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="text" name="pw"></td>
							</tr>
							<tr class="login_area">
								<td colspan="2"><input type="submit" value="일반로그인"></td>
							</tr>
						</table>
					</div>
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
	
	 document.getElementById("loginForm").addEventListener("submit", function(event) {
	        const memberRole = '<%= (String) request.getAttribute("msg") %>';
	        if (memberRole === "일반회원이 아닙니다") {
	            event.preventDefault(); // 폼 제출 막기
	            alert("일반회원이 아닙니다"); // 알림창 표시
	        }
	    });
</script>
</html>