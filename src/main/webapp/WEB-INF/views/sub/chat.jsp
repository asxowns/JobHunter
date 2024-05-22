<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<head>
<!-- 폰트 첨부 -->
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
            display: flex;
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
        .active {
            display: block !important;
        }
    </style>
</head>
<body>
    <div id="chat-container">
        <div class="chat-content">
            <div class="line">
                <span class="chat-box">안녕하세요! 무엇을 도와드릴까요?</span>
            </div>
            <div class="line">
                <span class="chat-box mine">이름이 이상해요</span>
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

        const btn = document.getElementById('chat-switch');
        
        btn.addEventListener('click', () => {
            const box = document.getElementById('chat-container');
            box.classList.toggle('active');
            Count++;
            if (Count % 2 === 1) {
                btn.innerText  = "1:1문의";
                btn.style.backgroundColor = "#D44958";
                btn.style.fontSize = "16px";
            } else {
                btn.innerText  = "✕";
                btn.style.backgroundColor = "gray";
                btn.style.fontSize = "24px";
            }
        });

        // AJAX를 이용한 채팅 업데이트
        document.addEventListener("DOMContentLoaded", function() {
            const chatContent = document.getElementById("chat-content");
            const sendButton = document.getElementById("send");

            // 전송 버튼 클릭 시 AJAX 호출
            sendButton.addEventListener("click", function(event) {
                event.preventDefault(); // 기본 동작 중지
                const messageInput = document.getElementById("text").value;
                const xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            // 채팅 메시지 업데이트
                            chatContent.innerHTML = xhr.responseText;
                        } else {
                            console.error('요청 실패:', xhr.status);
                        }
                    }
                };
                xhr.open("POST", "/cs/chat");
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("message=" + encodeURIComponent(messageInput));
            });

            // 페이지 로드 후 초기 채팅 메시지 가져오기
            const xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // 채팅 메시지 업데이트
                        chatContent.innerHTML = xhr.responseText;
                    } else {
                        console.error('요청 실패:', xhr.status);
                    }
                }
            };
            xhr.open("GET", "/cs/chat");
            xhr.send();
        });
    </script>
</body>
</html>