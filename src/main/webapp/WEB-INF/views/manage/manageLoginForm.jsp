<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
    body {
        background-color: black;
        color: white;
        text-align: center;
        padding: 50px;
        font-size: 16px;
    }
    #manage-login-btn{
        background-color:whitesmoke ;
        color:black;
    }
    #manage-login-form{
        min-height:250px;
        margin: 20px auto;
    }
    a{
        font-weight:bold;
        font-size:larger;
    }
</style>
</head>
<body>
<header>
</header>
<section>
    <h2> Management System</h2>
    <div id="manage-login-form">
    <form action="/manage/manageLogin" method="post">
        <input type="text" name="id">
        <input type="password" name="pwd">
        <input id="manage-login-btn" type="submit" value="확인">
    </form>
    </div>
    <a href="/"> Go back Home </a>

    
</section>
<footer>

</footer>

</body>
</html>