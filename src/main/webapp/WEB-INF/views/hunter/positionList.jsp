<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>입사 제안 현황</title>
<style>
	body {
		font-family: Arial, sans-serif;
	}
	
	.section-title {
		text-align: center;
		margin: 24px 0;
	}
	
	#post-list-table {
		display: flex;
		flex-direction: column;
		max-width: 75%;
		margin: 0 auto;
	}
	
	.offer-list {
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		border-bottom: 1px solid black;
		padding: 10px;
		margin: 10px 0;
		font-size: 15px;
		font-weight: bold;
	}
	
	.msg {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.msg textarea {
		width: 100%;
		box-sizing: border-box;
		font-size: 14px;
		padding: 5px;
		border: 1px solid #ccc;
		border-radius: 4px;
		resize: none;
	}
	
	.toggle-container {
		text-align: right;
		margin-left: 10px;
	}
	
	.toggle-btn {
		background: none;
		border: none;
		cursor: pointer;
		font-size: 18px;
		padding: 0;
	}
	
	.details {
		display: flex;
		flex-direction: column;
		margin-top: 10px;
	}
	
	.details div {
		margin: 5px 0;
	}
	
	.details input[type="text"] {
		width: 100%;
		box-sizing: border-box;
		font-size: 14px;
		padding: 5px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}
</style>
</head>
<body>
	<header>
		<%@ include file="../sub/header.jsp"%>
	</header>
	<section>
		<h2 class="section-title">입사 제안 현황</h2>
		<div id="post-list-table">
			<c:forEach var="offer" items="${offList}">
				<div class="offer-list">
					<div class="msg">
						입사 제안 메시지
						<textarea readonly>${offer.msg}</textarea>
					</div>
					<div class="toggle-container">
						<button class="toggle-btn" onclick="toggleDetails(this)">▼</button>
					</div>
					<div class="details" style="display: none;">
						<div class="managetel">
							담당자 연락처<input type="text" readonly value="${offer.managetel}">
						</div>
						<div class="deadline">
							채용공고 마감일<input type="text" readonly value="${offer.deadline}">
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<script>
		function toggleDetails(button) {
			var details = button.parentElement.nextElementSibling;
			if (details.style.display === "none") {
				details.style.display = "block";
				button.textContent = "▲";
			} else {
				details.style.display = "none";
				button.textContent = "▼";
			}
		}
	</script>
</body>
</html>





