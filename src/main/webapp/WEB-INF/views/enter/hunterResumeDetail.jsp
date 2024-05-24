<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        background: #fff8f8;
      }
      ul {
        list-style: none;
      }
      a{
        text-decoration: none;
        color:#333;
      }
      section {
        width: 1240px;
        margin: 0 auto;
      }

      .resume_title {
        width: 800px;
        margin: 100px auto 15px;
        font-size: 28px;
      }
      .resume_info_box1 {
        width: 800px;
        margin: 0 auto;
        background: #fff;
        display: flex;
      }
      .img_box {
        width: 140px;
        height: 180px;
        background: #ccc;
      }

      .resume_info1 {
        padding: 15px;
        box-sizing: border-box;
      }
      .resume_info1 h1 {
        font-size: 20px;
        font-weight: 600;
        padding-bottom: 15px;
      }
      .resume_info1 h1 span {
        font-size: 15px;
        color: #888;
        padding-left: 10px;
        font-weight: 400;
      }
      .resume_info1 p {
        font-size: 15px;
        color: #333;
        padding-bottom: 10px;
      }
      .resume_info1 p span {
        display: inline-block;
        color: #888;
        width: 100px;
      }

      .resume_info2 {
        padding: 15px;
        padding-top: 55px;
        box-sizing: border-box;
      }
      .resume_info2 p {
        padding-bottom: 10px;
      }
      .resume_info2 p span {
        display: inline-block;
        color: #888;
        width: 70px;
      }

      .resume_subtitle {
        width: 800px;
        margin: 40px auto 15px;
        font-size: 22px;
      }
      .resume_info_box2 {
        width: 800px;
        margin: 0 auto;
        background: #fff;
        padding: 25px;
        box-sizing: border-box;
        border-top: 1px solid #333;
      }

      .resume_info_box3 ul {
        display: flex;
        align-items: center;
        gap: 30px;
      }
      .resume_info_box3 ul li:nth-child(2) {
        color: #d44958;
      }
      .resume_info_box3 ul li:nth-child(3) {
        color: #333;
        font-size: 18px;
        font-weight: bold;
      }
      .resume_info_box4 {
        border-top: 1px solid #ccc;
      }

      .resume_info_box5 {
        display: flex;
        gap: 40px;
      }
      .resume_info_box5 .info_right h3 {
        font-weight: 600;
        padding-right:30px;
        padding-bottom: 15px;
      }
      .resume_info_box5 .info_right span {
        color: #888;
        font-weight: 400;
      }
      .resume_info_box5 .info_right h3 span{
        padding-left: 20px;
      }
      .resume_info_box5 .info_right p{
        padding-bottom: 15px;
      }
      .resume_info_box5 .info_right p span{
        padding-right: 20px;
      }

      .resume_info_box6 ul{
        display: flex;
        align-items: center;
        gap: 40px;
      }
      .resume_info_box6 ul li:nth-child(2){
        font-weight: bold;
        font-size: 18px;
      }

      .resume_info_box7{
        padding-bottom: 50px;
      }
      .resume_info_box7 .resume_introduce_title{
        font-size: 19px;
        padding-bottom: 15px;
      }
      .resume_introduce p{
        line-height: 28px;
      }
      .resume_info_box7 .resume_introduce_title2{
        padding-top: 40px;
      }

      .resume_info_box8{
        display: flex;
        gap: 10px;
      }

      .resume_info_box9{
        margin-bottom: 150px;
      }
      .resume_info_box9 ul{
        display: flex;
        gap: 20px;
        padding-bottom: 25px;
      }
      .resume_info_box9 ul li:nth-child(1){
        width: 110px;
        font-weight: 600;
        font-size: 17px;
      }
</style>
</head>
<body>
<header>
   <%@ include file="../sub/header.jsp" %>
</header>
<section>
    
    <h1 class="resume_title">이력서 제목이 들어가는 부분</h1>
      <div class="resume_info_box1">
        <div class="img_box">
          <img src="" />
        </div>

        <div class="resume_info1">
          <h1>김태준<span>남 1994년 1월 3일 만30세</span></h1>
          <p><span>휴대폰번호</span>010-8471-2165</p>
          <p><span>비상연락처</span>010-8471-2165</p>
          <p><span>주소</span>부산광역시 부산진구 중앙대로 749</p>
        </div>

        <div class="resume_info2">
          <p><span>이메일</span>asxowns@naver.com</p>
          <p><span>병역</span>O</p>
          <p><span>경력</span>신입</p>
        </div>
      </div>

      <h1 class="resume_subtitle">기술스택</h1>
      <div class="resume_info_box2">
        <p>Java, Spring, HTML</p>
      </div>

      <h1 class="resume_subtitle">학력</h1>
      <div class="resume_info_box2 resume_info_box3">
        <ul>
          <li>2016. 02</li>
          <li>졸업</li>
          <li>경성대학교</li>
          <li>컴퓨터공학</li>
        </ul>
      </div>
      <div class="resume_info_box2 resume_info_box3 resume_info_box4">
        <ul>
          <li>2012. 02</li>
          <li>졸업</li>
          <li>경성고등학교</li>
        </ul>
      </div>

      <h1 class="resume_subtitle">경력</h1>
      <div class="resume_info_box2 resume_info_box5">
        <div class="info_left">
          <p>2016. 08 ~ 2020. 10</p>
        </div>

        <div class="info_right">
          <h3>그린컴퓨터<span>대리</span></h3>
          <p><span>담당직무</span>행정직</p>
          <p><span>담당업무</span>데스크 행정업무</p>
        </div>
      </div>

      <h1 class="resume_subtitle">자격증</h1>
      <div class="resume_info_box2 resume_info_box6">
        <ul>
          <li>2017. 05</li>
          <li>2종보통운전면허</li>
          <li>경찰청</li>
        </ul>
      </div>

      <h1 class="resume_subtitle">자기소개서</h1>
      <div class="resume_info_box2 resume_info_box7">
        <div class="resume_introduce">
          <h4 class="resume_introduce_title">성장과정</h4>
          <p>
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
          </p>
        </div>
        <div class="resume_introduce">
          <h4 class="resume_introduce_title resume_introduce_title2">성장과정</h4>
          <p>
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
            자기소개서 내용 들어가는 부분
          </p>
        </div>
      </div>

      <h1 class="resume_subtitle">포트폴리오</h1>
      <div class="resume_info_box2 resume_info_box8">
        <img src="./link.png">
        <a href="">https://asxowns.github.io/2023.08-Portfolio/</a>
      </div>

      <h1 class="resume_subtitle">희망근무조건</h1>
      <div class="resume_info_box2 resume_info_box9">
        <ul>
          <li>희망근무지역</li>
          <li>1. 부산</li>
          <li>2. 대구</li>
        </ul>
        <ul>
          <li>희망산업군</li>
          <li>개발, 데이터</li>
        </ul>
        <ul>
          <li>희망직무</li>
          <li>백엔드 개발자</li>
          <li>프론트엔드 개발자</li>
        </ul>
      </div>
    
</section>
<footer>

</footer>

</body>
</html>