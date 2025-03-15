<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Road" %>
<%@page import = "java.util.*" %>
<%
  List<Road> lst = (List<Road>) request.getAttribute("lst");
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Roads</title>
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

            h2, h3 {
                color: #333;
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

            .search-section {
                margin-bottom: 20px;
            }

            form {
                display: flex;
                gap: 10px;
                margin: 10px 0;
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
        <p><a href="insert_road.jsp">Insert New Road</a></p>
        <h3>Search road</h3>
        <!-- Search Form for Start -->
        <form action="Road_admin?action=searchByStart" method="POST">
            <input type="text" name="Start" placeholder="Seach by start location">
            <input type="submit" value="search"/>

        </form>

        <!-- Search Form for End -->
        <form action="Road_admin?action=searchByEnd" method="POST">
            <input type="text" name="End" placeholder="Search by end location">
            <input type="submit" value="search" name="Search By End" />
        </form>
        <br>


        <h2>List of Roads</h2>
        <table border="1" cellpadding="10" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Start</th>
                <th>End</th>
                <th>Price</th>
                <th>Pickup Location</th>
                <th>Drop Location</th>
                <th colspan="2">Actions</th>
            </tr>
            <%
              for (Road x : lst) {
            %>
            <tr>
                <td><%= x.getRoadID() %></td>
                <td><%= x.getStart() %></td>
                <td><%= x.getEnd() %></td>
                <td><%= x.getPrice() %></td>
                <td><%= x.getPickupLocation() %></td>
                <td><%= x.getDropLocation() %></td>
                <td><a href="Road_admin?action=edit&id=<%= x.getRoadID() %>">Edit</a></td>
                <td><a href="Road_admin?action=delete&id=<%= x.getRoadID() %>" 
                       onclick="return confirm('Are you sure you want to delete this road?');">Delete</a></td>
            </tr>
            <% } %>  
        </table>
        <a href="admin.jsp">Back to previous page</a>
    </body>
</html>
