<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Seat_2" %>
<%@page import = "java.util.*" %>
<!DOCTYPE html>
<%
  List<Seat_2> lst = (List<Seat_2>) request.getAttribute("lst");
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seat List</title>
        <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
        background-color: #f0f4f8;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }

    a:hover {
        color: #0056b3;
        text-decoration: underline;
    }

    form {
        display: flex;
        gap: 10px;
        align-items: center;
        margin-bottom: 20px;
    }

    form label {
        font-weight: bold;
        color: #333;
    }

    input[type="text"] {
        padding: 8px;
        border: 1px solid #d1d5db;
        border-radius: 4px;
        width: 200px;
    }

    input[type="submit"] {
        padding: 8px 15px;
        background-color: #4caf50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #388e3c;
    }

    table {
        width: 100%;
        max-width: 800px;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        margin-top: 10px;
    }

    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #e5e7eb;
    }

    th {
        background-color: #3f51b5;
        color: white;
        font-size: 16px;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    td a {
        color: #007bff;
        font-weight: bold;
        padding: 5px 10px;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }

    td a:hover {
        background-color: #f0f4f8;
    }

    .back-link {
        margin-top: 20px;
        color: #333;
        font-size: 16px;
    }

    .back-link:hover {
        color: #000;
    }
</style>

    </head>

    <body>
        <h2>List of Seats Detail</h2>
        <p><a href="insert_seat.jsp">Add New Seat</a></p>

        <form action="Seat_admin" method="POST">
            <input type="hidden" name="action" value="search">
            <label for="date">Booking Date: </label>
            <input type="text" name="date" placeholder="yyyy-MM-dd">
            <input type="submit" value="Search by Date">
        </form>

        <br>


        <table border="1" cellpadding="10" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Seat ID</th>
                <th>Date </th>
                <th>Status</th>
                <th colspan="2">Actions</th>
            </tr>

            <%
              for (Seat_2 x : lst) {
            %>
            <tr>
                <td><%= x.getSeatDetails_ID() %></td>
                <td><%= x.getSeat_ID() %></td>
                <td><%= x.getDate() %></td>
                <td><%= x.getStatus() %></td>
                <td>
                    <a href="Seat_admin?action=edit&id=<%= x.getSeatDetails_ID() %>">Edit</a>
                </td>
                <td>
                    <a href="Seat_admin?action=delete&id=<%= x.getSeatDetails_ID() %>" 
                       onclick="return confirm('Are you sure you want to delete this seat?');">Delete</a>
                </td>
            </tr>
            <% } %>  
        </table>

        <a href="admin.jsp">Back to previous page</a>
    </body>
</html>
