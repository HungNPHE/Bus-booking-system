<%-- 
    Document   : booking
    Created on : Oct 12, 2024, 10:22:47 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            body{
                

                                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-image: url(https://datviettour.com.vn/uploads/images/dalat/hinh-noi-dung/xe-giuong-doi-du-lich-da-lat-3.jpg); /* Thay đổi đường dẫn tới ảnh nền */
                background-size: cover;
                background-position: center;
                
            }
            /* Booking form */
            .booking-form {
                background-color: rgba(125,231,130,0.4);
                color: white;
                padding: 20px;
                margin: 30px auto 20px;
                width: 60%;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .booking-form label {
                font-size: 20px;
                margin-bottom: 5px;
                color: black;
                
            }

            .booking-form .second {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }

            .booking-form select,
            .booking-form input[type="date"] {
                width: 30%;
                padding: 10px;
                border-radius: 5px;
                border: none;
                font-size: 16px;
            }

            .booking-form button {
                background-color: red;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .booking-form button:hover {
                background-color: darkred;
            }

            button {
                margin-left: 10px;
            }
            .first{
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                

            }
            /* CSS cho icon ngôi nhà */
            .home-icon {
                position: absolute;
                top: 20px;
                left: 20px;
                font-size: 35px;
                color: white;
                text-decoration: none;
            }

            .home-icon:hover {
                color: #ddd;
            }
            #destination{
                margin-left: 5px;
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <a href="index.jsp" class="home-icon">
            <i class="fa fa-home"></i>
        </a>
        <div class="booking-form">
            <form action="book?action=search" method="POST">
                <div class="first">
                    <label style="margin-left: -80px;" for="startPoint"><b>Departure</b></label>
                    <label style="margin-left: -45px;" for="destination"><b>Destination</b></label>
                    <label style="margin-left: -25px;" for="date"><b>Departure Date</b></label>
                </div>
                <div class="second">
                    <select name="start" id="startPoint" required>
                        <option value="Hà Nội">Hà Nội</option>
                        <option value="Hải Phòng">Hải Phòng</option>
                        <option value="Huế">Huế</option>
                        <option value="Nghệ An">Nghệ An</option>
                        <option value="Ninh Bình">Ninh Bình</option>
                        <option value="Quảng Ninh">Quảng Ninh</option>
                        <option value="Thanh Hóa">Thanh Hóa</option>
                        <option value="Bắc Ninh">Bắc Ninh</option>
                        <option value="Thái Bình">Thái Bình</option>
                        <option value="Quảng Trị">Quảng Trị</option>
                        <option value="Hà Tĩnh">Hà Tĩnh</option>
                    </select>
                    <select name="end" id="destination" required>
                        <option value="Hà Nội">Hà Nội</option>
                        <option value="Hải Phòng">Hải Phòng</option>
                        <option value="Huế">Huế</option>
                        <option value="Nghệ An">Nghệ An</option>
                        <option value="Ninh Bình">Ninh Bình</option>
                        <option value="Quảng Ninh">Quảng Ninh</option>
                        <option value="Thanh Hóa">Thanh Hóa</option>
                        <option value="Bắc Ninh">Bắc Ninh</option>
                        <option value="Thái Bình">Thái Bình</option>
                        <option value="Quảng Trị">Quảng Trị</option>
                        <option value="Hà Tĩnh">Hà Tĩnh</option>
                    </select>

                    <input type="date" id="date" name="date" required>

                    <button type="submit"><b>Check</b></button>
                </div>

            </form>
        </div>
    </body>
</html>

        </div>
    </body>
</html>
