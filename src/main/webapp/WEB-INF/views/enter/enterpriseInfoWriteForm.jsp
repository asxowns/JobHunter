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
  
  .container form {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .container form input[type="submit"] {
    align-self: center; 
    margin-top: 7px; 
  }
  .container form .input-row {
    display: flex; 
    align-items: center; 
    margin-bottom: 10px; 
  }
  
  .container form .input-row input[type="text"] {
    flex: 1; 
    margin-left: 10px; 
  }
  .container form input[type="text"], form input[type="password"] {
        width: 200px; 
        height: 20px; 
        padding: 10px; 
        border: 1px solid gray;
        outline: none; 
        font-size: 16px; 
    }
    .container form input[type="submit"] {
        width: 200px; 
        height: 20px; 
        border: 1px solid gray;
        padding: 20px; 
        text-align: center; 
    }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> enterpriseInfoWriteForm page </h2> <!-- 기업정보 수정폼 페이지  -->
    <br>
    <div class="container">
    	<p>· 기업정보</p> 
		<form action="/enter/enterpriseUpdate" method="post">
			<input type="hidden" id="entercode" name="entercode"value="${enterprise.entercode }">
			<div class="input-row">
				<label for="cname">기업명</label>
				<input type="text" id="companyname" name="companyname" value="${enterprise.companyname }">
			</div>
			<div class="input-row">
				<label for="ceo">대표자명</label>
				<input type="text" id="ceo" name="ceo" value="${enterprise.ceo }">
			</div>
			<div class="input-row">
				<label for="corporatetype">기업형태</label>
				<input type="text" id="corporatetype" name="corporatetype" value="${enterprise.corporatetype }">
			</div>
			<div class="input-row">
				<label for="breginum">사업자등록번호</label>
				<input type="text" id="businessnumber" name="businessnumber" value="${enterprise.businessnumber }">
			</div>
			<div class="input-row">
				<label for="address">회사 주소</label>
				<input type="text" id="address" name="address" value="${enterprise.address}">
			</div>
		<br>
		<p>· 담당자 정보</p>	
			<div class="input-row">
				<label for="id">아이디</label>
				<input type="text" id="eid" name="eid" value="${enterprise.eid.memberid}" readonly>
			</div>
			<div class="input-row">
				<label for="pw">비밀번호</label>
				<input type="password" id="password" name="password" value="${enterprise.eid.password}">
			</div>
			<div class="input-row">
				<label for="btel">담당자 연락처</label>
				<input type="text" id="managertel" name="managertel" value="${enterprise.managertel }">
			</div>
			<div class="input-row">
				<label for="bemail">이메일</label>
				<input type="text" id="manageremail" name="manageremail" value="${enterprise.manageremail }">
			</div>
			
			<input type="submit" value="수정하기">
		</form>
	</div>
</section>
    
</section>
<footer>

</footer>

</body>
</html>