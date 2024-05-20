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
    margin: 0;
    padding: 0;
}
main{
    width:100%;
}
section{
    width: 1240px;
    margin: auto !important;
    display: flex;
    justify-content: center;
    text-align: center;
}
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>

<section>
    <h2> 문의글 작성 페이지 </h2>
     <div class="container">
        <form action="write" method="post">
            <input type="text" name="title" placeholder="title">
            <textarea id="content" name="content" placeholder="content" rows="4" cols="50"></textarea>
            <p>게시물 공개 여부:</p>
            <input type="radio" id="public" name="public_type" value="y"> 
            <label for="public">공개</label><br>
            <input type="radio" id="private" name="public_type" value="n"> 
            <label for="private">비공개</label><br>
            <input type="submit" value="게시물 작성">
        </form>
    </div>
</section>
<footer>

</footer>

</body>
</html>