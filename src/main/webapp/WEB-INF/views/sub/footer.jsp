<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%-- JSTL Core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">
 <style>
    * { 
        margin: 0; 
        padding: 0; 
        box-sizing: border-box; 
    }
    #footer {
        width: 100%;
        margin: 150px auto 0;
        position: relative;
        bottom: 0;
        background-color: #d8d8da;
        padding-bottom: 80px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding:30px;
        z-index:-999;
    }
    #container {
        width: 1240px;
        text-align: center;
    }
    .linked {
        display: flex;
        justify-content: center;
        gap: 20px; 
        margin-bottom: 20px;
        text-align: center;
    }
    .linked a{
        text-decoration: none;
        color: #333;
    }
    .info{
        justify-content: center;
        color: #858383;
    }
    .copyRight{
        margin-top: 20px;
    }
    </style>
</head>
    <div id="footer">
        <div id="container">
            <div class="linked">
                <div class="link"><a href="#">이용 약관</a></div>
                <div class="link"><a href="#">개인정보 처리 방침</a></div>
                <div class="link"><a href="#">쿠키 정책</a></div>
                <div class="link"><a href="/cs/csList">자주 묻는 질문</a></div>
            </div>
            <div class="info">
                <p>주소 : 부산광역시 진구 부전동 그린건물</p>
                <p>이메일 : jobhunter@gmail.com</p>
                <p>전화번호 : 1588-1544</p>
            </div>
            <div class="copyRight">
                <p>ⓒ JobHunter. All rights reserved.</p>
            </div>
        </div>
    </div>
</html>