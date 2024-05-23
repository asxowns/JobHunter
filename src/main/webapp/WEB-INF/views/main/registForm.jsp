<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
ul{
	list-style: none;
}

.container {
	width: 500px;
	margin: 0 auto;
}
ul.tabs{
	display:flex;
}
ul.tabs li {
	width:250px;
	background:#fff;
	border:1px solid #ddd;
	color: #222;
	display: inline-block;
	padding: 20px 0px;
	cursor: pointer;
	text-align:center;
	font-size:18px;
	margin-bottom:30px;
}

ul.tabs li.current {
	background:#d44958;
	border:1px solid #d44958;
	color:#fff;
	font-weight:bold;
}

.tab-content {
	display: none;
}

.tab-content.current {
	display: block;
}
.input_box{
	width:500px;
}
.input_box p{
	font-weight:bold;
}
.input_box div{
	margin-bottom:10px;
}
.input_box div:nth-child(even){
	margin-bottom:20px;
}
.input_box_ent p {
	margin-bottom:10px;
}

.regbtn{
	margin-top:20px;
}
.regbtn input[type="submit"]{
	width:500px;
	height:50px;
	background:#d44958;
	border:none;
	color:#fff;
	font-size:20px;
}
input[type="text"]{
	width:100%;
	height:40px;
	border:1px solid #ddd;
	padding-left:5px;
	box-sizing:border-box;
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
.check{
	color:red;
}

/* 라디오 버튼에 텍스트를 수직 정렬 */
.radio-container label {
	vertical-align: middle;
}


.entInfo p{
	display:inline-block;
	color:#888;
	margin-bottom:15px;
	font-weight:500;
	font-size:20px;
	
}
.entInfo b{
	padding-right:10px;
	font-size:20px;
}

article{
	width:100%;
	display:flex;
	justify-content:space-between;
}
.arti1 input[type="text"]{
	width:240px;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h1>회원가입</h1>
    <div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">일반 회원가입</li>
			<li class="tab-link" data-tab="tab-2">기업 회원가입</li>
		</ul>
		
		<div id="tab-1" class="tab-content current">
			<form action="/hunterregist" method="post">
			<div class="input_box">
					<div>
						<p>이름</p>
					</div>
					<div>
						<input type="text" id="inputFieldName" name="username">
						<div id="outputDivName"></div>
					</div>
					<div>
						<p>아이디</p>
					</div>
					<div>
						<input type="text" id="inputFieldId" name="memberid"> 
						<div id="outputDivId" class="check"></div>
					</div>
					<div>
						<p>비밀번호</p>
					</div>
					<div>
						<input type="text" id = "inputFieldPw" name="password">
						<div id="outputDivPw" class="check"></div>
					</div>
					<div>
						<p>생년월일</p>
					</div>
					<div>
						<input type="text" id = "inputFieldBirth" name="birth" placeholder="ex) 2024-01-01">
					</div>
					<div>
						<p>휴대폰번호</p>
					</div>
					<div>
						<input type="text" id = "inputFieldTel" name="tel">
					</div>
					<div>
						<p>이메일</p>
					</div>
					<div>
						<p><input type="text" id = "inputFieldEmail" name="email"></p>
					</div>
					<div class="regbtn">
						<input type="submit" value="회원가입">
					</div>
				 </div>
			</form>
		</div>

		<div id="tab-2" class="tab-content">
			<form action="/enterregist" method="post">
				<div class="input_box input_box_ent">
					<div class="entInfo">
						<p><b>·</b>기업정보</p>
					</div>
					<article class="arti1">
						<div>
							<p>기업명<p>
							<input type="text" name="companyname">
						</div>
						<div>
							<p>대표자명</p>
							<input type="text" name="ceo"><br>
						</div>
					</article>
					<div>
						<p>기업전화번호</p>
						<input type="text" name="tel">
					</div>
					<article class="arti1">
						<div>
							<p>기업크기</p>
							<input type="text" name="size">
						</div>
						<div>
							<p>기업형태</p>
							<input type="text" name="corporatetype">
						</div>
					</article>
					<div>
						<p>산업</p>
						<input type="text" name="businessitem">
					</div>
					<div>
						<p>사업자등록번호</p>
						<input type="text" name="businessnumber">
					</div>
					<div>
						<p>회사주소</p>
						<input type="text" name="address">
					</div>
					<article class="arti1">
						<div>
							<p>사원수</p>
							<input type="text" name="empnum">
						</div>
						<div>
							<p>매출액</p>
							<input type="text" name="sales">
						</div>
					</article>
					<div class="entInfo">
						<p><b>·</b>담당자정보</p>
					</div>
					<article class="arti1">
						<div>
							<p>아이디</p>
							<input type="text" name="memberid">	
						</div>
						<div>
							<p>비밀번호</p>
							<input type="text" name="password">
						</div>
					</article>
					<div>
						<p>담당자 이름</p>
						<input type="text" name="managername">
					</div>
					<div>
						<p>담당자 연락처</p>
						<input type="text" name="managertel">
					</div>
					<div>
						<p>담당자 이메일</p>
						<input type="text" name="manageremail">
						<div id="outputDivId"></div>
					</div>
					<div class="regbtn">
						<input type="submit" value="회원가입">
					</div>
					 
					 
					
					
				</div>
			</form>
		</div>

	</div>
</section>
<footer>

</footer>

<script>
	const btn1 = document.querySelector("[data-tab='tab-1']");
	const btn2 = document.querySelector("[data-tab='tab-2']");
	const tabContent1 = document.getElementById("tab-1");
	const tabContent2 = document.getElementById("tab-2");
    var outputPwDiv = document.getElementById('outputDivPw');
    
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
	 

	
	document.getElementById("inputFieldId").addEventListener('blur', function(e) {
		e.preventDefault();
		var outputDivId = document.getElementById('outputDivId');
		const id = document.getElementById("inputFieldId").value;
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("outputDivId").innerHTML = this.responseText;
			}
		};
		xhttp.open("GET", "/checkId?id=" + id, true);
		xhttp.send();
    }); 
	   
	document.getElementById("inputFieldPw").addEventListener('blur', function(e) {
		e.preventDefault();
		var outputDivPw = document.getElementById('outputDivPw');
		const pw = document.getElementById("inputFieldPw").value;
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("outputDivPw").innerHTML = this.responseText;
			}
		};
		xhttp.open("GET", "/checkPw?pw=" + pw, true);
		xhttp.send();
    }); 
	    
	    
	
	
</script>
<!--  
<body>
    <h1>login</h1>
    <form action="login" method="post">
        아이디 <input type="text" id="inputFieldId" name="id"><br>
        <div id="outputDivId"></div>
        비밀번호 <input type="password" id="inputFieldPw" name="pw"><br>
        <div id="outputDivPw"></div>
        <input type="submit" value="로그인"><br>
    </form>
    <a href="signUpForm">회원가입</a>
    
    <script>
    var inputFiePw = document.getElementById('inputFieldPw');
    var outputPwDiv = document.getElementById('outputDivPw');
    
    
    document.getElementById("inputFieldId").addEventListener('blur', function() {
        var inputFieldId = document.getElementById('inputFieldId');
        var outputIdDiv = document.getElementById('outputDivId');

        if (inputFieldId.value.trim() !== "") {
            outputDivId.textContent = "사용불가";
            outputDivId.classList.add('unavailable');
        } else {
            outputDivId.textContent = "";
            outputDivId.classList.remove('unavailable');
        }
    });
    
    document.getElementById("inputFieldPw").addEventListener('blur', function() {
        var inputFieldPw = document.getElementById('inputFieldPw');
        var outputIdDivPw = document.getElementById('outputDivId');

        
        if (inputFieldPw.value.trim() !== "") {
            outputDivPw.textContent = "사용불가";
            outputDivPw.classList.add('unavailable');
        } else {
            outputDivPw.textContent = "";
            outputDivPw.classList.remove('unavailable');
        }
    });
    </script>
    -->
</body>


</html>