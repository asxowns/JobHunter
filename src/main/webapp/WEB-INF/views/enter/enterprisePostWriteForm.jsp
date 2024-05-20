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
			<div class="input-row">
				<input type="text" id="title" name="title" placeholder="공고제목">
			</div>
			<div class="input-row">
				<label for="headcount">채용인원</label>
				<input type="text" id="headcount" name="headcount">
			</div>
			<div class="input-row">
				<label>지원자격</label>
				<input type="text" id="edutype" name="edutype" placeholder="학력">
				<input type="text" id="career" name="career" placeholder="경력">
			</div>
			<div class="input-row">
				<label>근무조건</label>
				<input type="text" id="employmenttype" name="employmenttype" placeholder="고용형태">
				<input type="text" id="pay" name="pay" placeholder="급여">
				<input type="text" id="area" name="area" placeholder="근무지역">
			</div>
			<div class="input-row">
				<label>산업군</label>
				<input type="text" id="industry" name="industry">
			</div>
			<div class="input-row">
				<label>직무</label>
				<input type="text" id="job" name="job">
			</div>
			<div class="input-row">
				<label>마감일</label>
				<input type="text" id="deadline" name="deadline" placeholder="마감일">
			</div>
			<div class="input-row">
				<label>담당자 번호</label>
				<input type="text" id="managertel" name="managertel" placeholder="번호">
			</div>
			<div class="input-row">
				<label>상세요강</label>
				<input type="text" id="maincontent" name="maincontent">
			</div>
			<input type="submit" value="등록하기">
		</form>
	</div>
    </form>
</section>
<footer>

</footer>

</body>
</html>