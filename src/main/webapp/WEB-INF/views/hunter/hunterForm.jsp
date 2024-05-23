<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내정보 관리</title>
<style>
* {
	margin: 0;
	padding: 0;
}

section {
	width: 1240px;
	margin: 0 auto;
}

h1 {
	text-align: center;
	margin:75px 0;
}

#container{
	width:500px;
	margin:0 auto;
}
input[type="text"],
input[type="password"],
input[type="submit"]{
	width:500px;
	height:40px;
	border:1px solid #ddd;
	padding-left:5px;
	box-sizing:border-box;
}
#container div{
	margin-bottom:10px;
}
#container div p{
	font-weight:bold;
}

input[type="submit"]{
	background:#d44958;
	color:#fff;
	border:0;
	font-size:20px;
	height:50px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h1>내 정보 관리</h1>
		<div id="container">
			<form action="/hunter/saveHunterForm" method="post">
				<div>
					<p>아이디</p>
				</div>
				<div>
					<input type="text" name="memberid" value="${meme.memberid}"
						readonly>
				</div>
				<div>
					<p>비밀번호</p>
				</div>
				<div>
					<input type="password" name="password" value="${meme.password}">
				</div>
				<div>
					<p>이름</p>
				</div>
				<div>
					<input type="text" name="username" value="${hunter.username}">
				</div>
				<div>
					<p>생년월일</p>
				</div>
				<div>
					<input type="text" name="birth" value="${hunter.birth}">
				</div>
				<div>
					<p>주소</p>
				</div>
				<div>
					<input type="text" name="address" placeholder="주소를 입력해주세요."
						value="${hunter.address}">
					<%-- 주소 value 안되어 있었음. --%>
				</div>
				<div>
					<p>전화번호</p>
				</div>
				<div>
					<input type="text" name="tel1" value="${hunter.tel}">
				</div>
				<div>
					<p>비상연락처</p>
				</div>
				<div>
					<input type="text" name="tel2" placeholder="비상연락처를 입력해주세요."
						value="${hunter.tel2}">
					<%-- 비상연락처 ( tel2 ) value 안되어 있었음 --%>
				</div>
				<div>
					<p>이메일</p>
				</div>
				<div>
					<input type="text" name="email" placeholder="이메일을 입력해주세요."
						value="${hunter.email}">
					<%-- 이메일도 value 없었음 --%>
				</div>
				<div>
					<p>성별</p>
				</div>
				<div>
					<c:if test="${fn:trim(hunter.gender) == 'f'}">
						<input type="hidden" name="gender" value="f">
						<input value="여성">
					</c:if>
					<c:if test="${fn:trim(hunter.gender) == 'm'}">
						<input type="hidden" name="gender" value="m">
						<input value="남성">
					</c:if>
				</div>
				<div>
					<input type="submit" value="수정">
				</div>
			</form>
		</div>
	</section>
	<footer> </footer>

</body>
</html>