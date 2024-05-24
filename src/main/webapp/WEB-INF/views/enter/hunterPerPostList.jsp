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
  .container, h2 {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column; 
  }
  ul {
            display: flex;
            flex-direction: row;
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 0 10px; /* 각 리스트 아이템 간의 간격을 추가 */
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
</style>

<!-- Chart.js 라이브러리 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> hunterPerPostList page </h2> <!-- 해당공고의 지원자 관리 페이지(해당공고내용/지원자(구직자)리스트/해당공고의 통계 -->
    <br>
    <div class="container"> <!-- 해당공고내용 --> 
    	${posting.postcode }
    	${posting.title }
    	${posting.regdate }
    	모집인원 : ${posting.headcount }
    </div>
    <br>
    <div class="container"> <!-- 지원자 리스트 -->
    	<p>지원자 리스트</p>
    	<br>
    		<c:forEach var="app" items="${applicantDto }">
    		<ul>
	    		<li>${app.username }</li> 
	    		<li>${app.title }</li>
	    		<li>${app.gender }</li>
	    		<li>${app.birth }</li>
	    		<li>${app.edutype }</li>
	    		<li>${app.employmenttype }</li>
    		</ul>
    		</c:forEach>
    	
    </div>
    <br>
    <div class="container">  <!-- 통계(해당채용공고의 지원자수, 성별, 나이대) -->
    	<canvas id="genderApplicantsChart"></canvas>
    
    </div>
</section>
<footer>
    <%@ include file="../sub/footer.jsp" %>
</footer>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const ctx = document.getElementById('genderApplicantsChart').getContext('2d');
        const genderApplicantsChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [
                    '2월', '3월', '4월'
                ],
                datasets: [
                    {
                        label: '남성 지원자 수',
                        data: [
                            /* 예시 데이터입니다. 실제 데이터로 대체하세요. */
                            ${maleApplicants[0]}, ${maleApplicants[1]}, ${maleApplicants[2]}, ${maleApplicants[3]}, 
                            ${maleApplicants[4]}, ${maleApplicants[5]}, ${maleApplicants[6]}, ${maleApplicants[7]}, 
                            ${maleApplicants[8]}, ${maleApplicants[9]}, ${maleApplicants[10]}, ${maleApplicants[11]}
                        ],
                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    },
                    {
                        label: '여성 지원자 수',
                        data: [
                            /* 예시 데이터입니다. 실제 데이터로 대체하세요. */
                            ${femaleApplicants[0]}, ${femaleApplicants[1]}, ${femaleApplicants[2]}, ${femaleApplicants[3]}, 
                            ${femaleApplicants[4]}, ${femaleApplicants[5]}, ${femaleApplicants[6]}, ${femaleApplicants[7]}, 
                            ${femaleApplicants[8]}, ${femaleApplicants[9]}, ${femaleApplicants[10]}, ${femaleApplicants[11]}
                        ],
                        backgroundColor: 'rgba(255, 99, 132, 0.6)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    }
                ]
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