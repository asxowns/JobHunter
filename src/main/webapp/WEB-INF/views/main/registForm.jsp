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
.check{
	color:red;
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
    <h2> regist page </h2>
    <div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">메뉴1</li>
			<li class="tab-link" data-tab="tab-2">메뉴2</li>
		</ul>
		
		<div id="tab-1" class="tab-content current">
			<h1>일반회원 signUpForm</h1>
			<form action="hunterregist" method="post">
				이름<input type="text" id="inputFieldName" name="username"><br> 
				<div id="outputDivName"></div>
				
				아이디<input type="text" id="inputFieldId" name="memberid"><br> 
				<div id="outputDivId" class="check"></div>
				
				비밀번호<input type="text" id = "inputFieldPw" name="password"><br>
				<div id="outputDivPw" class="check"></div>
				
				생년월일<input type="text" id = "inputFieldBirth" name="birth"><br>
				
				휴대폰번호<input type="text" id = "inputFieldTel" name="tel"><br>

				
				이메일<input type="text" id = "inputFieldEmail" name="email"><br>
			
				 <input type="submit" value="회원가입">
			</form>
		</div>

		<div id="tab-2" class="tab-content">
			<h1>기업 signUpForm</h1>
			<form action="enterregist" method="post">
				기업명<input type="text" name="companyname"><br>
				대표자명<input type="text" name="ceo"><br>
				기업전화번호<input type="text" name="tel"><br>
				기업크기<input type="text" name="size"><br>
				기업형태<input type="text" name="corporatetype"><br>
				산업<input type="text" name="businessitem"><br>
				사업자등록번호<input type="text" name="businessnumber"><br>
				회사주소<input type="text" name="address"><br>
				사원수<input type="text" name="empnum"><br>
				매출액<input type="text" name="sales"><br>
				
				담당자정보<br>
				아이디<input type="text" name="memberid"><br>
				비밀번호<input type="text" name="password"><br>
				담당자 이름<input type="text" name="managername"><br>
				담당자 연락처<input type="text" name="managertel"><br>
				담당자 이메일<input type="text" name="manageremail"><br>
	

				<div id="outputDivId"></div>
				비밀번호<input type="text" name="pw"><br> 
				기업명<input type="text" name="corname"><br> 
				산업군<input type="text" name="industryName"><br> 
				담당자연락처<input type="text" name="corTel"><br> 
				이메일<input type="text" name="email"><br>
				<input type="submit" value="회원가입"><br>
			</form>
		</div>

	</div>
</section>
<footer>

</footer>

</body>
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
		xhttp.open("GET", "checkId?id=" + id, true);
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
		xhttp.open("GET", "checkPw?pw=" + pw, true);
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