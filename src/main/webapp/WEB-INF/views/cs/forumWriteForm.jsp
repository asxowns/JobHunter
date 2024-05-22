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

main {
    width: 100%;
}

section {
    width: 80%;
    margin: auto;
    text-align: center;
    margin-top: 50px; /* 폼과 섹션 사이의 간격 조절 */
}

.container {
    width: 300px;
    margin: auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.container form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.container input[type="text"],
.container input[type="submit"],
.container select,
.container textarea,
.container input[type="radio"] {
    margin: 10px 0;
    padding: 10px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.container textarea {
    height: 100px;
}


</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
    <%@ include file="../sub/chat.jsp" %>
<section>
    <h2> 문의글 작성 페이지 </h2>
     <div class="container">
        <form action="/cs/write" method="post">
            <input type="text" name="title" placeholder="title">
            <textarea id="content" name="content" placeholder="content" rows="4" cols="50"></textarea>
            <p>게시물 공개 여부:</p>
            <select name="type" id="type">
                <option id="aa" value="A">문의</option>
                <option id="bb" value="B">신고</option>
            </select>
            <input type="radio" id="public" name="public_type" value="Y">
            <label for="public">공개</label><br>
            <input type="radio" id="private" name="public_type" value="N">
            <label for="private">비공개</label><br>
            <input type="hidden" name="hid" value="${sessionScope.logged}"> 
            <input type="submit" value="게시물 작성">
        </form>
    </div>
</section>
<footer>

</footer>
<script>
     document.getElementById("type").addEventListener("change", function() {
        var type = document.getElementById("type").value;
        var publicRadio = document.getElementById("public");
        var privateRadio = document.getElementById("private");

        if (type.aa.value === "B") {
            publicRadio.checked = false;
            privateRadio.checked = true;
        } else {
            publicRadio.checked = true;
            privateRadio.checked = false;
        }
    });
</script>
</body>
</html>