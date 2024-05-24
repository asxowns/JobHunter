<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
* {
	margin: 0;
	padding: 0;
}
body {
	font-size: 16px;
	color: #333;
}
.title {
	width: 100%;
	margin-top: 100px;
}
.title h1 {
	text-align: center;
	margin-bottom: 75px;
}  
section {
	width: 1240px;
	margin: 0 auto;
}
main {
	width: 800px;
	margin: 0 auto;
	border-top: 1px solid #B6B6B6;
	border-bottom:1px solid #B6B6B6;
	position: relative;
	padding-bottom:150px;
}
.csDetail{
    display: flex;
    justify-content:space-between;
	align-items: center;
	margin-top: 50px;
}
.csDetail_user{
    display: flex;
    align-items:center;
}
.views{
    display: flex;
    height:24px;
}
.views img{
    display:inline-block;
    padding-right: 5px;
}
.userImg{
    background: #ccc;
	width: 45px;
	height: 45px;
	border-radius: 50%;
	margin-right: 13px; 
}
main b {
    color: #D44958;
	font-size: 15px;
	font-weight: 500;
	background: #fff;
	position: absolute;
	top: -10px;
	left: 30px;
	padding: 0px 8px;
    font-weight: bold;
}
.title{
    padding:25px 0;
    font-size:30px;
}
.content{
    font-weight:500;
}
#main-bottom{
    width:800px;
    margin:0 auto;
}
.reply_count{
    padding:10px 0;
    color:#848484;
}
.reply_box{
    width:800px;
	height:150px;
	border:1px solid #b6b6b6;
	border-radius:5px;
	display:flex;
	flex-direction:column;
	position:relative;
	padding:30px 60px;
	box-sizing:border-box;
}
.reply_box input[type="text"]{
    width:100%;
	margin:0 auto;
	height:50px;
	border:1px solid #B6B6B6;
	background: rgb(212, 73, 88,0.05);
	padding-left:5px;
}
.reply_box input[type="submit"]{
    display:inline-block;
    width:110px;
    color:#fff;
    background:#D44958;
    border:1px solid #d44958;
	border-radius:5px;
	padding:10px 0;
	cursor:pointer;
	position:absolute;
	right:60px;
	bottom:15px;
}
.reply_box input[type="submit"]:hover {
    background-color: #A6303E;
    color: white;
}
#reply-list{
	width:800px;
	margin:40px auto 20px;
	border-bottom:1px solid #B6B6B6;
	padding-bottom:15px;
}
#reply_list .img{
	display:inline-block;
	width:35px;
	height:35px;
	background:#ccc;
	border-radius:50%;
	margin-right:10px;
}
.reply_myinfo{
	display:flex;
	align-items:center;
	padding-bottom:15px;
}
.reply_content{
	display:flex;
	justify-content:space-between;
}
.reply_content h4{
	font-size:16px;
	font-weight:400;
}
.reply_content h5{
	font-weight:400;
	color:#aaa;

}
.Update-delete-btn {
    margin-top: 20px; 
    text-align: right; 
}

.Update-delete-btn a {
    margin-left: 10px;
    padding: 5px 10px;
    border: 1px solid #D44958;
    border-radius: 3px;
    color: #D44958;
    
}

.Update-delete-btn a:hover {
    background-color: #A6303E;
    color: white;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
    <%@ include file="../sub/chat.jsp" %>
<section>
<div class="title">
    <h1> 고객 센터 </h1>
</div>

    <main>
    <b>문의 / 신고</b>
        <div class="csDetail">
            <div class="csDetail_user">
                <div class="userImg">
                    <img src="">
                </div>
                <p class="name">${cs.getHid().getMemberid()}</p>
                <p class="views">
                    <img src="/resource/img/view_icon.png">22
                </p>
            </div>
            <div class="csdate">
                <p>${cs.getCsdate()}</p>
            </div>
        </div>
            <h1 class="title">${cs.getTitle()}</h1>
            <h4 class="content">${cs.getContent()}</h4>
    </main>
    
    <div id="main-bottom">
        <p class="reply_count">2개의 댓글</p>
        <div class="reply_box">
            <form action="/cs/regReply" method="get">
                <input type="text" name="comment" >
                <input type="hidden" name="writermanager" value="${sessionScope.logged}" >
                <input type="hidden" name="cscode" value="${cs.getCscode()}">
                <input type="submit" value="댓글 작성">
            </form> 
        </div>
		<div class="Update-delete-btn">
            <c:if test="${sessionScope.logged eq cs.hid.memberid || fn:trim(sessionScope.role) eq 'm'}">
                <a href="/cs/forumUpdateForm?cscode=${cs.cscode}">수정</a> 
                <a href="/cs/delete?cscode=${cs.cscode}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
            </c:if>
        <div>
    <div>
    <c:forEach var="csreply" items="${list}" varStatus="stat">
		<div id="reply-list">
		    <div class="reply_myinfo">
				<span class="img">
					<img src="">
				</span>
				<p>${stat.count}.${csreply.getWritermanager().getMemberid()}</p>
			</div>
			<div class="reply_content">
				<h4>${csreply.getComment()}</h4>
				<h5>${csreply.getLocaldate()}</h5>
			</div>
		</div>
	</c:forEach>

</section>
<footer>
	<%@ include file="../sub/footer.jsp" %>
</footer>
<script>

</script>
</body>
</html>