<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
   
</style>
</head>
<body>

<section>
    <h2> 나의 수정 페이지 </h2>
    <hr>
    <div>
    
        <form action="/cs/Update" method="post">
            <input type="hidden" id="title" name="cscode" value="">
            <strong>Title:</strong> <input type="text" id="title" name="title" value="${cs.getTitle()}"><br>   
            <strong>Content:</strong> <textarea id="content" name="content" >${cs.getContent()}</textarea><br>  
            <input type="submit" value="Update">
        </form>
    </div>
</section>
<footer>

</footer>

</body>
</html>