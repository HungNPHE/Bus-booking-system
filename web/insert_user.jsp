<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert User</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }

            body {
                background-color: #f4f4f4;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }

            h2 {
                color: #333;
                margin-bottom: 20px;
                font-size: 45px;
            }

            .containerAll {
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #66afe9;
                outline: none;
            }

            input[type="submit"] {
                background-color: #5cb85c;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                margin-left: 125px;
                width: 90px;
            }

            input[type="submit"]:hover {
                background-color: #4cae4c;
            }
            
            button[type="button"] {
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 5px;
                cursor: pointer;
                background-color: #4caf50; /* Màu xanh lá cho nút Add SeatDetail */
                color: white;
                border: none;
                transition: background-color 0.3s ease;
                width: 100%;
                max-width: 90px;
                margin-top: 10px;
                display: block;
                margin-left: auto;
                margin-right: auto;
            }
            button[type="button"] {
                background-color: #f44336; /* Màu đỏ cho nút Cancel */
            }

            button[type="button"]:hover {
                background-color: #d32f2f; /* Màu đỏ đậm hơn khi hover */
            }
        </style>


    </head>
    <body>
        <h2>Add New User</h2>
        <div class="containerAll"
             <form action="User_admin?action=insert" method="post">
            Full Name: <input type="text" name="fullName" required><br>
            Phone: <input type="text" name="phone" required><br>
            Password: <input type="password" name="password" required><br>
            Role: <input type="text" name="role" required><br>
            <input type="submit" value="Save">
            <button type="button" onclick="window.history.back();">Cancel</button>
            </form>
        </div>
    </body>
</html>
