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
* {
	margin: 0;
	padding: 0;
}

body {
	color: #333;
	font-size: 16px;
}

a {
	text-decoration: none;
}

ul {
	list-style: none;
}

section {
	width: 1240px;
	margin: 150px auto;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>

	<section>
		<h2>추천공고</h2>
		<a href="">1</a> <a href="">2</a> <a href="">3</a> <a href="">4</a><br>
		<span>직무전체</span> <span>직무를 선택해주세요</span><br>







		<form id="searhForm" action="searchFilter" method="post">
			<div class="search-container">
				<select id="area" name="area_">
					<option value="">지역</option>
					<option value="seoul">서울</option>
					<option value="busan">부산</option>
				</select> <select id="career" name="career_">
					<option value="">경력</option>
					<option value="new">신입</option>
					<option value="twoyear">2년이상</option>
				</select> <select id="edutype" name="edutype_">
					<option value="">학력</option>
					<option value="uni">대졸</option>
					<option value="high">고졸</option>
				</select> <input type="text" id="search" name="companyname_"
					placeholder="기업명 공고명 검색"> <input type="submit"
					id="search-button" value="검색">
			</div>
		</form>
		<hr>
		<article class="post_area">
			<c:forEach var="dto" items="${list1}" varStatus="status">
				<div class="post_box">
					<a
						href="postDetail?postcode=${dto.postcode}&posteid=${dto.eid.memberid}">
						<div class="post_img">
							<img src="">
						</div>
						<div class="post_info">

							<h4>${list2.get(status.index).companyname}</h4>
							<h4>${dto.title }</h4>
							<h4>${dto.job }</h4>
							<h4>${dto.area }</h4>
							<h4>${dto.career }</h4>
							<h4>${dto.edutype }</h4>
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
		var selectedRegion = "${param.area_}"; // 서블릿에서 전달된 region 파라미터 값
		if (selectedRegion) {
			document.getElementById("area").value = selectedRegion;
		}

		var selectedCareer = "${param.career_}"; // 서블릿에서 전달된 career 파라미터 값
		if (selectedCareer) {
			document.getElementById("career").value = selectedCareer;
		}

		var selectedDegree = "${param.edutype_}"; // 서블릿에서 전달된 degree 파라미터 값
		if (selectedDegree) {
			document.getElementById("edutype").value = selectedDegree;
		}

		// select 요소의 변경 이벤트 처리
		document.getElementById("area").addEventListener("change", function() {
			// 서블릿 호출을 위해 form을 submit
			document.getElementById("searhForm").submit();
		});

		document.getElementById("career").addEventListener("change",
				function() {
					// 서블릿 호출을 위해 form을 submit
					document.getElementById("searhForm").submit();
				});

		document.getElementById("edutype").addEventListener("change",
				function() {
					// 서블릿 호출을 위해 form을 submit
					document.getElementById("searhForm").submit();
				});
	});
</script>

</html>