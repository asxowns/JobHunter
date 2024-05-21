<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> 이력서 등록 </h2>
  	<div>
  		<form action="/hunter/resumeWrite" method="post">
  			<div class="title">
  				<input type="text" name="title" value="이력서 제목 ,한줄소개">
  			</div>
  			<div class="personal_info">
	  			<p>인적사항</p>
	  			<input type="text" name="username" value="이름">
	  			<input type="date" name="birth" value="생년월일">
	  			<select >
	  				<option value="gender">남자</option>
	  				<option value="gender">여자</option>
	  			</select>
	  			<input type="text" name="email" value="이메일"><br>
	  			<input type="text" name="tel" value="휴대폰번호">
	  			<input type="text" name="emergency_contact" value="비상연락처">
	  			<input type="text" name="career" value="신입or경력">
	  			<input type="button" name="army" value="병역"><br>
	  			<input type="text" name="address" value="주소">
	  			<iframe id="photo" title="photo" width="100" height="120" src="C:/dev/JobHunter/짱구" ></iframe>
	  			<input type="file" id="photo" accept="image/*" name="photo">
  			</div>
  			<div class="desiredArea">
  				<input type="text" name="area1">
  				<input type="text" name="area2">
  			</div>
  			<div class="desiredIndustry">
  				<select name="industry" required size=7>
  					<option value="industry" name="industry1">
  				</select>
  			</div>
  			<input type="submit" value="등록">
  		</form>
  	</div> 
   
</section>
<footer>

</footer>

</body>
</html>