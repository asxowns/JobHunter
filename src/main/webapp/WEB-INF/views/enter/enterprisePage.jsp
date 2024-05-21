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
    <h2> enterprise page (${sessionScope.logged })</h2>
    <br>
	<a href="/enter/enterprisePostList"><button>채용공고관리</button></a>
	<a href="/enter/enterpriseInfoWriteForm"><button>기업정보관리</button></a>
	<a href="/enter/hunterList"><button>인재정보관리</button></a>
</section>
<footer>

</footer>

</body>
</html>
