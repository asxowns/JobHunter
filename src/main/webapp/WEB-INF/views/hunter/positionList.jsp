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
    section {
        width: 1240px;
        margin: 0 auto;
    }
    .section-title {
        text-align: center;
        margin: 24px 0;
    }
    #post-list-table {
        margin: 0 auto;
        width: 1100px;
        height: 700px;
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
        width: 1100px;
        height: 320px;
        border: 1px solid black;
    }
    .msg {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .msg textarea {
        width: 80%;
        height: 190px;
        box-sizing: border-box;
        font-size: 14px;
        padding: 5px;
        border: 1px solid white;
        border-radius: 4px;
        resize: none;
    }
    .btn {
        text-align: center;
        margin-top: 10px;
    }
    .btn input[type="button"] {
        width: auto;
        margin: 0 10px;
        padding: 5px 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background: #f4f4f4;
        cursor: pointer;
    }
    .toggle-container {
        text-align: right;
        margin: 10px 0;
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
        width: auto;
        box-sizing: border-box;
        font-size: 14px;
        padding: 5px;
        border: 1px solid white;
    }
    .managetelordeadline {
        display: flex;
        justify-content: flex-end;
    }
    .managetelordeadline input {
        margin-left: 10px;
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

						<textarea readonly>${offer.msg}</textarea>
					</div>
					<div class="btn">
						<input type="button" class="ok" value="수정">
						<input type="button" class="no" value="거절">
					</div>
					<div class="toggle-container">
						<button class="toggle-btn" onclick="toggleDetails(this)">▼</button>
					</div>
					
					<div class="details" style="display: none;">
						<div class="managetelordeadline">
							<input type="text" readonly value="${offer.managetel}">
							<input type="text" readonly value="${offer.deadline}">
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
	<footer>
	</footer>
</body>
</html>





