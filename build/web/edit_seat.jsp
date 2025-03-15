<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Seat_2"%>
<%
    Seat_2 seat = (Seat_2) request.getAttribute("seat");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Seat</title>
        <style>
    body{
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

    input[type="number"],
    input[type="text"],
    input[type="date"] {
        padding: 10px;
        border: 1px solid #d1d5db;
        border-radius: 5px;
        width: 100%;
        font-size: 16px;
        color: #333;
        transition: border-color 0.3s;
    }

    input[type="number"]:focus,
    input[type="text"]:focus,
    input[type="date"]:focus {
        border-color: #3f51b5;
        outline: none;
    }

    input[type="submit"] {
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
        background-color: #2196f3;
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
        background-color: #1976d2;
    }
</style>

    </head>
    <body>
        <h2>Edit Seat</h2>
        <div class="containerAll">
        <form action="Seat_admin" method="POST">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="id" value="<%= seat.getSeatDetails_ID() %>"/>
            <p>Seat ID <input type="number" name="number" value="<%= seat.getSeat_ID() %>"/></p>
            <p>Date  <input type="date" name="date" value="<%= seat.getDate() %>"/></p>
            <p>Status: <input type="text" name="status" value="<%= seat.getStatus() %>"/></p>
            <p><input type="submit" value="Update"/></p>
        </form>
        </div>
    </body>
</html>
