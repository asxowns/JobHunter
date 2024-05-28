<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이력서 수정</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	color: #333;
	background: #FFF8F8;
}

section {
	width: 1240px;
	margin: 100px auto;
	padding-bottom: 200px;
}

h1 {
	text-align: center;
	margin: 75px 0 100px;
}

.container {
	width: 800px;
	margin: 0 auto;
}

input[type="text"], input[type="date"], select {
	height: 50px;
	padding-left: 5px;
	border: 1px solid #ddd;
	box-sizing: border-box;
	color: #888;
}

#photo::-webkit-scrollbar {
	display: none;
}

.title input[type="text"] {
	width: 100%;
	height: 55px;
	font-size: 19px;
	padding-left: 10px;
}

.personal_info_title {
	font-size: 20px;
	font-weight: bold;
	padding: 38px 0 17px;
}

.personal_info {
	width: 800px;
	display: flex;
	justify-content: space-between;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	box-sizing: border-box;
}

.personal_info_content {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.personal_info_content input {
	width: 140px;
}

.personal_info_content select {
	width: 120px;
}

.personal_info_content input[name="email"] {
	width: 200px;
}

.photolabel {
	cursor: pointer;
}

input[type="date"]:valid {
	color: #333;
}

.personal_info_photo {
	position: relative;
}

input[type="file"] {
	display: none;
}

#photoFrame {
	background: #fff;
}

.photoadd {
	text-align: center;
}

.personal_info input[name="address"] {
	width: 420px;
}

.personal_info input[name="employmenttype"] {
	width: 120px;
}

select[name="military"] {
	width: 200px;
}

.education {
	width: 800px;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	box-sizing: border-box;
}

select[name="edutype"] {
	width: 120px;
}

.desiredArea {
	width: 800px;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	box-sizing: border-box;
}

.desiredArea input[type="text"] {
	width: 120px;
}

.desiredIndustry {
	width: 800px;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	box-sizing: border-box;
}

.desiredIndustry select {
	width: 200px;
}

.desiredpay {
	width: 800px;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	box-sizing: border-box;
}

.desiredpay input[type="text"] {
	width: 120px;
}

.career {
	width: 800px;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	box-sizing: border-box;
	gap: 10px;
	position:relative;
}

.career_in {
	display: flex;
	gap: 10px;
	align-items: center;
}

.cardate_text{
	position:absolute;
	top:22px;
	right:370px;
	font-size:11px;
	color:#bbb;
}
.enddate_text{
	position:absolute;
	top:22px;
	right:245px;
	font-size:11px;
	color:#bbb;
}

.career_in label::checked {
	color: #d44958;
}

input[name="working"] {
	accent-color: red;
}

.career textarea {
	width: 690px;
	height: 50px;
	padding: 5px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	line-height: 35px;
	resize: none;
}

.career input[name="companyname"] {
	width: 360px;
}

.career input[name="position"], .career input[name="job"] {
	width: 175px;
}

.career input[name="salary"], .career input[name="industry"] {
	width: 114px;
}

.resumeSkill textarea {
	width: 800px;
	padding: 10px;
	border: 1px solid #ddd;
	box-sizing: border-box;
	font-size: 18px;
	font-weight: 500;
	resize: none;
}

.certificate {
	width: 800px;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	box-sizing: border-box;
}

.certificate input[name="stack"], .certificate input[name="pulisher"] {
	width: 200px;
}

.coverLetter {
	width: 800px;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	box-sizing: border-box;
}

.coverLetter textarea {
	width: 760px;
	height: 350px;
	padding: 10px;
	border: 1px solid #ddd;
	box-sizing: border-box;
	resize: none;
	margin-bottom: 10px;
}

.coverLetter .personal_info_title {
	width: 760px;
	border: 1px solid #ddd;
	border-bottom: none;
	padding: 15px;
	padding-left: 15px;
	box-sizing: border-box;
	font-size: 17px;
}

.coverLetter textarea:last-child {
	margin-bottom: 0;
}

.public_type {
	display: flex;
	justify-content: flex-start;
	border: 1px solid #ddd;
	background: #fff;
	padding: 20px;
	font-size: 18px;
}

.public_type input {
	border: 1px solid #ddd;
	background: #fff;
}

.public_type label {
	margin-right: 20px;
}

.submit_btn {
	text-align: center;
	margin: 80px 0;
}

input[type="submit"] {
	width: 160px;
	color: #fff;
	background: #d44958;
	padding: 15px 0;
	border: 0;
	font-size: 18px;
}

.upload-name {
	width: 105px;
	height: 30px !important;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h1>이력서 수정</h1>
		<div class="container">
			<form action="/hunter/resumeUpdate?resumecode=${resume.resumecode}"
				method="post">
				<div class="title">
					<input type="text" name="title" placeholder="이력서 제목, 한줄소개"
						value="${resume.title}">
				</div>

				<!-- 인적사항 -->
				<p class="personal_info_title">인적사항</p>
				<div class="personal_info">
					<div class="personal_info_content">
						<input type="text" name="username" placeholder="이름"
							value="${hunter.username }"><input type="date"
							name="birth" value="${hunter.birth }"> <select
							name="gender">
							<option value="m"
								<c:if test="${fn:trim(hunter.gender) == 'm'}">selected</c:if>>남자</option>
							<option value="f"
								<c:if test="${fn:trim(hunter.gender) == 'f'}">selected</c:if>>여자</option>
						</select> <input type="text" name="email" placeholder="이메일"
							value="${hunter.email}"><input type="text"
							name="tel" placeholder="휴대폰번호" value="${hunter.tel}">
						<input type="text" name="tel2" placeholder="비상연락처"
							value="${hunter.tel2}"><input type="text"
							name="employmenttype" placeholder="신입or경력"
							value="${resume.employmenttype}"><select
							name="military">
							<option value="o"
								${fn:trim(hunter.military) == 'o' ? 'selected' : ''}>군필/면제/해당없음</option>
							<option value="x"
								${fn:trim(hunter.military) == 'x' ? 'selected' : ''}>미필</option>
						</select> <input type="text" name="address" placeholder="주소"
							value="${hunter.address}">
					</div>
					<div class="personal_info_photo">
						<label for="photo" class="photolabel"> <iframe
								id="photoFrame" title="photo" width="100" height="120"
								src="${resume.photourl}"></iframe> <input type="text"
							class="upload-name" placeholder="파일추가" readonly> <input
							type="file" class="file" id="photo" name="photoUrl"
							src="${resume.photourl}">
							<p class="photoadd">파일 추가</p>
						</label>
					</div>
				</div>

				<!-- 학력 -->
				<p class="personal_info_title">학력</p>
				<div class="education">
					<select name="edutype">
						<option value="초졸" ${resume.edutype == '초졸' ? 'selected' : ''}>초졸</option>
						<option value="중졸" ${resume.edutype == '중졸' ? 'selected' : ''}>중졸</option>
						<option value="고졸" ${resume.edutype == '고졸' ? 'selected' : ''}>고졸</option>
						<option value="초대졸" ${resume.edutype == '초대졸' ? 'selected' : ''}>초대졸</option>
						<option value="대졸" ${resume.edutype == '대졸' ? 'selected' : ''}>대졸</option>
						<option value="대학원" ${resume.edutype == '대학원' ? 'selected' : ''}>대학원</option>
						<option value="검정고시" ${resume.edutype == '검정고시' ? 'selected' : ''}>검정고시</option>
					</select> <input type="text" name="eduname" placeholder="학교이름"
						value="${resume.eduname}"> <input type="text"
						name="edumajor" placeholder="전공" value="${resume.edumajor}">
					<input type="date" name="graduatedate"
						value="${resume.graduatedate}">
					<!-- 졸업상태가 졸업이면 졸업년도 입력가능하게 하기 -->
					<select name="edustate">
						<option value="재학중" ${resume.edustate == '재학중' ? 'selected' : ''}>재학중</option>
						<option value="휴학" ${resume.edustate == '휴학' ? 'selected' : ''}>휴학</option>
						<option value="중퇴" ${resume.edustate == '중퇴' ? 'selected' : ''}>중퇴</option>
						<option value="졸업/졸업예정"
							${resume.edustate == '졸업/졸업예정' ? 'selected' : ''}>졸업/졸업예정</option>
						<option value="수료" ${resume.edustate == '수료' ? 'selected' : ''}>수료</option>
					</select>
				</div>

				<!-- 희망근무지역 -->
				<p class="personal_info_title">희망 근무 지역</p>
				<div class="desiredArea">
					<input type="text" name="area1" placeholder="희망 지역1"
						value="${da.area1}"> <input type="text" name="area2"
						placeholder="희망 지역2" value="${da.area2}">
						<input type="hidden" name="dacode" value="${da.dacode}"/>
				</div>

				<!-- 희망 직무(산업군) -->
				<p class="personal_info_title">희망 직무(산업군)</p>
				<div class="desiredIndustry">
					<p>
						<select name="mainCategory" class="mainSelect" 
							onchange="fetchSubList()">
							<c:forEach var="main" items="${mainList}">
								<option id="${main.mccode}" value="${main.mccode}"
									${di.mainCategory == main.mccode ? 'selected' : ''}>${main.main}</option>
							</c:forEach>
						</select> <select name="middleCategory" id="subSelect">
							<c:forEach var="sub" items="${subList }">
								<option value="${sub}"
									${di.middleCategory == sub.sub ? 'selected' : ''}>${sub.sub}</option>
							</c:forEach>
						</select>
					</p>
				</div>

				<!-- 희망 연봉 -->
				<p class="personal_info_title">희망 연봉</p>
				<div class="desiredpay">
					<input type="text" name="desiredpay" placeholder="희망연봉"
						value="${resume.desiredpay}">
				</div>

				<!-- 경력 -->
				<p class="personal_info_title">경력</p>
				<div class="career">
					<div class="career_in">
						<input type="text" name="companyname" placeholder="회사명"
							value="${c.companyname}">
							<span class="cardate_text">입사일</span>
							<input type="date" name="cardate" value="${c.cardate}">
							<span class="enddate_text">퇴사일</span>
							<input type="date" name="enddate" value="${c.enddate}">
							<label for="working">
							<input type="checkbox" id="wroking" name="working"
							${c.enddate == null ? 'checked' : ''}>
							재직중
						</label>
					</div>
					<div class="career_in">
						<input type="text" name="position" placeholder="직급/직책"	value="${c.position}">
						<input type="text" name="job" placeholder="담당직무" value="${c.job}">
						<input type="text" name="salary" placeholder="연봉" value="${c.salary}">
						<input type="text" name="industry" placeholder="산업군" value="${c.industry}">
					</div>
					<div class="career_in">
						<textarea name="work" cols="80" placeholder="담당업무">${c.work }</textarea>
					</div>
				</div>

				<!-- 기술 스택 -->
				<p class="personal_info_title">기술 스택</p>
				<div class="resumeSkill">
					<textarea name="resumeSkill" cols="100" rows="7"
						placeholder=" ex) JAVA, Python, C# ">${rs.stack}</textarea>
				</div>

				<!-- 자격증 -->
				<p class="personal_info_title">자격증</p>
				<div class="certificate">
					<div>
						<input type="text" name="stack" placeholder="자격증 명"
							value="${ctf.stack}"> <input type="text" name="pulisher"
							placeholder="발급처" value="${ctf.publisher}"> <input
							type="date" name="issuedate" value="${ctf.issuedate}">
					</div>
				</div>

				<!-- 자기 소개서 -->
				<p class="personal_info_title">자기 소개서</p>
				<div class="coverLetter" id="resumeForm">
					<div>
						<p class="personal_info_title">성장 과정</p>
						<textarea name="growth" placeholder="성장과정 기술">${cl.growth}</textarea>
						<p class="personal_info_title">지원 동기</p>
						<textarea name="motive" placeholder="지원동기 기술">${cl.motive}</textarea>
						<p class="personal_info_title">성격의 장단점</p>
						<textarea name="prosAndCons" placeholder="성격의 장˙단점 기술 ">${cl.prosAndCons}</textarea>
					</div>
				</div>

				<!-- 이력서 공개여부 -->
				<p class="personal_info_title">이력서 공개여부</p>
				<div class="public_type">
					<label for="public_type1"> <input type="radio"
						name="publictype" id="public_type1" value="1"
						${fn:trim(resume.publictype) == 'o' ? 'checked' : ''}>공개
					</label> <label for="public_type2"> <input type="radio"
						name="publictype" id="public_type2" value="0"
						${fn:trim(resume.publictype) == 'x' ? 'checked' : ''}>비공개
					</label>
				</div>

				<div class="submit_btn">
					<input type="submit" value="등록">
				</div>
			</form>
		</div>
	</section>
	<footer>

	</footer>
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

	<script>
   
   let fileInput = document.querySelector('.file');
   let nameInput = document.querySelector('.upload-name');
   fileInput.addEventListener('change', function(e){
     const input = e.target.closest('.file');
     if (!input) return;
     let fileName = input.value.split('/').pop().split('\\').pop();
     nameInput.value = fileName;
   });
   
   </script>
</body>
</html>