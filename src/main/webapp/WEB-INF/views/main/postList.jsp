<%@page import="com.green.jobhunter.entity.Posting"%>
<%@page import="java.util.List"%>
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
.search-container {
	display: flex;
	align-items: center;
	justify-content: flex-end;
}

#search {
	margin-left: auto;
	margin-right: 5px; /* 원하는 간격으로 조정 */
}

.search-container {
	display: flex;
	align-items: center;
	justify-content: flex-end;
}

#search {
	padding-right: 25px; /* 돋보기 아이콘을 위한 오른쪽 패딩 */
	margin-right: 10px; /* 검색 입력 필드와 아이콘 사이의 간격 조정 */
}

#search-button {
	position: relative; /* 상대 위치 설정 */
	background: url('search-icon.png') no-repeat; /* 돋보기 아이콘 이미지 */
	background-size: 20px; /* 아이콘 크기 조절 */
	width: 20px; /* 아이콘 너비 */
	height: 20px; /* 아이콘 높이 */
	border: none; /* 버튼 스타일 초기화 */
	cursor: pointer; /* 포인터 커서 설정 */
	margin-left: -25px; /* 검색 입력 필드와 아이콘 사이의 간격 조정 */
}

.post_area {
	width: 1240px;
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
	gap: 40px;
}

.post_box {
	width: 280px;
	height: 350px;
	background: #fff;
	border: 1px solid #eee;
	box-sizing: border-box;
}

.post_img {
	height: 150px;
	background: red;
}

.post_info {
	height: 200px;
	background: #eee;
}
</style>

</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h1>this is postList page</h1>
		<h1>공고리스트</h1>
		<h2>추천공고</h2>
		<a href="" style="margin-right: 5px;">1</a><a href=""
			style="margin-right: 5px;">2</a><a href="" style="margin-right: 5px;">3</a><a
			href="" style="margin-right: 5px;">4</a> <br> <span
			style="border-right: 1px solid gray; padding-right: 5px;">직무
			전체</span> <span>직무를 선택해주세요</span> <br>


		<form action="searchMain3Region" id="searchForm" method="get">
			<select name="area" id="area">
				<option value="">지역</option>
				<option value="seoul">서울</option>
				<option value="busan">부산</option>
				<option value="kyounggi">경기</option>
			</select> <select name="career" id="career">
				<option value="">경력</option>
				<option value="new">신입</option>
				<option value="twoyear">2년차</option>
			</select> <select name="edutype" id="edutype">
				<option value="">학위</option>
				<option value="bachelor">대졸</option>
				<option value="highschool">고졸</option>
			</select> <input type="text" name="companyname"> <input type="submit"
				value="검색">
		</form>







		<div class="search-container">
			<select id="region" name="region">
				<option value="">지역</option>
				<option value="region1">서울</option>
				<option value="region2">경기</option>
				<option value="region3">부산</option>
			</select> <select id="region" name="region">
				<option value="">경력</option>
				<option value="region1">신입</option>
				<option value="region2">2년이상</option>
				<option value="region3">5년이상</option>
			</select> <select id="region" name="region">
				<option value="">학력</option>
				<option value="region1">대졸</option>
				<option value="region2">초대졸</option>
				<option value="region3">고졸</option>
			</select> <input type="text" id="search" name="search"
				placeholder="기업명 공고명 검색"> <input type="submit"
				id="search-button" value="">
		</div>
		<hr>
		<article class="post_area">
			<c:forEach var="dto" items="${list}">
				<div class="post_box">
					<a href="postDetail?postcode=${dto.postcode}">
						<div class="post_img">
							<img src="">
						</div>
						<div class="post_info">
							<h4>${dto.title }</h4>
							<h4>${dto.job }</h4>
							<h4>${dto.area }</h4>
							<h4>${dto.career }</h4>
							<h4>${dto.edutype }</h4>
							<p>
								<span>asd</span><span>asd</span>
							</p>
						</div>
						<div>
							<b>날짜</b>
						</div>
					</a>
				</div>
			</c:forEach>
		</article>



	</section>
	<footer> </footer>

</body>
<script>
	window.addEventListener("load", function() {
		var selectedRegion = "${param.region}"; // 서블릿에서 전달된 region 파라미터 값
		if (selectedRegion) {
			document.getElementById("region").value = selectedRegion;
		}

		var selectedCareer = "${param.career}"; // 서블릿에서 전달된 career 파라미터 값
		if (selectedCareer) {
			document.getElementById("career").value = selectedCareer;
		}

		var selectedDegree = "${param.degree}"; // 서블릿에서 전달된 degree 파라미터 값
		if (selectedDegree) {
			document.getElementById("degree").value = selectedDegree;
		}

		// select 요소의 변경 이벤트 처리
		document.getElementById("region").addEventListener("change",
				function() {
					// 서블릿 호출을 위해 form을 submit
					document.getElementById("searchForm").submit();
				});

		document.getElementById("career").addEventListener("change",
				function() {
					// 서블릿 호출을 위해 form을 submit
					document.getElementById("searchForm").submit();
				});

		document.getElementById("degree").addEventListener("change",
				function() {
					// 서블릿 호출을 위해 form을 submit
					document.getElementById("searchForm").submit();
				});
	});
</script>

</html>