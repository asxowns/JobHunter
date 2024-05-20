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
	main{
		width:800px;
		margin:0 auto;
	}
	
	#forum_tap{
		border-bottom:1px solid #eee;
		padding-bottom:20px;
	}
	#forum_tap ul{
		display:flex;
		justify-content:center;
		text-align:center;
	}
	#forum_tap ul li{
		width:190px;
		padding:14px 0;
		cursor:pointer;
		font-size:20px;
	}
	
	#forum_tap #open{
		border:1px solid #D44958;
		background:#D44958;
		color:#fff;
	}
	#forum_tap #enterprise{
		border:1px solid #EFEFEF;
		background:#fff;
		colod:#D44958;
	}
	
	
	#search_area{
		width:100%;
		height:40px;
		margin:0 auto;
		display:flex;
		padding:20px 0;
		position:relative;
		border-bottom:1px solid #efefef;
	}
	.search_area_select{
		position:absolute;
		left:218px;
		top:28px;
		border-right:1px solid #969696;
	}
	.search_area_select select{
		border:none;
		cursor:pointer;
	}
	.search_area_select select:focus{
	outline:none;
}
	
	#submit_label{
		position:absolute;
		top:29px;
		right:220px;
		cursor:pointer;
	}
	
	input[type="text"]{
		width:380px;
		margin:0 auto;
		height:100%;
		border:1px solid #969696;
		padding-left:100px;
		box-sizing:border-box;
		cursor:pointer;
		border-radius:5px;
	}
	input[type="submit"]{
		display:none;
	}
	
	#list_area{
	}
	#list_area a{
		display:block;
		padding:10px;
		border-bottom:1px solid #efefef;
	}
	#list_area a p{
		font-size:12px;
		color:#9e9e9e;
	}
	#list_area a h2{
		padding:5px 0;
	}
	#list_area a h4{
		font-size:13px;
	}
	
	.list_bottom{
		display:flex;
		justify-content:space-between;
	}
	.list_bottom_info{
		display:flex;
		align-items:center;
	}
	.list_bottom_info p{
		height:20px;
		display:flex;
		padding-left:5px;
	}
	
	.write_btn{
		margin-top:50px;
	}
	.write_btn a{
		display:inline-block;
		float:right;
		background:#fff;
		border:1px solid #D44958;
		color:#D44958;
		padding:11px 25px;
	}
	.write_btn a:hover{
		background:#d44958;
		color:#fff;
	}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
		<main>
		    <div class="title">
		    	<h1>일반 게시판</h1>
		    </div>
		    
		    <div id="forum_tap">
		    	<ul>
		    		<a href="openForum"><li id="open">일반</li></a>
		    		<a href="enterpriseForum"><li id="enterprise">기업</li></a>
		    	</ul>
		    </div>
		    
		    <div id="search_area">
			    <div class="search_area_select">
			    	<select>
				    	<option>제목+내용</option>
				    	<option>제목</option>
				    	<option>내용</option>
			    	</select>
			    </div>
		    	<input type="text" name="search">
		    	<label for="submit" id="submit_label">
		    		<img src="/resource/img/search_gray.png">
		    		<input type="submit" value="" id="submit">
		    	</label>
		    </div>
		    
		    <div id="list_area">
		    	<c:forEach var="com" items="${list }">
		    		<a href="forumDetail?cmcode=${com.cmcode }">
			    		<p>${com.regdate }</p>
			    		<h2>${com.title }</h2>
			    		<h4>
			    		<div class="list_bottom">
				    		<div>
					    		<span></span>
					    		<span>작성자1</span>
				    		</div>
				    		<div class="list_bottom_info">
				    			<p>
				    				<img src="/resource/img/view_icon.png">
				    				<span>11</span>
				    			</p>
				    			<p>
				    				<img src="/resource/img/reply_icon.png">
				    				<span>22</span>
				    			</p>
				    		</div>
			    		</div>
			    		</h4>
		    		</a>
		    	</c:forEach>
		    </div>
		    
		    <div class="write_btn">
		    	<a href="/board/forumWriteForm?boardtype=1">글쓰기</a>
		    </div>
	    
	    </main>
</section>
<footer>

</footer>

</body>
</html>