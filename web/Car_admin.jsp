<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Car" %>
<%@page import = "java.util.*" %>
<!DOCTYPE html>
<%
    List<Car> lst = (List<Car>) request.getAttribute("lst");  // Lấy danh sách xe từ Servlet
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Cars</title>
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
        <h2>List of Cars</h2>
        <p><a href="insert_car.jsp">Insert New Car</a></p>

        <!-- Form Search Car by Road Name -->
        <form action="Car_admin" method="POST">
            <input type="hidden" name="action" value="searchByRoadName">
            <label for="roadName">Road Name: </label>
            <input type="text" name="roadName" placeholder="Enter road name">
            <input type="submit" value="Search">
        </form>

        <br>

        <table border="1" cellpadding="10" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>License Plate</th>
                <th>Name</th>
                <th>Road ID</th>
                <th colspan="2" align="center">Actions</th>
            </tr>
            <%
                for (Car x : lst) {
            %>
            <tr>
                <td><%= x.getCar_ID() %></td>
                <td><%= x.getLicensePlate() %></td>
                <td><%= x.getCar_name() %></td>
                <td><%= x.getRoadID() %></td>
                <td><a href="Car_admin?action=edit&id=<%= x.getCar_ID() %>">Edit</a></td>
                <td>
                    <a href="Car_admin?action=delete&id=<%= x.getCar_ID() %>"
                       onclick="return confirm('Are you sure you want to delete this car?');">
                        Delete
                    </a>
                </td>
            </tr>
            <% } %>
        </table>

        <a href="admin.jsp">Back to previous page</a>
    </body>
</html>
