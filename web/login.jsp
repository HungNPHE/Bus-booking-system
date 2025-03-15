<%-- 
    Document   : login
    Created on : Oct 11, 2024, 10:49:45 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-image: url(https://wallpapers.com/images/hd/chill-4k-pink-cloud-16lb8cbx2mrqijjz.jpg); /* Thay đổi đường dẫn tới ảnh nền */
                background-size: cover;
                background-position: center;
            }

            .login-register-container {
                text-align: center;
                color: white;
                background: rgba(0, 0, 0, 0.2);
                padding: 20px 40px;
                border-radius: 8px;
                max-width: 450px;
                width: 100%;
                margin: auto;
            }


            .form-container h2 {
                color: #ccc;
                font-size: 1.5em;
                margin-bottom: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                color: #ffffff;
                margin: 10px 0 5px;
            }

            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px;
                background: rgba(0,0,0,0.3);
                border: none;
                border-radius: 5px;
                color: white;
                margin-bottom: 15px;
            }

            button {
                padding: 10px;
                background: #fff;
                color: black;
                border: none;
                border-radius: 5px;
                font-weight: bold;
                cursor: pointer;
            }

            button:hover {
                background: #ddd;
            }

            .error, .notification {
                margin-top: 10px;
            }

            .error {
                color: red;
            }

            .notification {
                color: green;
            }

            .register-link {
                color: #ffffff;
                text-decoration: none;
                margin-top: 10px;
                display: inline-block;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>

            </h1>
        </div>
        <div class="login-register-container">
            <div class="form-container">
                <!-- Đăng nhập -->
                <div class="login">
                    <h2>Log in</h2>
                    <form action="login?action=login" method="post">
                        <label for="username">Phone number:</label>
                        <input type="text" id="phonenumber" name="phonenumber" required>
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                        <button type="submit">Log In</button>
                    </form>
                    <div style="color: red">${error}</div>
                </div>
                <a class="register-link" href="register.jsp">Đăng ký</a>
                <div style="color: #00ffcc">${nofitication} </div>
            </div>
        </div>
    </body>
</html>
