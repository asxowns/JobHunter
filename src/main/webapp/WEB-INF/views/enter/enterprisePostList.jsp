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
  button {
    	width: 80px; /* 버튼 너비 조절 */
    	height: 50px; /* 버튼 높이 조절 */
    	font-size: 16px; /* 폰트 크기 조절 */
    	background-color: white; /* 버튼 배경 색상 흰색으로 설정 */
    	color: black; /* 텍스트 색상 검정으로 설정 */
    	border: 1px solid black; /* 버튼 테두리 설정 */
    	border-radius: 5px; /* 버튼 모서리 둥글게 */
    	cursor: pointer; /* 커서 변경 */
    }
    button:hover {
    	background-color: #f0f0f0; /* 호버 시 버튼 배경 색상 변경 */
    }
    td {
            padding: 15px; /* 셀 내부 패딩 설정 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }
</style>
</head>
<body>
<header>
    <%@ include file="../sub/header.jsp" %>
</header>
<section>
    <h2> enterprisePostList page </h2>
    <br>
    <div class="container">
    <div><a href="/enter/enterprisePostWriteForm?formType=register"><button>채용공고등록</button></a></div>
    <div>
    <table border="1">
    <c:forEach var="posting" items="${posting }">
    	<tr>
    		<td>${posting.postcode }</td>
    		<td>${posting.title }</td>   
    		<td>${posting.regdate }
    		<td>
    			<a href="/enter/hunterPerPostList?postcode=${posting.postcode }"><button>지원자보기</button></a>
    			<a href="/enter/enterprisePostWriteForm?postcode=${posting.postcode }"><button>수정</button></a>
    			<a href="/enter/enterprisePostDelete?postcode=${posting.postcode }"><button>삭제</button></a>
    		</td>
    	</tr>
    </c:forEach>	
    </table>
    </div>
    </div>
</section>
<footer>
    <%@ include file="../sub/footer.jsp" %>
</footer>

</body>
</html>