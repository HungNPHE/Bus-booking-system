<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="java.util.*" %>
<%
  List<User> lst = (List<User>) request.getAttribute("lst");
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management</title>
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

    form input[type="text"] {
        padding: 8px;
        border: 1px solid #d1d5db;
        border-radius: 4px;
        width: 200px;
    }

    form input[type="submit"] {
        padding: 8px 15px;
        background-color: #4caf50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    form input[type="submit"]:hover {
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
        <h2>List of Users</h2>
        <p><a href="insert_user.jsp">Insert New User</a></p>

        <form action="User_admin" method="POST">
            <input type="hidden" name="action" value="search">

            <input type="text" name="name" >
            <input type="submit" value="Search By Name" />

        </form>

        <br>

        <table border="1" cellpadding="10" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Phone</th>
                <th>Password</th>
                <th>Role</th>
                <th colspan="2">Actions</th>
            </tr>

            <%
              for(User x : lst) {
            %>
            <tr>
                <td><%= x.getUser_Id() %></td>
                <td><%= x.getFullName() %></td>
                <td><%= x.getUser_phone() %></td>
                <td><%= x.getUser_password() %></td>
                <td><%= x.getUser_role() %></td>
                <td><a href="User_admin?action=edit&id=<%= x.getUser_Id() %>">Edit</a></td>
                <td>
                    <a href="User_admin?action=delete&id=<%= x.getUser_Id() %>" 
                       onclick="return confirm('Are you sure you want to delete this user?');">
                        Delete
                    </a>
                </td>
            </tr>
            <% } %>  
        </table>     

        <a href="admin.jsp">Back to previous page</a>
    </body>
</html>
