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
  .container form .input-row label {
    width: 100px; 
    text-align: left; 
  }
  .container form .input-row input[type="text"] {
    flex: 1; 
    margin-left: 10px; 
  }
  .container form input[type="text"] {
        width: 200px; 
        height: 20px; 
        padding: 10px; 
        border: 1px solid gray;
        border-radius: 30px; 
        outline: none; 
        font-size: 16px; 
    }
    .container form label {
        text-align: left; 
    }
    .container form input[type="submit"] {
        width: 200px; 
        height: 20px; 
        border-radius: 30px; 
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
		<form action="enterpriseUpdate" method="post">
			<div class="input-row">
				<label for="id">아이디</label>
				<input type="text" id="id" name="id" value="${enterprise.getEid().getMemberid()}">
			</div>
			<div class="input-row">
				<label for="pw">비밀번호</label>
				<input type="text" id="password" name="password" value="${enterprise.getEid().getPassword()}">
			</div>
			<div class="input-row">
				<label for="cname">기업명</label>
				<input type="text" id="companyname" name="companyname" value="${enterprise.companyname }">
			</div>
			<div class="input-row">
				<label for="industry">산업군</label>
				<input type="text" id="corporatetype" name="corporatetype" value="${enterprise.corporatetype }">
			</div>
			<div class="input-row">
				<label for="btel">담당자 연락처</label>
				<input type="text" id="managertel" name="managertel" value="${enterprise.managertel }">
			</div>
			<div class="input-row">
				<label for="bemail">이메일</label>
				<input type="text" id="manageremail" name="manageremail" value="${enterprise.manageremail }">
			</div>
			<div class="input-row">
				<label for="breginum">사업자등록번호</label>
				<input type="text" id="businessnumber" name="businessnumber" value="${enterprise.businessnumber }">
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