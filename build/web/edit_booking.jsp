<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Booking"%>
<!DOCTYPE html>
<%
    Booking booking = (Booking) request.getAttribute("booking");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Booking</title>
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
                font-size: 50px;
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
                font-size: 16px;
                color: #555;
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
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }

            button[type="submit"] {
                background-color: #4caf50;
                color: white;
                border: none;
                margin-right: 10px;
            }

            button[type="submit"]:hover {
                background-color: #388e3c;
            }

            button[type="button"] {
                background-color: #f44336;
                color: white;
                border: none;
            }

            button[type="button"]:hover {
                background-color: #d32f2f;
            }
        </style>

    </head>
    <body>
        <h2>Edit Booking</h2>
        <div class="containerAll">
        <form action="Booking_admin" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= booking.getBooking_ID() %>">

            <label>Booking Date:</label>
            <input type="text" name="bookingDate" value="<%= booking.getBookingDate() %>" required><br>

            <label>Ticket ID:</label>
            <input type="number" name="ticketId" value="<%= booking.getTicket_ID() %>" required><br>

            <label>User ID:</label>
            <input type="number" name="userId" value="<%= booking.getUser_ID() %>" required><br>

            <label>Status:</label>
            <input type="text" name="bookingStatus" value="<%= booking.getBooking_Status() %>" required><br>

            <button type="submit">Update</button>
            <button type="button" onclick="window.history.back();">Cancel</button>
        </form>
        </div>
    </body>
</html>
