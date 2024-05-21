<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
		body, html {
    height: 100%;
    margin: 0;
  }
  .container, h2 {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column; 
  }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> enterprisePostWriteForm page </h2>
    <br>
    	<div class="container">
	    <form action="enterprisePostWrite" method="post">
	    <input type="text" id="eid" name="eid" value="${sessionScope.logged}">
	    	<c:if test="${formType eq 'register'}">
                <h3>등록 폼</h3>
            </c:if>
            <c:if test="${formType eq 'edit'}">
                <h3>수정 폼</h3>
                <input type="hidden" id="postcode" name="postcode" value="${posting.postcode}">
            </c:if>
			<div class="input-row">
				<input type="text" id="title" name="title" placeholder="공고제목" value="${posting.title }">
			</div>
			<div class="input-row">
				<label for="headcount">채용인원</label>
				<input type="text" id="headcount" name="headcount" value="${posting.headcount }">
			</div>
			<div class="input-row">
				<label>지원자격</label>
				<input type="text" id="edutype" name="edutype" placeholder="학력" value="${posting.edutype }">
				<input type="text" id="career" name="career" placeholder="경력" value="${posting.career }">
			</div>
			<div class="input-row">
				<label>근무조건</label>
				<input type="text" id="employmenttype" name="employmenttype" placeholder="고용형태" value="${posting.employmenttype }">
				<input type="text" id="pay" name="pay" placeholder="급여" value="${posting.pay }">
				<input type="text" id="area" name="area" placeholder="근무지역" value="${posting.area }">
			</div>
			<div class="input-row">
				<label>산업군</label>
				<select id="industry-category" name="industry-category">
        		<option value="">대분류</option>
        		<option value="agriculture">01.사업관리</option>
        		<option value="mining">02.경영·회계·사무</option>
        		<option value="manufacturing">03.금융·보험</option>
        		<option value="utilities">04.교육·자연·사회과학</option>
        		<option value="construction">05.법률·경찰·소방·교도·국방</option>
        		<option value="trade">06.보건·의료</option>
        		<option value="transportation">07.사회복지·종교</option>
        		<option value="accommodation">08.문화·예술·디자인·방송<option>
        		<option value="it">09.운전·운송</option>
        		<option value="finance">10.영업판매</option>
        		<option value="real-estate">11.경비·청소</option>
        		<option value="professional-services">12.이용·숙박·여행·오락·스포츠</option>
        		<option value="administrative-services">13.음식서비스</option>
        		<option value="public-administration">14.건설</option>
       		 	<option value="education">15.기계</option>
        		<option value="healthcare">16.재료</option>
        		<option value="arts">17.화학·바이오</option>
        		<option value="arts">18.섬유·의복</option>
        		<option value="arts">19.전기·전자</option>
        		<option value="arts">20.정보통신</option>
        		<option value="arts">21.식품가공</option>
        		<option value="arts">22.인쇄·목재·가구·공예</option>
        		<option value="arts">23.환경·에너지·안전</option>
        		<option value="other-services">24.농림어업</option>
    			</select>
			</div>
			<div class="input-row">
				<label>직무</label>
				<select id="job" name="job">
        		<option value="">분류</option>
        		<option value="agriculture">01.사업관리</option>
        		<option value="mining">02.경영·회계·사무</option>
        		<option value="manufacturing">03.금융·보험</option>
        		<option value="utilities">04.교육·자연·사회과학</option>
        		<option value="construction">05.법률·경찰·소방·교도·국방</option>
        		<option value="trade">06.보건·의료</option>
        		<option value="transportation">07.사회복지·종교</option>
        		<option value="accommodation">08.문화·예술·디자인·방송<option>
        		<option value="it">09.운전·운송</option>
        		<option value="finance">10.영업판매</option>
        		<option value="real-estate">11.경비·청소</option>
        		<option value="professional-services">12.이용·숙박·여행·오락·스포츠</option>
        		<option value="administrative-services">13.음식서비스</option>
        		<option value="public-administration">14.건설</option>
       		 	<option value="education">15.기계</option>
        		<option value="healthcare">16.재료</option>
        		<option value="arts">17.화학·바이오</option>
        		<option value="arts">18.섬유·의복</option>
        		<option value="arts">19.전기·전자</option>
        		<option value="arts">20.정보통신</option>
        		<option value="arts">21.식품가공</option>
        		<option value="arts">22.인쇄·목재·가구·공예</option>
        		<option value="arts">23.환경·에너지·안전</option>
        		<option value="other-services">24.농림어업</option>
    			</select>
			</div>
			<div class="input-row">
				<label>마감일</label>
				<input type="text" id="deadline" name="deadline" placeholder="마감일" value="${posting.deadline }">
			</div>
			<div class="input-row">
				<label>담당자 번호</label>
				<input type="text" id="managertel" name="managertel" placeholder="번호" value="${posting.managertel }">
			</div>
			<div class="input-row">
				<label>파일 업로드</label>
				<input type="file" id="mainurl" name="mainurl" value="${posting.mainurl }">
			</div>
			<div class="input-row">
				<label>상세요강</label>
				<input type="text" id="maincontent" name="maincontent" value="${posting.maincontent }">
			</div>
			 <input type="submit" value="<c:choose><c:when test="${formType eq 'register'}">등록하기</c:when> <c:otherwise>수정하기</c:otherwise> </c:choose>">
		</form>
	</div>
    </form>
</section>
<footer>

</footer>

</body>
</html>