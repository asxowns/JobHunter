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
			<form action="/hunter/resumeUpdate" method="post">
				<div class="title">
					<input type="text" name="title" placeholder="이력서 제목 ,한줄소개"
						value="${resume.title}">
				</div>
				<div class="personal_info">
					<p>인적사항</p>
					<input type="text" name="username" placeholder="이름"
						value="${hunter.username }"> 생년월일<input type="date"
						name="birth" value="${hunter.birth }"> 
					<select name="gender">
						<option value="m" ${hunter.gender == 'm' ? 'selected' : '' }>남자</option>
						<option value="f" ${hunter.gender == 'f' ? 'selected' : ''}>여자</option>
					</select> 
					<input type="text" name="email" placeholder="이메일" value="${hunter.email}"><br> 
					<input type="text" name="tel1" placeholder="휴대폰번호" value="${hunter.tel1}"> <br>
					<input type="text" name="tel2" placeholder="비상연락처" value="${hunter.tel2}"><br>
					<input type="text" name="newOrExp" placeholder="신입or경력" value="${hunter.newOrExp}"><br>
					<select name="military">
						<option value="o"  ${hunter.military == 'o' ? 'selected' : ''}>군필/면제/해당없음</option>
						<option value="x" ${hunter.military == 'x' ? 'selected' : ''}>미필</option>
					</select> 
						<input type="text" name="address" placeholder="주소"	value="${hunter.address}">
					<iframe id="photo" title="photo" width="100" height="120"
						src="${hunter.photoUrl}"></iframe>
					<input type="file" id="photo" name="photoUrl" src="${hunter.photoUrl}">
				</div>
				<div class="public_type">
					<span>이력서 공개여부</span><br> 
					<input type="radio" name="public_type" id="public_type" value="1" ${resume.public_type == 1 ? 'checked' : ''}>공개
					<input type="radio" name="public_type" id="public_type" value="0" ${resume.public_type == 0 ? 'checked' : ''}>비공개
				</div>
				<div class="education">
					학력 <br> 학력 구분 
					<select name="education">
						<option value="초졸" ${resume.education == '초졸' ? 'selected' : ''}>초졸</option>
						<option value="중졸" ${resume.education == '중졸' ? 'selected' : ''}>중졸</option>
						<option value="고졸" ${resume.education == '고졸' ? 'selected' : ''}>고졸</option>
						<option value="초대졸" ${resume.education == '초대졸' ? 'selected' : ''}>초대졸</option>
						<option value="대졸" ${resume.education == '대졸' ? 'selected' : ''}>대졸</option>
						<option value="대학원" ${resume.education == '대학원' ? 'selected' : ''}>대학원</option>
						<option value="검정고시" ${resume.education == '검정고시' ? 'selected' : ''}>검정고시</option>
					</select> 
						학교이름<input type="text" name="eduname" placeholder="학교이름" value="${resume.eduname}"> 
						전공<input type="text" name="major" placeholder="전공" value="${resume.major}"> 
						졸업년도<input type="date" name="graduatedate" value="${resume.graduatedate}">
					<!-- 졸업상태가 졸업이면 졸업년도 입력가능하게 하기 -->
					<p>학력 상태</p>
					<select name="edustate">
						<option value="재학중" ${resume.edustate == '재학중' ? 'selected' : ''}>재학중</option>
						<option value="휴학" ${resume.edustate == '휴학' ? 'selected' : ''}>휴학</option>
						<option value="중퇴" ${resume.edustate == '중퇴' ? 'selected' : ''}>중퇴</option>
						<option value="졸업/졸업예정" ${resume.edustate == '졸업/졸업예정' ? 'selected' : ''}>졸업/졸업예정</option>
						<option value="수료" ${resume.edustate == '수료' ? 'selected' : ''}>수료</option>
					</select>
				</div>
				<div class="desiredArea">
					<p>희망 근무 지역</p>
					<input type="text" name="area1" placeholder="희망 지역1" value="${da.area1}">
					<input type="text" name="area2"	placeholder="희망 지역2" value="${da.area2}">
				</div>
				<div class="desiredIndustry">
					<p>희망 직무(산업군)</p>
					<p>
						대분류 <select name="industry" class="mainSelect" required size="10" onchange="fetchSubList()">
							<c:forEach var="main" items="${mainList}">
								<option id="${mainList.mccode}" value="${mainList.mccode}" ${di.mainCategory == mainList.mccode ? 'selected' : ''}>${mainList.main}</option>
							</c:forEach>
						</select> 
						소분류 <select name="middleCategory" id="subSelect">
							<c:forEach var="sub" items="${subList }">
								<option value="${sub}" ${di.middleCategory == mainList.mccode ? 'selected' : ''}>${subList.sub}</option>
							</c:forEach>
						</select>
					</p>
				</div>
				<div class="desiredpay">
					<span>희망연봉</span> 
					<input type="text" name="desiredpay" placeholder="희망연봉" value="${resume.desiredpay}">
				</div>
				<div class="career">
					<p>
						경력 <input type="text" name="companyname" placeholder="회사명"
							value="${c.companyname}"> 
						입사일 <input type="date"	name="cardate" value="${c.cardate}"> 
						퇴사일 <input type="date" name="enddate" value="${c.enddate}"> 
						재직중 : <input type="checkbox" name="working" value=${c.working? 'checked' : ''}><br>
						직급/직책<input type="text" name="position" placeholder="직급/직책" value="${c.position}">
						담당직무<input type="text" name="job" placeholder="담당직무" value="${c.job}"> 
						연봉<input type="text" name="salary" placeholder="연봉" value="${c.salary}"> 
						산업군<input type="text" name="industry" placeholder="산업군" value="${c.industry}"><br>
						담당업무<textarea name="work" cols="80">${c.work }</textarea>
					</p>
				</div>
				<div class="resumeSkill">
					<p>기술 스택</p>
					<textarea name="resumeSkill" cols="100" rows="7">${rs.skills}</textarea>
				</div>
				<div class="certificate">
					<p>
						자격증 <input type="text" name="stack" placeholder="자격증 명" value="${ctf.stack}"> 
						발급처<input type="text" name="issuer" placeholder="발급처" value="${ctf.issuer}"> 
						취득일 <input type="date" name="optaindate" value="${ctf.optaindate}">
					</p>
				</div>
				<div class="coverLetter" id="resumeForm">
					<p>
						자기소개서 <br> 
						성장과정 <textarea name="growth" placeholder="성장과정 기술">${cl.growth}</textarea><br> 
						지원동기 <textarea name="motive" placeholder="지원동기 기술">${cl.motive}</textarea><br> 
						성격의 장˙단점 : <textarea name="prosAndCons" placeholder="성격의 장˙단점 기술 ">{cl.prosAndCons}</textarea>
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