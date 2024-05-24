<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구직자 마이페이지</title>
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
	
	h1{
		text-align:center;
		margin:75px 0;
	}
	
	.mylink{
		width:780px;
		margin:0 auto;
	}
	.mylink ul{
		display:flex;
		justify-content:center;
		flex-wrap:wrap;
		gap:40px;
	}

</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h1>마이 페이지</h1>
    <div class="mylink">
 		<ul>
 			<li>
 				<a href="/hunter/resumeList">
 					<img src="/resource/img/mypage1.png">
 				</a>
 			</li>
 			<li>
 				<a href="/hunter/jobApplication">
 					<img src="/resource/img/mypage2.png">
 				</a>
 			</li>
 			<li>
 				<a href="/hunter/hunterForm">
 					<img src="/resource/img/mypage3.png">
 				</a>
 			</li>
 			<li>
 				<a href="/hunter/positionList">
 					<img src="/resource/img/mypage4.png">
 				</a>
 			</li>
 			<li>
 				<a href="/hunter/favorList">
 					<img src="/resource/img/mypage5.png">
 				</a>
 			</li> 
 			<li>
 				<a href="/hunter/subscribeList">
 					<img src="/resource/img/mypage6.png">
 				</a>
 			</li>
 		</ul>
 	</div>
</section>
<footer>
	<%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>