<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Road</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                                background-color: #f3f6fa;

            }

            .containerAll {
                background-color: #f3f6fa;
                display: flex;
                justify-content: center;
                align-items: flex-start;
                min-height: 100vh;
                padding-top: 20px;
            }

            h2 {
                color: #333;
                font-size: 45px;
                margin-bottom: 20px;
                text-align: center;
                width: 100%;
                font-weight: bold;
            }

            form {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 500px;
                margin-top: 20px;
            }

            p {
                margin-bottom: 15px;
            }

            label {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="number"] {
                padding: 10px;
                border: 1px solid #d1d5db;
                border-radius: 5px;
                width: 100%;
                font-size: 16px;
                color: #333;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus,
            input[type="number"]:focus {
                border-color: #3f51b5;
                outline: none;
            }

            input[type="submit"],
            button[type="button"] {
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 5px;
                cursor: pointer;
                background-color: #4caf50; /* Màu xanh lá cho nút Insert */
                color: white;
                border: none;
                transition: background-color 0.3s ease;
                width: 100%;
                max-width: 200px;
                margin-top: 10px;
                display: block;
                margin-left: auto;
                margin-right: auto;
            }

            input[type="submit"]:hover {
                background-color: #388e3c; /* Màu xanh đậm hơn khi hover */
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
        <h2>Insert New Road</h2>
        <div class="containerAll">
            <form action="Road_admin" method="POST">
                <input type="hidden" name="action" value="insert" />
                Start: <input type="text" name="start" required /><br/>
                End: <input type="text" name="end" required /><br/>
                Price: <input type="number" name="price" required /><br/>
                Pickup Location: <input type="text" name="pickupLocation" required /><br/>
                Drop Location: <input type="text" name="dropLocation" required /><br/>
                <input type="submit" value="Insert"></input>
                <button type="button" onclick="window.history.back();">Cancel</button>
            </form>
        </div>
    </body>
</html>
