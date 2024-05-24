<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>writeForm</title>
<style>
*{
	margin:0;
	padding:0;
}
body{
	font-size:16px;
	color:#333;
}
a{
	text-decoration:none;
	color:#333;
}
	.title{
		width:100%;
		margin-top:100px;
	}
	.title h1{
		text-align:center;
		margin-bottom:75px;
	}
	
	section{
		width:1240px;
		margin:0 auto;
	}
	
	.write_container{
		width:700px;
		margin:0 auto;
		height:620px;
		background: rgb(212, 73, 88,0.02);
		padding:20px;
	}
	.write_container h4{
		text-align:center;
		color:#D44958;
		margin-bottom:50px;
	}
	.write_container p{
		font-size:18px;
		padding-bottom:10px;
	}
	
	article{
		width:600px;
		margin:0 auto;
		
	}
	input[type="text"]{
		width:100%;
		height:45px;
		margin-bottom:40px;
		padding-left:5px;
	}
	
	textarea{
		width:100%;
		height:350px;
		padding:5px;
	}
	
	
	.btn_box{
		text-align:center;
		margin-top:26px;
		margin-bottom:200px;
	}
	.btn{
		display:inline-block;
		width:140px;
		height:auto;
		border:1px solid #D44958;
		text-align:center;
		font-size:20px;
		padding:10px 0;
		cursor:pointer;
		font-weight:600;
	}
	
	.btn_cancel{
		background:#fff;
		color:#D44958;
	}
	.btn_submit{
		background:#D44958;
		color:#fff;
	}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <div class="title">
    	<h1>게시물 작성</h1>
    </div>
    
    <c:if test="${community.cmcode ne null || community.eccode ne null }">
    	<form action="update?boardtype=${boardtype }" method="post">
    </c:if>
    <c:if test="${community.cmcode eq null || community.eccode eq null}">
    	<form action="write?boardtype=${boardtype }" method="post">
    </c:if>
    	<div class="write_container">
    		<h4>일반</h4>
    		<article>
	    		<p>제목</p>
	    		<c:if test="${community.title ne null }">
	    			<input type="text" name="title" value="${community.title }">
	    		</c:if>
	    		<c:if test="${community.title eq null }">
	    			<input type="text" name="title">
	    		</c:if>
	    		<p>내용</p>
	    		<c:if test="${community.content ne null }">
	    			<textarea name="content">${community.content }</textarea>
	    		</c:if>
	    		<c:if test="${community.content eq null }">
	    			<textarea name="content"></textarea>
	    		</c:if>
	    		<input type="hidden" name="writer" value="${sessionScope.logged }">
	    		<input type="hidden" name="boardtype" value="${boardtype }">
	    		<input type="hidden" name="cmcode" value="${community.cmcode }">
    		</article>
    	</div>
    	
    	<div class="btn_box">
    		<c:if test="${community.cmcode eq null }">
    			<input type="submit" value="작성" class="btn_submit btn">
    		</c:if>
    		<c:if test="${community.cmcode ne null }">
    			<input type="submit" value="수정" class="btn_submit btn">
    		</c:if>
    		<a href="openForum" class="btn_cancel btn">취소</a>
    	</div>
    </form>
    
</section>
<footer>
	<%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>