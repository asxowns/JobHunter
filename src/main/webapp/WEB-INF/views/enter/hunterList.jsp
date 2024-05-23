<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
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
	margin: 75px 0;
	text-align: center;
}

.search-container{
	width:900px;
	margin:0 auto;
	display:flex;
	justify-content:space-between;
	align-items:center;
	height:40px;
	border-bottom:1px solid #333;
	padding-bottom:15px;
}

.search-select-filter{
	height:auto;
}
.search-select-filter select{
	width:80px;
	height:35px;
	border:1px solid #666;
	border-radius:5px;
	padding:5px;
	color:#666;
}

h3{
	width:900px;
	margin:0 auto;
	font-size:16px;
	color:#666;
	font-weight:400;
	padding-bottom:10px;
}

.hunterList_area{
	width:900px;
	margin:0 auto;
}

.hunterList_info{
	display:flex;
	justify-content:flex-start;
	align-items:center;
	padding:30px 25px;
	border-bottom:1px solid #ddd;
}
.hunterList_info li:nth-child(1){
	font-size:22px;
	padding-right:80px;
	font-weight:bold;
}
.hunterList_info li:nth-child(2){
	font-size:16px;
	color:#777;
	padding-right:350px;
}
.hunterList_info li:nth-child(3) a{
	font-size:16px;
	padding:10px 20px;
	border:1px solid #aaa;
}
.hunterList_info li:nth-child(3) a:hover{
	background:#d44958;
	color:#fff;
	border:1px solid #d44958;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h1>인재 정보</h1>

		<h3>필터 구분</h3>
		<form id="searhForm" action="" method="get">
		<div class="search-container">
			<div class="search-select-filter">
				<select id="area" name="area_">
					<option value="">지역</option>
					<option value="서울">서울</option>
					<option value="부산">부산</option>
					<option value="경기">경기</option>
				</select>
				<select id="career" name="career_">
					<option value="">경력</option>
					<option value="신입">신입</option>
					<option value="경력">경력</option>
				</select> 
				<select id="edutype" name="edutype_">
					<option value="">학력</option>
					<option value="대졸">대졸</option>
					<option value="초대졸">초대졸</option>
					<option value="고졸">고졸</option>
				</select> 
			</div>
		</div>
	</form>

	<div class="hunterList_area">
		<c:forEach var="t" items="${talentInfo}">
		<ul class="hunterList_info">
			<li>${t.username }</li> <!-- 작업@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<li>남자 / 1994 / 대졸(4년) / 경력</li>
			<li><a href="/hunter/resumeList?hid=${t.hid }">이력서 보기</a></li>
		</ul>
		<ul class="hunterList_info">
			<li>오승헌</li>
			<li>남자 / 1992 / 대졸(4년) / 신입</li>
			<li><a href="/hunter/resumeList?hid=${t.hid}">이력서 보기</a></li>
		</ul>
		<ul class="hunterList_info">
			<li>이해창</li>
			<li>남자 / 1997 / 대졸(4년) / 경력</li>
			<li><a href="/hunter/resumeList?hid=${t.hid}">이력서 보기</a></li>
		</ul>
		<ul class="hunterList_info">
			<li>변지은</li>
			<li>여자 / 1994 / 대졸(4년) / 신입</li>
			<li><a href="/hunter/resumeList?hid=${t.hid}">이력서 보기</a></li>
		</ul>
		<ul class="hunterList_info">
			<li>이은지</li>
			<li>여자 / 1995 / 대졸(4년) / 신입</li>
			<li><a href="/hunter/resumeList?hid=${t.hid}">이력서 보기</a></li>
		</ul>
		<ul class="hunterList_info">
			<li>김동휘</li>
			<li>남자 / 1998 / 대졸(4년) / 신입</li>
			<li><a href="/hunter/resumeList?hid=${t.hid}">이력서 보기</a></li>
		</ul>
		</c:forEach>
	</div>



		<%-- <div class="container">
    <table border="1">
	    <c:forEach var="t" items="${talentInfo}">
    	<tr>
    		<td>${t.huntercode }</td>
    		<td>${t.username}</td>
    		<td>${t.gender}</td>
    		<td>${t.birth}</td>
    		<td>${t.edutype }</td>
    		<td>${t.employmenttype }</td>
    		<td><a href="/hunter/resumeList?/huntercode=${t.huntercode }"><button>이력서 보기</button></a></td>
    	</tr>
	    </c:forEach>
    </table>
    </div>	 --%>
	</section>
	<footer> </footer>

</body>
</html>