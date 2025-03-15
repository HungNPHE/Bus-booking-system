<%-- 
    Document   : admin
    Created on : Oct 18, 2024, 11:23:59 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Header */
            .header {
                background-color: rgba(0,0,0,0.3);/*  Vàng tươi */
                padding: 20px;
                color: green;
                text-align: center;
                font-size: 20px;
                height: 200px;
            }
            .container a{
                font-size: 25px;
                margin:10px 10px;
                color: red;
                text-decoration: none;
            }
            .container{
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                border: 1px solid black;
                background-color: greenyellow;

            }
        </style>

    </style>
</head>
<body>

    <div>
        <div class="header">
            <h1>TRANG CHỦ ADMIN</h1>
            <h2>NHÀ XE HÒA LẠC LỐI</h2>
            <div class="sub-title">

            </div>
        </div>

        <div class="container">


            <p class="p2"><a href="Road_admin?action=list">Manage Roads</a></p>
            <p class="p3" > <a href="Seat_admin?action=list">Manage Seat </a>
            <p class="p4" > <a href="Car_admin?action=list"> Manage Car </a>
            <p class="p5" > <a href="User_admin?action=list">Manage User </a>
            <p class="p6" > <a href="Booking_admin?action=list">Manage Booking </a>
            <p class="p1"><a href="#" onclick="submitformLogout()">Đăng xuất</a></p>

            <div id="logoutform" style="display: none">
                <form action="login?action=logout" method="POST">
                    <input type="submit" value="Đăng xuất">
                </form>
            </div>
        </div>
        <script>
            function submitformLogout() {
                let x = document.querySelector('#logoutform');
                x.querySelector('form').submit();
            }
        </script>
</body>
</html>
