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
  	<dev>
  		<form>
  			<dev class="title">
  				<input type="text" name="title" value="이력서 제목 ,한줄소개">
  			</dev>
  			<dev class="personal_info">
  			<p>인적사항</p>
  			<input type="text" name="name" value="이름">
  			<input type="date" name="birth" value="생년월일">
  			<select>
  				<option value="gender">남자</option>
  				<option value="gender">여자</option>
  			</select>
  			<input type="text" name="email" value="이메일"><br>
  			<input type="text" name="tel" value="휴대폰번호">
  			<input type="text" name="emergency_contact" value="비상연락처">
  			<input type="text" name="career" value="신입or경력">
  			<input type="button" name="army" value="병역      "><br>
  			<input type="text" name="address" value="주소">
  			<iframe id="photo" title="photo" width="100" height="120" src="C:/dev/JobHunter/짱구" ></iframe>
  			<input type="file" id="photo" accept="image/*" name="photo">
  		
  			
  			
  			</dev>
  		</form>
  	</dev> 
   
</section>
<footer>

</footer>

</body>
</html>