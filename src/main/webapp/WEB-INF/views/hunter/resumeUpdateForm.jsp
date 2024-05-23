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
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<div class="container">
			<h2>이력서 수정</h2>
			<br>
			<form action="/hunter/resumeWrite" method="post">
				<div class="title">
					<input type="text" name="title" placeholder="이력서 제목 ,한줄소개"
						value="${resume.title }">
				</div>
				<div class="personal_info">
					<p>인적사항</p>
					<input type="text" name="username" placeholder="이름"
						value="${resume.username }"> 생년월일<input type="date"
						name="birth" value="${resume.birth }"> <select
						name="gender">
						<option value="m">남자</option>
						<option value="f">여자</option>
					</select> <input type="text" name="email" placeholder="이메일"
						value="${hunter.email}"><br> <input type="text"
						name="tel1" placeholder="휴대폰번호" value="${hunter.tel1}"> <input
						type="text" name="tel2" placeholder="비상연락처" value="${hunter.tel2}">
					<input type="text" name="newOrExp" placeholder="신입or경력"
						value="${hunter.newOrExp}"> <select name="military">
						<option value="o">군필/면제/해당없음</option>
						<option value="x">미필</option>
					</select> <input type="text" name="address" placeholder="주소"
						value="${hunter.address}">
					<iframe id="photo" title="photo" width="100" height="120"
						src="photoUrl"></iframe>
					<input type="file" id="photo" name="photoUrl">
				</div>
				<div class="public_type">
					<span>이력서 공개여부</span><br> <input type="radio"
						name="public_type" id="public_type" value="1"> <label
						for="private">공개</label> <input type="radio" name="public_type"
						id="public_type" value="0"> <label for="private">비공개</label>
				</div>
				<div class="education">
					학력 <br> 학력 구분 <select name="education">
						<option value="초졸">초졸</option>
						<option value="중졸">중졸</option>
						<option value="고졸">고졸</option>
						<option value="초대졸">초대졸</option>
						<option value="대졸">대졸</option>
						<option value="대학원">대학원</option>
						<option value="검정고시">검정고시</option>
					</select> <input type="text" name="eduname" placeholder="학교이름"
						value="${resume.address}"> <input type="text" name="major"
						placeholder="전공"> 졸업년도<input type="date" name="schoolName"
						value=${hunter.address}>
					<!-- 졸업상태가 졸업이면 졸업년도 입력가능하게 하기 -->
					<p>학력 상태</p>
					<select name="edu_state">
						<option value="재학중">재학중</option>
						<option value="휴학">휴학</option>
						<option value="중퇴">중퇴</option>
						<option value="졸업/졸업예정">졸업/졸업예정</option>
						<option value="수료">수료</option>
					</select>
				</div>
				<div class="desiredArea">
					<p>희망 근무 지역</p>
					<input type="text" name="area1" placeholder="희망 지역1"
						value="${da.address}"> <input type="text" name="area2"
						placeholder="희망 지역2" value="${da.address}">
				</div>
				<div class="desiredIndustry">
					<p>희망 직무(산업군)</p>
					<p>
						대분류 <select name="industry" class="mainSelect" required size="10"
							onchange="fetchSubList()">
							<c:forEach var="main" items="${mainList}">
								<option id="${main.mccode}" value="${di.main}">${di.main}</option>
							</c:forEach>
						</select> 소분류 <select name="middleCategory" id="subSelect">
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
						경력 <input type="text" name="companyname" placeholder="회사명"
							value="${c.companyname}"> 입사일 <input type="date"
							name="cardate" value="${c.cardate}"> 퇴사일 <input
							type="date" name="enddate" value="${c.enddate}"> 재직중 : <input
							type="checkbox" name="working" value=${c.working}><br>
						<input type="text" name="position" placeholder="직급/직책"
							value="${c.working}"> <input type="text" name="job"
							placeholder="담당직무" value="${c.job}"> <input type="text"
							name="salary" placeholder="연봉" value="${c.salary}"> <input
							type="text" name="industry" placeholder="산업군"
							value="${c.industry}"><br>
						<textarea name="work" cols="80">담당업무 ${c.work }</textarea>
					</p>
				</div>
				<div class="resumeSkill">
					<p>기술 스택</p>
					<textarea name="resumeSkill" cols="100" rows="7"> ex) JAVA, Python, C# </textarea>
				</div>
				<div class="certificate">
					<p>
						자격증 <input type="text" name="stack" placeholder="자격증 명"
							value="${ctf.stack}"> <input type="text" name="issuer"
							placeholder="발급처" value="${ctf.issuer}"> 취득일 <input
							type="date" name="optaindate" value="${ctf.optaindate}">
					</p>
				</div>
				<div class="coverLetter" id="resumeForm">
					<p>
						자기소개서 <br> 성장과정 : <input type="text" name="growth"
							placeholder="성장과정 기술" value="${cl.growth}"><br> 지원동기
						: <input type="text" name="motive" placeholder="지원동기 기술"
							value="${cl.motive}"> <br> 성격의 장˙단점 : <input
							type="text" name="prosAndCons" placeholder="성격의 장˙단점 기술 "
							value="${cl.prosAndCons}">
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