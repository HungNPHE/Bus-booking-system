<%-- 
    Document   : profile
    Created on : Oct 20, 2024, 10:55:06 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            body {
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #1e1e1e; 
                height: 100vh;
            }
            .snowflake {
                position: absolute;
                top: -10px;
                background-color: white;
                opacity: 0.8;
                border-radius: 50%;
                pointer-events: none;
                
            }
            #snow-container {
                position: fixed; /* Đặt vị trí cố định */
                top: 0;
                left: 0;
                width: 100%;
                height: 100%; /* Đảm bảo chiều cao đầy đủ */
                pointer-events: none; /* Không chặn các sự kiện chuột */
            }

            .animated-text {
                font-size: 48px;
                font-weight: bold;
                background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);
                -webkit-background-clip: text;
                color: transparent;
                animation: changeColors 3s infinite;
                text-align: center;
            }

            @keyframes changeColors {
                0% {
                    background-position: 0%;
                }
                100% {
                    background-position: 100%;
                }
            }

            p {
                color: white;
                font-size: 25px;
                margin-left: 80px;
            }


            .box {
                border-radius: 10px; /* Làm tròn góc */
                border: 1px dashed green;
                background-color: #333333;
                
            }
            
            a{
                text-decoration: none;
                color: white;
                font-size: 20px;
                margin-left: 20px;
                
            }
        </style>
    </head>
    <body>

        <div class="box">
            <a href="index.jsp">Home</a>
            <h1 class="animated-text">Thông tin người dùng</h1>
            <p>Họ tên: ${sessionScope.account_info.fullname}</p>
            <p>Số điện thoại/Tài khoản: ${sessionScope.account_info.phoneNumber}</p>
            <p>Mật khẩu: ${sessionScope.account_info.password}</p>
            <p>Vai trò: ${sessionScope.account_info.role}</p>
        </div><!-- comment -->


        <div id="snow-container"></div>

        <script >
            console.log("JavaScript is running");
            const snowContainer = document.getElementById('snow-container');

            function createSnowflake() {
                const snowflake = document.createElement('div');
                snowflake.classList.add('snowflake');

                // Random kích thước, vị trí và thời gian rơi
                const size = Math.random() * 10 + 5 + 'px';
                const left = Math.random() * window.innerWidth + 'px';
                const animationDuration = Math.random() * 5 + 3; // thời gian rơi ngẫu nhiên từ 3s đến 8s

                snowflake.style.width = size;
                snowflake.style.height = size;
                snowflake.style.left = left;
                snowflake.style.animationDuration = animationDuration + 's'; // Thêm 's' vào thời gian

                snowContainer.appendChild(snowflake);

                // Animation rơi của hạt tuyết
                snowflake.animate([
                    {transform: 'translateY(0)'}, // Bắt đầu từ vị trí 0
                    {transform: `translateY(${window.innerHeight}px)`} // Kết thúc tại chiều cao cửa sổ
                ], {
                    duration: animationDuration * 1000, // Chuyển đổi thành milliseconds
                    iterations: 1,
                    fill: 'forwards' // Đảm bảo hạt tuyết giữ vị trí cuối cùng sau khi rơi
                });

                // Xóa hạt tuyết sau khi rơi xong
                setTimeout(() => {
                    snowflake.remove();
                }, animationDuration * 1000);
            }

            // Tạo tuyết rơi liên tục
            setInterval(createSnowflake, 100);
        </script>

    </body>
</html>
