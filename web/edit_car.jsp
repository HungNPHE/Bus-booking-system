<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "model.Car" %>
<!DOCTYPE html>
<%
    Car car = (Car) request.getAttribute("car");  // Lấy thông tin xe từ Servlet
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Car</title>
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
                align-items: center;
                height: 100vh;
                margin-top: -90px;
            }

            h2 {
                color: #333;
                font-size: 35px;
                margin-top: 50px;
                text-align: center;
            }

            form {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 500px;
            }

            p {
                margin-bottom: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            p label {
                font-weight: bold;
                font-size: 16px;
                color: #555;
                margin-right: 10px;
                width: 120px;
            }

            input[type="text"],
            input[type="number"] {
                padding: 10px;
                border: 1px solid #d1d5db;
                border-radius: 5px;
                width: calc(100% - 140px);
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
                transition: background-color 0.3s ease;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: white;
                border: none;
                margin-right: 10px;
            }

            input[type="submit"]:hover {
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
        <h2>Edit Car Details</h2>
        <div class="containerAll">
            <form action="Car_admin" method="POST">
                <input type="hidden" name="action" value="edit"/>
                <input type="hidden" name="id" value="<%= car.getCar_ID() %>"/>

                <p>
                    License Plate: 
                    <input type="text" name="licensePlate" value="<%= car.getLicensePlate() %>" required/>
                </p>

                <p>
                    Car Name: 
                    <input type="text" name="carName" value="<%= car.getCar_name() %>" required/>
                </p>

                <p>
                    Road ID: 
                    <input type="number" name="roadId" value="<%= car.getRoadID() %>" required/>
                </p>



                <p>
                    <input type="submit" value="Save Changes"/>
                    <button type="button" onclick="window.history.back();">Cancel</button>
                </p>
            </form>
        </div>
    </body>
</html>
