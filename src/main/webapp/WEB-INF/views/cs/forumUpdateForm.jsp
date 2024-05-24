<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
.write-container{
	width:700px;
	margin:0 auto;
	height:620px;
	background: #rgb(212, 73, 88,0.02);
	padding:20px;
}
.write-container{
    font-size:18px;
    padding-bottom:10px;
}
.type_text{
    margin-bottom:10px;
    font-family: Arial, sans-serif;
}
.title_text{
    margin-bottom:10px;
    font-family: Arial, sans-serif;
}
.content_text{
    margin-bottom:10px;
    font-family: Arial, sans-serif;
}
#type {
    width: 120px;
    height: 45px;
    text-align:center;
    margin-bottom: 40px;
    font-family: Arial, sans-serif;
}
input[type="text"]{
    width: 700px;
    height: 45px;
    box-sizing:border-box;
    margin-bottom: 40px;
    font-family: Arial, sans-serif;
}
textarea{
    width:700px;
    height:350px;
    padding:5px;
    box-sizing:border-box; 
    font-family: Arial, sans-serif;
}
.btn_box{
	text-align:center;
	margin-top:60px;
	margin-bottom:200px;
}
.btn_submit{
    display:inline-block;
	width:140px;
	height:auto;
	border:1px solid #D44958;
	text-align:center;
	font-size:20px;
	padding:10px 0;
	cursor:pointer;
	font-weight:600;
    background:#D44958;
	color:#fff;
}
.btn_cancel{
    display:inline-block;
	width:140px;
	height:auto;
	border:1px solid #D44958;
	text-align:center;
	font-size:20px;
	padding:10px 0;
	cursor:pointer;
	font-weight:600;
    background:#fff;
	color:#D44958;
}
.btn_submit:hover, .btn_cancel:hover {
    background-color: #A6303E;
    color: #fff;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
    <%@ include file="../sub/chat.jsp" %>
<section>
    <br>
    <div class="title">
        <h1>문의 수정</h1>
    </div><br>
    <div class="write-container">
        <form action="/cs/Update" method="post">
            <p class="title_text">제목</p>
            <input type="text" name="title" placeholder="제목을 입력하세요...">
            <p class="content_text">내용</p>
            <textarea id="content" name="content" placeholder="내용을 입력하세요..." rows="4" cols="50"></textarea>
            <input type="hidden" name="hid" value="${sessionScope.logged}"> 
            <input type="hidden" name="cscode" value="${cs.getCscode()}">
            <input type="hidden" name="type" value="${cs.getType()}">
            <input type="hidden" name="publictype" value="${cs.getPublictype()}">
            <div class="btn_box">
                <input type="submit" value="수정" class="btn_submit">
                <input type="button" class="btn_cancel" onclick="goCsList()" value="취소">
            </div>
        </form>
    </div>
</section>
<footer>
    <%@ include file="../sub/footer.jsp" %>
</footer>
<script>
    document.getElementById("type").addEventListener("change", function() {
        const type = document.getElementById("type").value;
        const publicRadio = document.getElementById("public");
        const privateRadio = document.getElementById("private");

        if (type === "B") {
            publicRadio.checked = false;
            publicRadio.disabled = true;
            privateRadio.checked = true;
        } else {
            publicRadio.checked = true;
            publicRadio.disabled = false; 
        }
    });

    function goCsList() {
        if (confirm("문의 게시판으로 돌아가시겠습니까?")) {
            window.location.href = "/cs/csList";
        }
    }


</script>
</body>
</html>