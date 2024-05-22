<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <style>
        body {
            height: 2000px;
        }
        #chat-container {
            position: fixed;
            bottom: 15%;
            right: 5px;
            width: 400px;
            background-color: #f8c0c0;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #f8c0c0; 
            border-radius: 20px;
            flex-direction: column;
            display: none;
            z-index: 9999;
        }
        .chat-content {
            flex: 10px;
            padding: 20px;
            overflow-y: scroll;
            height: 400px;
        }
        .line {
            display: flex;
            margin-bottom: 10px;
        }
        .chat-box {
            background-color: #fefcfe;
            padding: 10px;
            max-width: 70%;
            border-radius: 10px;
        }
        .mine {
            margin-left: auto;
            background-color: #D44958;
            color: #fff; 
        }
        #text {
            margin-left: 10px;
            margin-right: 5px;
            margin-bottom: 10px;
            width: calc(100% - 80px);
            padding: 10px;
            border: 1px solid #D44958; 
            border-radius: 5px;
            font-size: 16px;
        }
        #send {
            margin-right: 10px;
            margin-left: 5px;
            width: 60px;
            height: 40px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #D44958; 
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        #send:hover {
            background-color: #b23e4e; 
        }
        #chat-switch {
            position: fixed;
            bottom: 5%;
            right: 5px;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #D44958;
            color: #fff;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        .inactive {
            display: block !important;
        }
    </style>
    <div id="chat-container">
        <div class="chat-content">
            <div class="line">
                <span class="chat-box">안녕하세요! 무엇을 도와드릴까요?</span>
            </div>
            <div class="line">
                <span class="chat-box-mine">${chat.message}</span>
            </div>
        </div>
        <form id="chatForm" action="/cs/chat" method="post" style="display: flex;">
            <input type="hidden" name="logged" value="logged">
            <input type="text" id="text" name="message" placeholder="메시지를 입력하세요...">
            <button type="submit" id="send">전송</button>
        </form>
    </div>
    <div id="chat-switch">1:1문의</div>
    <script>

        let Count = 1;
        console.log(Count);
        
        document.getElementById('chatForm').addEventListener('submit',function(event){
            
        })

        const chat_open_btn = document.getElementById('chat-switch');
        
        chat_open_btn.addEventListener('click', () => {
            const box = document.getElementById('chat-container');
            box.classList.toggle('inactive');
            Count++;
            if (Count % 2 === 1) {
                chat_open_btn.innerText  = "1:1문의";
                chat_open_btn.style.backgroundColor = "#D44958";
                chat_open_btn.style.fontSize = "16px";
            } else {
                chat_open_btn.innerText  = "✕";
                chat_open_btn.style.backgroundColor = "gray";
                chat_open_btn.style.fontSize = "24px";
            }
        });

        // 1초 마다 실행할 함수 (chat list 데이터 가져오기)
        function checkUserRole() {
            fetch('/cs/chatList')
                .then(chat => {
                    
                })
                .catch(error => {
                    console.log(error);
                });
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            checkUserRole();
            setInterval(checkUserRole, 1000); // 1초 마다 함수 실행
        });
        
    </script>