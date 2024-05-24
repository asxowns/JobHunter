<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
	*{
		margin:0;
		padding:0;
	}
	body{
		color:#333;
	}
	h1{
		text-align:center;
		margin:75px 0 90px;
	}
  .container{
  	width:500px;
  	margin:0 auto;
  }
  
  .list-title{
  	font-size:20px;
  	color:#888;
  	margin-bottom:25px;
  }
  .list-title b{
  	padding-right:10px;
  }
  
  input[type="submit"]{
	width:500px;
	height:50px;
	background:#d44958;
	border:none;
	color:#fff;
	font-size:20px;
}
input[type="text"]{
	width:100%;
	height:40px;
	border:1px solid #ddd;
	padding-left:5px;
	box-sizing:border-box;
	margin-top:10px;
}
input[type="password"]{
	width:100%;
	height:40px;
	border:1px solid #ddd;
	padding-left:5px;
	box-sizing:border-box;
	margin-top:10px;
}

.input-row{
	margin-bottom:20px;
}

.box1{
	display:flex;
}
.box1 input[type="text"]{
	width:240px;
}
.box1 input[type="password"]{
	width:240px;
}
.box1:nth-child(1) .input-row{
	margin-right:20px;
}

label{
	font-weight:bold;
}

.box2 .input-row:nth-child(1){
	margin-right:20px;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h1>기업정보관리</h1> <!-- 기업정보 수정폼 페이지  -->
    <div class="container">
    	<p class="list-title"><b>·</b>기업정보</p> 
		<form action="/enter/enterpriseUpdate" method="post">
		
		<div class="box1">
			<input type="hidden" id="entercode" name="entercode"value="${enterprise.entercode }">
			<div class="input-row">
				<label for="companyname">기업명</label>
				<input type="text" id="companyname" name="companyname" value="${enterprise.companyname }">
			</div>
			<div class="input-row">
				<label for="ceo">대표자명</label>
				<input type="text" id="ceo" name="ceo" value="${enterprise.ceo }">
			</div>
		</div>
		
		<div class="input-row">
				<label for="">기업전화번호</label>
				<input type="text" id="tel" name="tel" value="${enterprise.tel }">
		</div>
		
		<div class="box1 box2">
			<div class="input-row">
				<label for="">기업크기</label>
				<input type="text" id="size" name="size" value="${enterprise.size }">
			</div>
			<div class="input-row">
				<label for="corporatetype">기업형태</label>
				<input type="text" id="corporatetype" name="corporatetype" value="${enterprise.corporatetype }">
			</div>
		</div>
		
			<div class="input-row">
				<label for="">산업</label>
				<input type="text" id="businessitem" name="businessitem" value="${enterprise.businessitem }">
			</div>
		
			<div class="input-row">
				<label for="businessnumber">사업자등록번호</label>
				<input type="text" id="businessnumber" name="businessnumber" value="${enterprise.businessnumber }">
			</div>
			<div class="input-row">
				<label for="address">회사주소</label>
				<input type="text" id="address" name="address" value="${enterprise.address}">
			</div>
			
			<div class="box1 box2">
				<div class="input-row">
					<label for="">사원수</label>
					<input type="text" id="empnum" name="empnum" value="${enterprise.empnum }">
				</div>
				<div class="input-row">
					<label for="">매출액</label>
					<input type="text" id="sales" name="sales" value="${enterprise.sales }">
				</div>
		</div>
			
		<p class="list-title"><b>·</b>담당자정보</p>	
			<div class="box1 box2">
				<div class="input-row">
					<label for="eid">아이디</label>
					<input type="text" id="eid" name="eid" value="${enterprise.eid.memberid}" readonly>
				</div>
				<div class="input-row">
					<label for="password">비밀번호</label>
					<input type="password" id="password" name="password" value="${enterprise.eid.password}">
				</div>
			</div>
			
			<div class="input-row">
				<label for="">담당자 이름</label>
				<input type="text" id="managername" name="managername" value="${enterprise.managername }">
			</div>
			<div class="input-row">
				<label for="managertel">담당자 연락처</label>
				<input type="text" id="managertel" name="managertel" value="${enterprise.managertel }">
			</div>
			<div class="input-row">
				<label for="manageremail">담당자 이메일</label>
				<input type="text" id="manageremail" name="manageremail" value="${enterprise.manageremail }">
			</div>
			
			<input type="submit" value="수정하기">
		</form>
	</div>
</section>
    
<footer>
	<%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>