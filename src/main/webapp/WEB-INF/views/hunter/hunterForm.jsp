<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내정보 관리</title>
<style>
	#container{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		text-align: center;
		background-color: #d44958;
		padding: 20px;
		border-radius: 10px;
	}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h2>내정보 관리</h2>
		<div id="container">
			<form action="/hunter/saveHunterForm" method="post">
				아이디 <input type="text" name ="memberid" value="${meme.memberid}" readonly><br>
				비밀번호 <input type="password" name ="password" value="${meme.password}"><br>
				이름 <input type="text" name ="username" value="${hunter.username}"><br>
				생년월일 <input type="text" name ="birth" value="${hunter.birth}"><br>
				주소 <input type="text" name ="address" placeholder="주소를 입력해주세요." value="${hunter.address}"><br>
				<%-- 주소 value 안되어 있었음. --%>
				전화번호 <input type="text" name ="tel1" value="${hunter.tel}"><br>
				비상연락처 <input type="text" name ="tel2" placeholder="비상연락처를 입력해주세요." value="${hunter.tel2}"><br>
				<%-- 비상연락처 ( tel2 ) value 안되어 있었음 --%>
				이메일 <input type="text" name ="email" placeholder="이메일을 입력해주세요." value="${hunter.email}"><br>
				<%-- 이메일도 value 없었음 --%>
				성별 
				<c:if test="${fn:trim(hunter.gender) == 'f'}">  
					<input type="hidden" name="gender" value="f">
					<input value="여성">
				</c:if>
				<c:if test="${fn:trim(hunter.gender) == 'm'}"> 
					<input type="hidden" name="gender" value="m">
					<input value="남성">
				</c:if>
				<br>
				<input type="submit" value="수정">
			</form>
		</div>
	</section>
	<footer> </footer>

</body>
</html>