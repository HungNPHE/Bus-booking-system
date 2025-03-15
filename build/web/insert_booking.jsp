<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Booking</title>
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

            label {
                font-weight: bold;
                margin-bottom: 5px;
                display: block;
            }

            input[type="text"],
            input[type="number"] {
                padding: 10px;
                border: 1px solid #d1d5db;
                border-radius: 5px;
                width: 100%;
                font-size: 16px;
                color: #333;
                margin-bottom: 15px;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus,
            input[type="number"]:focus {
                border-color: #3f51b5;
                outline: none;
            }

            button[type="submit"],
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

            button[type="submit"]:hover {
                background-color: #388e3c; /* Màu xanh đậm hơn khi hover */
            }

            button[type="button"] {
                background-color: #f44336; /* Màu đỏ cho nút Cancel */
            }

            button[type="button"]:hover {
                background-color: #d32f2f; /* Màu đỏ đậm hơn khi hover */
            }

            p {
                text-align: center;
                margin-top: 20px;
            }

            a {
                color: #2196f3;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>

    </head>
    <body>
        <h2>Insert New Booking</h2>
        <div class="containerAll">
            <form action="Booking_admin" method="POST">
                <input type="hidden" name="action" value="insert">

                <label>Booking Date:</label>
                <input type="text" name="bookingDate" placeholder="YYYY-MM-DD" required><br>

                <label>Ticket ID:</label>
                <input type="number" name="ticketId" required><br>

                <label>User ID:</label>
                <input type="number" name="userId" required><br>

                <label>Status:</label>
                <input type="text" name="bookingStatus" required><br>

                <button type="submit">Insert</button>
                <button type="button" onclick="window.history.back();">Cancel</button>
            </form>
        </div>
    </body>
</html>
