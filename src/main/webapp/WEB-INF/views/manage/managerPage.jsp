<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
    .a-button{
        display:flex;
        color: black;
        border:1px solid lightgrey;
        margin: 20px;
        white-space: nowrap;
        justify-content:center;
        align-items:center;
    }
    .chart-container {
        display: flex;
        justify-content: space-around;
    }
    .chart {
        margin: 10px;
        width: 400px;
    }
    canvas {
        width: 100% !important; /* canvas 요소가 부모의 너비를 채우도록 설정 */
        height: auto !important; /* canvas 요소의 높이를 자동으로 설정 */
    }
    .text-center{
        text-align: center;
        margin-bottom:20px;
    }
    #managerpage-section{
        margin:50px 0px;
    }
    #manager-menu-grid{
        display:flex;
        flex-wrap: wrap;
        width:840px;
        margin:0 auto;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <div id="managerpage-section">
    <h2 class="text-center"> 서비스 관리 </h2>
    <div id="manager-menu-grid">
            <a class="a-button" href="/manage/noticeList"> <img src="/resource/img/manage/button1.png"> </a>
            <a class="a-button" href="/manage/managerCSList"> <img src="/resource/img/manage/button2.png"> </a>
            <a class="a-button" href="/manage/chat"> <img src="/resource/img/manage/button3.png">  </a>
            <a class="a-button" href="/manage/accessHub"> <img src="/resource/img/manage/button4.png"> </a>
            <a class="a-button" href="/manage/dashboard"> <img src="/resource/img/manage/button5.png"> </a>
    </div>
    </div>
    <div class="chart-container">
        <div class="chart">
            <h3>최근 7일간 접속자 / 신규 가입자 수</h3>
            <canvas id="lineChart"></canvas>
        </div>
        <div class="chart">
            <h3>회원 유형 비율</h3>
            <canvas id="pieChart"></canvas>
        </div>
    </div>

    <script>
        // Line Chart Data
        const lineCtx = document.getElementById('lineChart').getContext('2d');
        const lineChart = new Chart(lineCtx, {
            type: 'line',
            data: {
                labels: ['05-13', '05-14', '05-15', '05-16', '05-17','05-18', '05-19'],
                datasets: [{
                    label: '신규 가입 회원 수',
                    data: [65, 59, 99, 81, 56, 81, 41],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2,
                    fill: false
                },{
                    label: '접속자 수',
                    data: [200,189,301,227,208,156,71],
                    borderColor: 'rgba(200, 75, 100, 1)',
                    borderWidth: 2,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: false
                    }
                }
            }
        });

        // Pie Chart Data
        const pieCtx = document.getElementById('pieChart').getContext('2d');
        const pieChart = new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: ['구직자 회원', '기업 회원', '비 구직자 회원'],
                datasets: [{
                    label: 'Sample Pie Dataset',
                    data: [300, 50, 100],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(90, 235, 125, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(90, 235, 125, 1)'
                    ],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true
            }
        });
    </script>

</section>
<footer>

</footer>

</body>
</html>