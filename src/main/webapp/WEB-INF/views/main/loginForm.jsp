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

input[type="text"], input[type="password"]{
	width:280px;
	height:40px;
	border:1px solid #bbb;
	border-radius:10px;
	padding-left:5px;
	box-sizing:border-box;
}
.input_box{
	padding-left:20px;
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

table{
	border-collapse: separate;
  	border-spacing: 0 15px;
}
table th{
	padding-right:10px;
}

#toggleHPassword{
	position:relative;
	top:-100px;
	left:300px;
	display:none;
}
#toggleEPassword{
	position:relative;
	top:-100px;
	left:300px;
	display:none;
}
.toggleHPassword_active{
position:relative;
	top:-99px;
	left:340px;
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
			<li class="tab-link current" data-tab="tab-1">일반로그인</li>
			<li class="line">|</li>
			<li class="tab-link" data-tab="tab-2">기업로그인</li>
		</ul>
		<div id="tab-1" class="tab-content current">
			<form action="/loginHunter" method="post">
				<div class="input_box">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" id="inputFieldHid" name="id"></td>
							<div id="outputFieldHid"></div>
							
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="inputFieldHpw" name="pw"></td>
							<div id="outputFieldHpw"></div>
						</tr>
						<tr>
							<td colspan="2" class="login_area"><input type="submit" value="일반로그인"></td>
						</tr>
					</table>
				</div>
			</form>
			<label for="toggleHPassword">
							<img id ="eyeimg" src = "/resource/img/Vector.png" class="toggleHPassword_active">
					<button id="toggleHPassword">비밀번호 보기</button>
					</label>
		</div>

		<div id="tab-2" class="tab-content">
				<form action="/loginEnterprise" method="post">
					<div class="input_box">
						<table>
							<tr>
								<th>아이디</th>
								<td><input type="text"   id="inputFieldEid" name="id"><td>
								<div id="outputFieldEid"></div>
								
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" id =  "inputFieldEpw" name="pw"></td>
							</tr>
							<tr class="login_area">
								<td colspan="2"><input type="submit" value="기업로그인"></td>
							</tr>
						</table>
					</div>
				</form>
				<label for="toggleEPassword">
							<img id ="eyeimg" src = "/resource/img/Vector.png" class="toggleHPassword_active">
					<button id="toggleEPassword">비밀번호 보기</button>
					</label>
			</div>
		</div>
</section>
<footer>

</footer>

</body>
<c:if test="${not empty msg}">
    <script>
    var msg = "${msg}";
        alert(msg);
    </script>
</c:if>
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
	
	
	document.getElementById("toggleHPassword").addEventListener("click", function() {
	    var passwordField = document.getElementById("inputFieldHpw");
	    var img = document.getElementById("eyeimg")
	    if (passwordField.type === "password") {
	        passwordField.type = "text";
	        img.src = "/resource/img/Vector.png";
	        this.textContent = "비밀번호 숨기기";
	    } else {
	    	img.src = "/resource/img/eye.png";
	        passwordField.type = "password";
	        this.textContent = "비밀번호 보기";
	    }
	});
	
	
	document.getElementById("toggleEPassword").addEventListener("click", function() {
	    var passwordField = document.getElementById("inputFieldEpw");
	    var img = document.getElementById("eyeimg")
	    if (passwordField.type === "password") {
	        passwordField.type = "text";
	        img.src = "/resource/img/Vector.png";
	        this.textContent = "비밀번호 숨기기";
	    } else {
	        img.src = "/resource/img/eye.png";
	        passwordField.type = "password";
	        this.textContent = "비밀번호 보기";
	    }
	});
	
</script>
</html>