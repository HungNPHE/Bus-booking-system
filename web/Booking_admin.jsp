<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Booking"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%
  List<Booking> lst = (List<Booking>) request.getAttribute("lst");
%>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Bookings</title>
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
        display: inline-flex;
        gap: 10px;
        align-items: center;
        margin-bottom: 20px;
    }

    form input[type="text"] {
        padding: 8px;
        border: 1px solid #d1d5db;
        border-radius: 4px;
        width: 200px;
    }

    form input[type="submit"],
    form button {
        padding: 8px 15px;
        background-color: #4caf50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    form input[type="submit"]:hover,
    form button:hover {
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

    .back-button {
        padding: 10px 15px;
        margin-top: 20px;
        background-color: #333;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .back-button:hover {
        background-color: #555;
    }
</style>

    </head>
    <body>
        <h2> List of Bookings </h2>
        <p><a href="insert_booking.jsp">Add New Booking</a></p> 

        <form action="Booking_admin" method="POST" style="display:inline;">
            <input type="hidden" name="action" value="checkDate">
            <button type="submit">Update Booking Status</button>
        </form>

        <form action="Booking_admin" method="POST">
            <input type="hidden" name="action" value="search">
            <label for="date">Booking Date: </label>
            <input type="text" name="date" placeholder="yyyy-MM-dd">
            <input type="submit" value="Search by Date">
        </form>

        <br>

        <table border="1" cellpadding="10" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Booking Date</th>
                <th>Ticket ID</th>
                <th>User ID</th>
                <th>Booking Status</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <%
              for(Booking x: lst) {
            %>
            <tr>
                <td><%= x.getBooking_ID() %></td>
                <td><%= x.getBookingDate() %></td>
                <td><%= x.getTicket_ID() %></td>
                <td><%= x.getUser_ID() %></td>
                <td><%= x.getBooking_Status() %></td>
                <td>
                    <a href="Booking_admin?action=edit&id=<%= x.getBooking_ID() %>">Edit</a> <!-- Edit link -->
                </td>
                <td>
                    <a href="Booking_admin?action=delete&id=<%= x.getBooking_ID() %>" 
                       onclick="return confirm('Are you sure you want to delete this booking?');">Delete</a> <!-- Delete link with confirmation -->
                </td>
            </tr>  
            <% } %>
        </table>     
        <p><button onclick="window.history.go(-1);">Back to previous page</button></p>
    </body>
</html>
