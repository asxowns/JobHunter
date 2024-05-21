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
		<h2>이력서 등록</h2>
		<div>
			<form action="/hunter/resumeWrite" method="post">
				<div class="title">
					<input type="text" name="title" value="이력서 제목 ,한줄소개">
				</div>
				<div class="personal_info">
					<p>인적사항</p>
					<input type="text" name="username" value="이름"> 
					<input type="date" name="birth" value="생년월일"> 
					<select>
						<option value="gender">남자</option>
						<option value="gender">여자</option>
					</select> 
						<input type="text" name="email" value="이메일"><br> 
						<input type="text" name="tel" value="휴대폰번호"> 
						<input type="text" name="emergency_contact" value="비상연락처"> <input type="text"
						name="career" value="신입or경력"> 
						<input type="button" name="army" value="병역"><br>
						<input type="text"	name="address" value="주소">
						<iframe id="photo" title="photo" width="100" height="120"
						src="C:/dev/JobHunter/짱구"></iframe>
						<!-- 짱구 사진 대신에 사용자가 넣는 파일 경로를 src에 넣어야함 -->
						<input type="file" id="photo" accept="image/*" name="photo">
				</div>
				<div class="education">
					<p>학력</p>
					학교구분<select name="education">
						<option value="school">초졸</option>
						<option value="school">중졸</option>
						<option value="school">고졸</option>
						<option value="school">초대졸</option>
						<option value="school">대졸</option>
						<option value="school">검정고시</option>
					</select> 
						<input type="text" name="schoolName" value="학교이름"> 
						<input type="text" name="major" value="전공"> 
						<input type="date" name="schoolName" value="졸업년도">
						<!-- 졸업상태가 졸업이면 졸업년도 입력가능하게 하기 -->
					<p>졸업상태</p>	
					<select>
						<option value="초졸">
						<option value="중졸">
						<option value="고졸">
						<option value="초대졸">
						<option value="대졸">
						<option value="대학원-석사">
						<option value="대학원-박사">
					</select>
				</div>
				<div class="desiredArea">
					<p>희망 근무 지역</p>
					<input type="text" name="area1" value="희망 지역1"> <input
						type="text" name="area2" value="희망 지역2">
				</div>
				<div class="desiredIndustry">
					<p>희망 직무(산업군)</p>
					<p>대분류</p>
					<select name="industry" class="mainSelect" required size="10"
						onchange="fetchSubList()">
						<c:forEach var="main" items="${mainList}">
							<option id="${main.mccode}" value="${main.main}">${main.main}</option>
						</c:forEach>
					</select>

					<p>소분류</p>
					<select id="subSelect">
						<c:forEach var="sub" items="${subList }">
							<option value="${sub}">${sub}</option>
						</c:forEach>
					</select>

				</div>
				<div class="career">
					<p>경력</p>
					<input type="text" name="companyname" value="회사명"> <input
						type="date" name="cardate" value="입사년월"> <input
						type="date" name="enddate" value="퇴사년월"> <input
						type="checkbox" name="working" value="재직중"><br> <input
						type="text" name="position" value="직급/직책"> <input
						type="text" name="job" value="담당직무"> <input type="text"
						name="salary" value="연봉"> <input type="text"
						name="industry" value="산업군"><br>
					<textarea name="work" cols="80">담당업무</textarea>

				</div>
				<div class="resumeSkill">
					<p>기술 스택</p>
					<textarea name="resumeSkill" cols="100" rows="7">내가 선택한 기술</textarea>
				</div>
				<div class="certificate">
					<p>자격증</p>
					<input type="text" name="certificate" value="자격증 명"> <input
						type="text" name="issuer" value="발행처"> <input type="date"
						name="optaindate" value="발행년도">
				</div>
				<div class="coverLetter">
					<p>자기소개서</p>
					<input type="text" name="certificate" value="항목 제목을 입력해주세요."><br>
					<input type="text" name="issuer" value="항목 내용을 입력해주세요."> 
					<input type="button" onclick="addCoverLetter()" name="addCoverLetter"
						value="추가">
					<!-- 클릭했을 때 자소서가 더 생기는 이벤트 넣기 -->
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