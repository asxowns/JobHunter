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
.favor-list-flex {
	display: flex;
	align-items: center;
	justify-content: space-around;
	border-bottom: 1px solid black;
	margin: 12px 0;
}

#favor-list {
	width: 1140px;
	margin: 50px auto;
}

.favor-list-flex li {
	margin: 20px;
}

#favor-btn {
	background-color: #d44958;
	color: white;
	padding: 8px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<div id="favor-list">
			<h2>스크랩한 채용 공고</h2>

			<c:forEach var="favor" items="${favor }">
				<ul class="favor-list-flex">
					<li>${favor.companyname }</li>
					<li>${favor.title }</li>
					<li>${favor.favorcode }</li>
					<div id="heartLink">
						<c:if test="${not empty favor.favorcode}">
							<img id="heartImg" src="/resource/img/heartfill.png">
						</c:if>
						<c:if test="${empty favor.favorcode == null }">
							<img id="heartImg" src="/resource/img/heartempty.png">
						</c:if>
					</div>
					<li><a href="/hunter/favorList?favorcode=${favor.favorcode }"
						id="favor-btn">스크랩</a></li>
				</ul>
			</c:forEach>
		</div>
	</section>
	<footer> </footer>

	<script>
		const heartLink = document.getElementById("heartLink");
		const heartImg = document.getElementById("heartImg");
		let isFilled = false;

		document
				.getElementById("heartLink")
				.addEventListener(
						"click",
						function(event) {
							event.preventDefault(); // 기본 이벤트 동작 방지
							if (isFilled) {
								heartImg.src = "/resource/img/heartempty.png";
							} else {
								heartImg.src = "/resource/img/heartfill.png";
							}
							isFilled = !isFilled;
							var outputDivPw = document
									.getElementById('outputDivPw');

							const xhttp = new XMLHttpRequest();
							xhttp.onload = function() {
								if (this.readyState == 4 && this.status == 200) {
									document.getElementById("demo").innerHTML = this.responseText;
								}
							};
							xhttp.open("GET", "/subscribe?posteid=" + posteid
									+ "&isFilled=" + isFilled, true);
							xhttp.send();
						});
	</script>
</body>
</html>