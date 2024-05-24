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
section{
	width:1240px;
	margin:75px auto;
}
h1{
	text-align:center;
	margin-bottom:150px;
}

.entList_area{
	width:850px;
	margin:0 auto;
}
.entList_area p{
	font-weight:bold;
	margin-bottom:20px;
}
.entList_area p span{
	color:#d44958;
}
.entList_area ul li a{
	width:850px;
	margin:0 auto;
	height:90px;
	border:1px solid #ddd;
	display:flex;
	justify-content:flex-start;
	align-items:center;
	margin-bottom:10px;
}
.entList_area ul li a:hover{
	background:rgb(212, 73, 88, 0.05);
}
.entList_area ul li h5{
	font-weight:400;
}
.entList_area ul li h5:nth-child(1){
	padding-left:50px;
	padding-right:70px;
	font-size:21px;
	font-weight:500;
}
.entList_area ul li h5:nth-child(2){
	padding-right:15px;
	color:#aaa;
}
.entList_area ul li h5:nth-child(3){
	padding-right:15px;
	color:#aaa;
}
.entList_area ul li h5:nth-child(4){
	padding-right:150px;
	color:#aaa;
}
.entList_area ul li h5:nth-child(5){
	font-size:21px;
	font-weight:600;
}
.entList_area ul li h5:nth-child(5) span{
	font-size:16px;
	font-weight:400;
	padding-left:5px;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h1>기업 전체</h1>
    
    <div class="entList_area">
    	<p>총 <span>3</span>건</p>
    	<ul>
    	<c:forEach var="dto" items="${list}">
    	
    		<li>
    			<a href="enterpriseDetail?entercode=${dto.entercode}">
	    			<h5>${dto.companyname}</h5>
	    			<h5>${dto.businessitem}</h5>
	    			<h5>${dto.sales}억원</h5>
	    			<h5>사원수 ${dto.empnum}명</h5>
	    			<h5>담당자명 <span>${dto.managername}</span></h5>
    			</a>
    		</li>
    	</c:forEach>
    		
    	</ul>
    </div>
</section>
<footer>
	<%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>