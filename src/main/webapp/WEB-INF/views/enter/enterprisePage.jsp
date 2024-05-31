<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
	
	body, html {
    	height: 100%;
    	margin: 0;
  	}
  	.container, h2, canvas {
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	flex-direction: column;
    }
  	.button-container {
    	display: flex;
    	justify-content: center;
    	gap: 10px; /* 버튼 사이 간격 */
    	margin-top: 20px; /* 상단 여백 */
    }
    button {
    	width: 150px; /* 버튼 너비 조절 */
    	height: 50px; /* 버튼 높이 조절 */
    	font-size: 16px; /* 폰트 크기 조절 */
    	background-color: white; /* 버튼 배경 색상 흰색으로 설정 */
    	color: black; /* 텍스트 색상 검정으로 설정 */
    	border: 1px solid black; /* 버튼 테두리 설정 */
    	border-radius: 5px; /* 버튼 모서리 둥글게 */
    	cursor: pointer; /* 커서 변경 */
    }
    button:hover {
    	background-color: #f0f0f0; /* 호버 시 버튼 배경 색상 변경 */
    }
    
    canvas {
            max-width: 700px;
            width: 100%;
            height: 200px;
            margin: 20px 0; /* 그래프 위아래 여백 추가 */
        }	
    section {
            display: flex;
            flex-direction: column;
            align-items: center;
        } 
    h2{padding: 30px;}   
</style>

<!-- Chart.js 라이브러리 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> 기업 마이 페이지 </h2>
    <br>
    <div class="button-container">
		<a href="/enter/enterprisePostList"><button>채용공고관리</button></a>
		<a href="/enter/enterpriseInfoWriteForm"><button>기업정보관리</button></a>
		<a href="/enter/hunterList"><button>인재정보관리</button></a>
	</div>
	
	<canvas id="applicantsChart"></canvas>
</section>
<footer>

</footer>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const ctx = document.getElementById('applicantsChart').getContext('2d');
        const applicantsChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [
                    '1월', '2월', '3월', '4월', '5월', '6월', 
                    '7월', '8월', '9월', '10월', '11월', '12월'
                ],
                datasets: [{
                    label: '지원자 수(월별)',
                    data: [
                        ${applicants[0]}, ${applicants[1]}, ${applicants[2]}, ${applicants[3]}, 
                        ${applicants[4]}, ${applicants[5]}, ${applicants[6]}, ${applicants[7]}, 
                        ${applicants[8]}, ${applicants[9]}, ${applicants[10]}, ${applicants[11]}
                    ],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    });
</script>
</body>
</html>
