<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%
    User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
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
    input[type="password"] {
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
    input[type="password"]:focus {
        border-color: #3f51b5;
        outline: none;
    }

    button[type="submit"] {
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

    button[type="submit"]:hover {
        background-color: #1976d2;
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
        <h2>Edit User</h2>
        <div class="containerAll">
        <form action="User_admin" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= user.getUser_Id() %>">

            <label>Full Name:</label>
            <input type="text" name="fullName" value="<%= user.getFullName() %>" required><br>

            <label>Phone:</label>
            <input type="text" name="phone" value="<%= user.getUser_phone() %>" required><br>

            <label>Password:</label>
            <input type="password" name="password" value="<%= user.getUser_password() %>" required><br>

            <label>Role:</label>
            <input type="text" name="role" value="<%= user.getUser_role() %>" required><br>

            <button type="submit">Update User</button>
        </form>
        </div>

        <p><a href="User_admin?action=list">Back to User List</a></p>
    </body>
</html>
