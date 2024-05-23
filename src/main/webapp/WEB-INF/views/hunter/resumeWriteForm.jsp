<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이력서 등록</title>
<style>
*{
	margin:0;
	padding:0;
}
body{
	color:#333;
	background:#FFF8F8;
}
section{
	width:1240px;
	margin:0 auto;
}
h1{
	text-align:center;
	margin:75px 0 100px;
}

.container{
	width:800px;
	margin:0 auto;
}


input[type="text"],
input[type="date"],
select{
	height:50px;
	padding-left:5px;
	border:1px solid #ddd;
	box-sizing:border-box;
}
#photo::-webkit-scrollbar{
	display:none;
}

.title input[type="text"]{
	width:100%;
	font-size:19px;
	padding-left:10px;
}
.personal_info_title{
	font-size:20px;
	font-weight:bold;
	padding:38px 0 17px;
}
.personal_info{
	width:800px;
	display:flex;
	justify-content:space-between;
	border:1px solid #ddd;
	background:#fff;
	padding:20px;
	box-sizing:border-box;
	
}
.personal_info_content{
	display:flex;
	flex-wrap:wrap;
	gap:10px;
}
.personal_info_content input{
	width:140px;
}
.personal_info_content select{
	width:120px;
}
.personal_info_content input[name="email"]{
	width:200px;
}
.photolabel{
	cursor:pointer;
}

.personal_info_photo{
	position:relative;
}
input[type="file"]{
	display:none;
}
#photoFrame{
	background:#fff;
}
.photoadd{
	text-align:center;
}
.personal_info input[name="address"]{
	width:300px;
}
.personal_info input[name="employmenttype"]{
	width:120px;
}
select[name="military"]{
	width:200px;
}

.education{
	width:800px;
	border:1px solid #ddd;
	background:#fff;
	padding:20px;
}
select[name="edutype"]{
	width:120px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h1>이력서 등록</h1>
		<div class="container">
		<!--------------------이력서 등록--------------------->
			
				<form action="sta" method="post">
					<div class="title">
						<input type="text" name="title" placeholder="이력서 제목 ,한줄소개">
					</div>
					
					<p class="personal_info_title">인적사항</p>
					<div class="personal_info">
						<div class="personal_info_content">
							<input type="text" name="username" placeholder="이름"> 
							<input type="date" name="birth"> 
							<select name="gender">
								<option value="m">남자</option>
								<option value="f">여자</option>
							</select> 
							<input type="text" name="email" placeholder="이메일"><br>
							<input type="text" name="tel" placeholder="휴대폰번호"> 
							<input type="text" name="tel2" placeholder="비상연락처">
							<input type="text" name="employmenttype" placeholder="신입or경력">
							<select name="military">
								<option value="o">군필/면제/해당없음</option>
								<option value="x">미필</option>
							</select> 
							<input type="text" name="address" placeholder="주소">
						</div>
						<div class="personal_info_photo">
							<label for="photo" class="photolabel">
								<iframe id="photoFrame" title="photo" width="100" height="120"
									src="photoUrl"></iframe>
								<input type="file" id="photo" name="photoUrl">
								<p class="photoadd">사진추가</p>
							</label>
						</div>
					</div>
					
					<div class="public_type">
						<span>이력서 공개여부</span><br> 
						<input type="radio" name="publictype" id="public_type" value="1" >공개
						<input type="radio" name="publictype" id="public_type" value="0" >비공개
					</div>
					
					<p class="personal_info_title">학력</p>
					<div class="education">
						<select name="edutype">
							<option value="초졸">초졸</option>
							<option value="중졸">중졸</option>
							<option value="고졸">고졸</option>
							<option value="초대졸">초대졸</option>
							<option value="대졸">대졸</option>
							<option value="대학원">대학원</option>
							<option value="검정고시">검정고시</option>
						</select> 
							<input type="text" name="eduname" placeholder="학교이름"> 
							<input type="text" name="edumajor" placeholder="전공"> 
							<input	 type="date" name="graduatedate">
						<!-- 졸업상태가 졸업이면 졸업년도 입력가능하게 하기 -->
						<select name="edustate">
							<option value="재학중">재학중</option>
							<option value="휴학">휴학</option>
							<option value="중퇴">중퇴</option>
							<option value="졸업/졸업예정">졸업/졸업예정</option>
							<option value="수료">수료</option>
						</select>
					</div>
					<div class="desiredArea">
						<p>희망 근무 지역</p>
						<input type="text" name="area1" placeholder="희망 지역1"> <input
							type="text" name="area2" placeholder="희망 지역2">
					</div>
					<div class="desiredIndustry">
						<p>희망 직무(산업군)</p>
						<p>
							대분류 <select name="industry" class="mainSelect" onchange="fetchSubList()">
							<option value="">대분류</option>
							<c:forEach var="main" items="${mainList}">
								<option id="${main.mccode}" value="${main.main}">${main.main}</option>
							</c:forEach>
							</select> 소분류 <select name="middleCategory" id="subSelect">
								<option value="">소분류</option>
								<c:forEach var="sub" items="${subList }">
									<option value="${sub}">${sub}</option>
								</c:forEach>
							</select>
						</p>
					</div>
					<div class="desiredpay">
						<span>희망연봉</span> <input type="text" name="desiredpay"
							placeholder="희망연봉">
					</div>
					<div class="career">
						<p>
							경력 <input type="text" name="companyname" placeholder="회사명">
							입사일 <input type="date" name="cardate"> 
							퇴사일 <input type="date" name="enddate"> 
							재직중 : <input type="checkbox" name="working"><br> 
							직급/직책<input type="text" name="position" placeholder="직급/직책"> 
							담당직무<input type="text" name="job" placeholder="담당직무"> 
							연봉<input type="text" name="salary" placeholder="연봉"> 
							산업군<input type="text" name="industry" placeholder="산업군"><br>
							담당업무<textarea name="work" cols="80">담당업무</textarea>
						</p>
					</div>
					<div class="resumeSkill">
						<p>기술 스택</p>
						<textarea name="resumeSkill" cols="100" rows="7"> ex) JAVA, Python, C# </textarea>
					</div>
					<div class="certificate">
						<p>
							자격증 <input type="text" name="stack" placeholder="자격증 명">
							발급처<input type="text" name="pulisher" placeholder="발급처"> 
							취득일 <input type="date" name="issuedate">
						</p>
					</div>
					<div class="coverLetter" id="resumeForm">
						<p>
							자기소개서 <br> 
							성장과정 : <textarea name="growth" placeholder="성장과정 기술"></textarea><br> 
							지원동기 : <textarea name="motive" placeholder="지원동기 기술"></textarea><br> 
							성격의 장˙단점 : <textarea name="prosAndCons" placeholder="성격의 장˙단점 기술 "></textarea>
						</p>
					</div>
					<input type="submit" value="등록">
				</form>
		</div>
	</section>
	<script>
      function fetchSubList() {
         var mainSelect = document.querySelector('.mainSelect');
         var selectedOption = mainSelect.options[mainSelect.selectedIndex];
         var mccode = selectedOption.id;
         fetch('/hunter/getSubList?mccode='+mccode)
         .then(response => {
            if (!response.ok) {
               throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
         })
         .then(data => {
            console.log(data); // 응답 데이터 출력
            if (!Array.isArray(data)) {
               throw new Error("Expected an array but got " + typeof data);
            }
         
            var subSelect = document.getElementById('subSelect');
               subSelect.innerHTML = ''; // 기존 옵션 삭제
      
            data.forEach(sub => {
               var option = document.createElement('option');
               option.value = sub;
               option.text = sub;
               subSelect.appendChild(option);
            });
         })
         .catch(error => console.error('Error fetching sub list:', error));
      }
   </script>
</body>
</html>