<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
<style>
	body, html {
    height: 100%;
    margin: 0;
  }
  .container, h2 {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column; 
  }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> hunterResumeList page </h2>   <!-- 해당 인재의 이력서 리스트에서 클릭한 이력서 디테일 페이지 이동, 포지션 제안 버튼 -->
    
</section>
<footer>
  <%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>