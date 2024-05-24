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
		margin:0 auto;
	}
	
	.ent_area{
		width:900px;
		margin:75px auto;
		border:1px solid #ddd;
		padding:30px;
		box-sizing:border-box;
	}
	
	.ent_name{
		padding-bottom:30px;
	}
	.ent_name_top{
		display:flex;
		align-items: middle;
	}
	.ent_name_top h1{
		font-size:28px;
	}
	.ent_name_top h2{
		padding-left:15px;
	}
	.ent_name_top h2 img{
		padding-top:5px;
		filter:grayscale(100%);
	}
	.ent_name_top h2 img:hover{
		filter:url("/resource/img/heartfill.png");
	}
	
	.ent_info{
		display:flex;
		justify-content:space-between;
	}
	.ent_info .ent_info1{
		color:#888;
	}
	.ent_info .ent_info1 p{
		padding-bottom:10px;
	}
	.ent_info .ent_info1 p span{
		padding-left:20px;
	}
	
	.ent_info .ent_info2{
		text-align:center;
	}
	.ent_info .ent_info2 p:first-child{
		padding-bottom:30px;
	}
	.ent_info .ent_info2 p:last-child{
		font-size:28px;
	}
	
	.ent_info .ent_info3{
		text-align:center;
	}
	.ent_info .ent_info3 p:first-child{
		padding-bottom:30px;
	}
	.ent_info .ent_info3 p:last-child{
		font-size:28px;
	}
	
	.postList{
		width:900px;
		margin:0 auto;
	}
	.postList p{
		padding-bottom:20px;
		font-weight:bold;
	}
	
	.post_info{
		margin-bottom:10px;
	}
	.post_info a{
		padding:25px;
		border:1px solid #ddd;
		display:flex;
		justify-content:space-between;
		align-items:center;
		box-sizing:border-box;
	}
	.post_info h3:first-child{
		font-size:18px;
	}
	.post_info h3:nth-child(2){
		font-size:16px;
		color:#888;
		font-weight:400;
	}
	.post_info h3:nth-child(3){
		font-size:14px;
		color:#fff;
		font-weight:400;
	}
	.post_info .posting{
		width:76px;
		height:32px;
		text-align:center;
		background:#d44958;
		line-height:33px;
	}
	.post_info .posting_end{
		width:76px;
		height:32px;
		text-align:center;
		background:#ddd;
		line-height:33px;
	}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>

	<div class="ent_area">
		<div class="ent_name">
			<div class="ent_name_top">
				<h1>${dtoEnter.companyname}</h1>
				<h2><img src="/resource/img/heartfill.png"></h2>
			</div>
			<p><img src="/resource/img/star.png"></p>
		</div>
		<div class="ent_info">
			<div class="ent_info1">
				<p>대표 : ${dtoEnter.managername}</p>
				<p>${dtoEnter.businessitem}<span>${dtoEnter.corporatetype}</span></p>
				<p>${dtoEnter.address}</p>
			</div>
			<div class="ent_info2">
				<p>매출액</p>
				<p>${dtoEnter.sales}억원</p>
			</div>
			<div class="ent_info3">
				<p>사원수</p>
				<p>${dtoEnter.empnum}명</p>
			</div>
		</div>
	</div>
	<div class="postList">
		<p>채용 공고</p>
	<c:forEach var="dto" items="${list1}" varStatus="status">
		<div class="post_info">
			<a href="#">
				<h3>${dto.title}</h3>
				<h3>기간 ~${dto.regdate}</h3>
				<h3 class="posting">채용중</h3>
			</a>
		</div>
    </c:forEach>
	</div>
</section>
<footer>
	<%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>