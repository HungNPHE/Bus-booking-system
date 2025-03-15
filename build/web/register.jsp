<%-- 
    Document   : register
    Created on : Oct 31, 2024, 9:00:29 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        .register {
            background: rgba(0, 0, 0, 0.2); /* Nền bán trong suốt */
            padding: 20px 40px;
            border-radius: 8px;
            max-width: 450px;
            width: 100%;
            color: white;
            text-align: center;
        }

        .register h2 {
            color: #ccc;
            font-size: 1.5em;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            color: #ccc;
            margin: 10px 0 5px;
            text-align: left;
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

        .login-link {
            color: #32CD32;
            text-decoration: none;
            margin-top: 10px;
            display: inline-block;
        }

        .login-link:hover {
            text-decoration: underline;
        }
    </style>
    </head>
    <body>
         <!-- Đăng ký -->
                <div class="register">
                    <h2>Register</h2>
                    <form action="register" method="post">
                        <label for="new_fullname">Full Name:</label>
                        <input type="text" id="new_fullname" name="new_fullname" required>
                        <label for="new_phonenumber">Phone number:</label>
                        <input type="text" id="new_phonenumber" name="new_phonenumber" required>
                        <span style="color: #ff0033" style="font-size: 10px;">${registerError}</span>
                        <label for="new_password">Password:</label>
                        <input type="password" id="new_password" name="new_password" required>
                        <button type="submit">Register</button>
                    </form>
                    <a href="login.jsp" class="login-link">Đăng nhập</a>
                </div>
                
    </body>
</html>
