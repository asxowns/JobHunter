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
  h2{padding:10px;}
  .container form .input-row {
    display: flex; 
    align-items: center; 
    margin-bottom: 10px; 
  }
   .container form .input-row input[type="text"], .input-row input[type="file"] {
    flex: 1; 
    margin-left: 10px; 
  }
  .input-row select { margin-left: 10px;}
  .container form input[type="text"]{
        width: 100px; 
        height: 10px; 
        padding: 10px; 
        border: 1px solid gray;
        outline: none; 
        font-size: 16px; 
    }
   .container form input[type="submit"]{
        width: 200px; 
        height: 20px; 
        border: 1px solid gray;
        padding: 20px; 
        text-align: center; 
        background-color:#d44958;
		color:white;
    }
    
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <div class="container">
	    <c:if test="${formType eq 'register'}">
        	<h2>채용 공고 등록</h2>
            <br>
	    	<form action="enterprisePostWrite" method="post">
	    		<input type="hidden" id="eid" name="eid" value="${sessionScope.logged}">
				<div class="input-row">
				<input type="text" id="title" name="title" placeholder="공고제목" value="${posting.title }">
				</div>
				<div class="input-row">
				<label for="headcount">채용인원</label>
				<input type="text" id="headcount" name="headcount" placeholder="채용인원" value="${posting.headcount }">
				</div>
				<div class="input-row">
				<label>지원자격</label>
				<input type="text" id="edutype" name="edutype" placeholder="학력" value="${posting.edutype }">
				<input type="text" id="career" name="career" placeholder="경력" value="${posting.career }">
				</div>
				<div class="input-row">
				<label>근무조건</label>
				<input type="text" id="employmenttype" name="employmenttype" placeholder="고용형태" value="${posting.employmenttype }">
				<input type="text" id="pay" name="pay" placeholder="급여" value="${posting.pay }">
				<input type="text" id="area" name="area" placeholder="근무지역" value="${posting.area }">
				</div>
				<div class="input-row">
				<label>산업군</label>
				<select id="industry" name="industry" class="mainSelect" onchange="fetchSubList()" >
        			<option value="">대분류</option>
        			<c:forEach var="main" items="${mainList}">
                        <option id="${main.mccode}" value="${main.main}">${main.main}</option>
                    </c:forEach>
    			</select>
				</div>
				<div class="input-row">
				<label>직무</label>
				<select name="job" id="subSelect">
        			<option value="">소분류</option>
        			 <c:forEach var="sub" items="${subList }">
                        <option value="${sub}">${sub}</option>
                     </c:forEach>
    			</select>
				</div>
				<div class="input-row">
				<label>마감일</label>
				<input type="text" id="deadline" name="deadline" placeholder="마감일" value="${posting.deadline }">
				</div>
				<div class="input-row">
				<label>담당자 번호</label>
				<input type="text" id="managertel" name="managertel" placeholder="번호" value="${posting.managertel }">
				</div>
				<div class="input-row">
				<label>파일 업로드</label>
				<input type="file" id="mainurl" name="mainurl" value="${posting.mainurl }">
				</div>
				<div class="input-row">
				<label>상세요강</label>
				<input type="text" id="maincontent" name="maincontent" value="${posting.maincontent }">
				</div>
				<input type="submit" value="등록하기">
			</form>
		</c:if>
            
<!-- 수정--------------------- -->
        <c:if test="${formType eq 'edit'}">
        	<h2>채용 공고 수정</h2>
            <br>
           	<form action="enterprisePostUpdate" method="post">
                <input type="hidden" id="postcode" name="postcode" value="${posting.postcode}">
            	<input type="hidden" id="eid" name="eid" value="${sessionScope.logged}">
				<div class="input-row">
				<input type="text" id="title" name="title" placeholder="공고제목" value="${posting.title }">
				</div>
				<div class="input-row">
				<label for="headcount">채용인원</label>
				<input type="text" id="headcount" name="headcount" placeholder="채용인원" value="${posting.headcount }">
				</div>
				<div class="input-row">
				<label>지원자격</label>
				<input type="text" id="edutype" name="edutype" placeholder="학력" value="${posting.edutype }">
				<input type="text" id="career" name="career" placeholder="경력" value="${posting.career }">
				</div>
				<div class="input-row">
				<label>근무조건</label>
				<input type="text" id="employmenttype" name="employmenttype" placeholder="고용형태" value="${posting.employmenttype }">
				<input type="text" id="pay" name="pay" placeholder="급여" value="${posting.pay }">
				<input type="text" id="area" name="area" placeholder="근무지역" value="${posting.area }">
				</div>
				<div class="input-row">
				<label>산업군</label>
				<select id="industry" name="industry" class="mainSelect" onchange="fetchSubList()">
        			<option value="">${posting.industry }</option>
        			<c:forEach var="main" items="${mainList}">
                        <option id="${main.mccode}" value="${main.main}">${main.main}</option>
                    </c:forEach>
    			</select>
				</div>
				<div class="input-row">
				<label>직무</label>
				<select name="job" id="subSelect">
        			<option value="">${posting.job }</option>
        			 <c:forEach var="sub" items="${subList }">
                        <option value="${sub}">${sub}</option>
                     </c:forEach>
    			</select>
				</div>
				<div class="input-row">
				<label>마감일</label>
				<input type="text" id="deadline" name="deadline" placeholder="마감일" value="${posting.deadline }">
				</div>
				<div class="input-row">
				<label>담당자 번호</label>
				<input type="text" id="managertel" name="managertel" placeholder="번호" value="${posting.managertel }">
				</div>
				<div class="input-row">
				<label>파일 업로드</label>
				<input type="file" id="mainurl" name="mainurl" value="${posting.mainurl }">
				</div>
				<div class="input-row">
				<label>상세요강</label>
				<input type="text" id="maincontent" name="maincontent" value="${posting.maincontent }">
				</div>
				<input type="submit" value="수정하기">
			</form>
		</c:if>
	</div>
</section>
<footer>

</footer>
<script>
      function fetchSubList() {
         var mainSelect = document.querySelector('.mainSelect');
         var selectedOption = mainSelect.options[mainSelect.selectedIndex];
         var mccode = selectedOption.id;
         fetch('/hunter/getSubList?mccode='+mccode)
         .then(response => {
            if (!response.ok) {
               throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
         })
         .then(data => {
            console.log(data); // 응답 데이터 출력
            if (!Array.isArray(data)) {
               throw new Error("Expected an array but got " + typeof data);
            }
         
            var subSelect = document.getElementById('subSelect');
               subSelect.innerHTML = ''; // 기존 옵션 삭제
      
            data.forEach(sub => {
               var option = document.createElement('option');
               option.value = sub;
               option.text = sub;
               subSelect.appendChild(option);
            });
         })
         .catch(error => console.error('Error fetching sub list:', error));
      }
      
   </script>
</body>
</html>