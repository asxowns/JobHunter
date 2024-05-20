<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
    
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h1> this is postList page </h1>
    <h1>공고리스트</h1>
    <h2>추천공고</h2>
    <a href="" style="margin-right: 5px;">1</a><a href="" style="margin-right: 5px;">2</a><a href="" style="margin-right: 5px;">3</a><a href="" style="margin-right: 5px;">4</a>
	<br>
	<span style="border-right: 1px solid gray;padding-right:5px;">직무 전체</span> <span>직무를 선택해주세요</span>
	<br>

	<div class="search-container">
		<select id="region" name="region">
        <option value="">지역</option>
        <option value="region1">서울</option>
        <option value="region2">경기</option>
        <option value="region3">부산</option>
    </select>
    <select id="region" name="region">
        <option value="">경력</option>
        <option value="region1">신입</option>
        <option value="region2">2년이상</option>
        <option value="region3">5년이상</option>
    </select>
    <select id="region" name="region">
        <option value="">학력</option>
        <option value="region1">대졸</option>
        <option value="region2">초대졸</option>
        <option value="region3">고졸</option>
    </select>
        <input type="text" id="search" name="search" placeholder="기업명 공고명 검색">
        <input type="submit" id="search-button" value="">
    </div>
	<hr>
	
	<a href="loginForm">로그인</a>

</section>
<footer>

</footer>

</body>
<script>
  
</script>

</html>