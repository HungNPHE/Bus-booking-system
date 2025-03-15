<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            /* Tổng thể */
            body {

                min-height: 100vh;
                background-image: url(https://png.pngtree.com/thumb_back/fh260/background/20230516/pngtree-animated-mountains-landscape-wallpaper-4k-and-1080p-2px-image_2565761.jpg); /* Thay đổi đường dẫn tới ảnh nền */
                background-size: cover;

            }

            /* Link Home */
            a {
                text-decoration: none;
                border: 1px solid #4CAF50;
                background-color: #4CAF50;
                font-size: 18px;
                color: #ffffff;
                padding: 8px 15px;
                border-radius: 5px;
                margin: 15px;
                display: inline-block;
                transition: 0.3s;
            }

            a:hover {
                background-color: #45a049;
                border-color: #45a049;
            }

            /* Form đặt vé */
            .booking-form {
                background-color: rgba(231,209,241,0.4);
                padding: 20px;
                border-radius: 8px;
                width: 80%;
                max-width: 500px;
                margin: 20px auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .booking-form label {
                font-size: 16px;
                color: #3366ff;
                margin-top: 10px;
            }

            .booking-form select, .booking-form input[type="date"], .booking-form button {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                margin-top: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .booking-form button {
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
                transition: 0.3s;
            }

            .booking-form button:hover {
                background-color: #45a049;
            }

            /* Bảng kết quả tìm kiếm */
            .ticket-item {
                background-color: rgba(232,239,241,0.9);
                padding: 20px;
                border-radius: 8px;
                width: 90%;
                max-width: 800px;
                margin: 20px auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table, th, td {
                border: 1px solid green;
            }

            th, td {
                padding: 12px;
                text-align: left;
                font-size: 16px;
            }

            .ticket-price {
                color: #ff5722;
                font-weight: bold;
                font-size: 18px;
            }

            .btn-choose {
                background-color: #ff5722;
                color: #ffffff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            .btn-choose:hover {
                background-color: #e64a19;
            }

            /* Form chi tiết đặt vé */
            .bookingFormSection {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 8px;
                margin-top: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-group input[type="text"], .form-group textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .seat-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(50px, 1fr));
                gap: 10px;
            }

            .seat-grid input[type="checkbox"], .seat-grid input[type="radio"] {
                display: none;
            }

            .seat-grid label {
                display: block;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-align: center;
                background-color: #e0e0e0;
                cursor: pointer;
            }

            .seat-grid input:checked + label {
                background-color: #4CAF50;
                color: #ffffff;
            }


            a{
                text-decoration: none;
                border: 1px solid #66ffff;
                background-color: #66ffff;
                font-size: 25px;
                color: #ffffff;
                border-radius: 7px;
                margin-left: 15px;
                margin-top: 10px;
            }
            #bookedSeat{
                background-color: #ff5722;
            }
            h2, .rightName {
                flex: 1; /* Chia đều chiều rộng cho hai cột */
            }
            .datve{
                margin-left: 320px;
                
                font-size: 20px;
            }
        </style>

    </head>
    <body>
        <a href="index.jsp">Home</a>
        <c:if test="${not empty sessionScope.notificationBooking}">
            <script>
                alert("${sessionScope.notificationBooking}");
                window.location.href = "index.jsp"; // Redirect về trang Home sau khi người dùng bấm OK
            </script>
            <c:remove var="notificationBooking" scope="session" />
        </c:if>
        <div class="booking-form">
            <form action="book?action=search" method="POST">
                <label style="margin-left: 220px;" for="startPoint">Departure</label>
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
                <br>
                <label style="margin-left: 215px;" for="destination">Destination</label>
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
                <br>
                <label style="margin-left: 207px;" for="date">Departure Date</label>
                <input type="date" id="date" name="date" required>
                <br>
                <button type="submit">CHECK</button>
                <br>
            </form>
        </div>
        <br>
        <div class="ticket-item">
            <table border="1">
                <tr>
                    <td style="font-size: 20px; text-align: center;"><b>KẾT QUẢ TÌM KIẾM</b></td>
                </tr>

                <c:if test="${empty carfoundList}">
                    <tr>
                        <td>Không có chuyến phù hợp</td>
                    </tr>
                </c:if>
                <c:forEach var="carList" items="${carfoundList}">
                    <tr>
                        <td>
                            <h3>${carList.name}</h3>
                            <p><strong>Giờ đi:</strong> ${carList.departureTime} từ ${carList.pickupLocation}</p>
                            <p><strong>Giờ đến:</strong> ${carList.arrivalTime} đến ${carList.dropLocation}</p>
                            <p><strong>Số ghế trống:</strong> ${carList.numberOfAvailableSeats}</p>
                            <p class="ticket-price">${carList.price}đ</p>
                            <button type="button" class="btn btn-choose" onclick="selectSeat(this)">Chọn chỗ và đặt vé</button>                        
                            <!-- Phần form chọn ghế và thông tin cá nhân -->
                            <div class="bookingFormSection" style="display: none">
                                <h2>Đặt vé xe</h2>
                                <div class='rightName'>
                                    Đã đặt: <img style='width: 10px; height: 10px;' src='https://giaydantuonganhtuan.vn/upload_images/images/do-600x600.jpg'> Đang Đặt <img style='width: 10px; height: 10px;' src="https://vn.japo.news/contents/wp-content/uploads/2017/07/SaqXpF.jpg">        Còn Trống: <img style='width: 10px; height: 10px;' src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4m67UP4HA1paV0WTR_u8JsAg3oyd_q1ePWg&s">         
                                </div>
                                <div class="info-input">
                                    <form id="bookingForm" action="book?action=bookTicket" method="POST">
                                        <h3>Chọn chỗ ngồi</h3>
                                        <div class="seat-selection">
                                            <div class="seat-grid">
                                                <c:forEach var="seatList" items="${carList.availableSeats}">
                                                    <c:if test="${seatList.status == 'Đã đặt'}">
                                                        <input type="checkBox" id="${seatList.seatNumber}" value="${seatList.seatNumber}" checked disabled>
                                                        <label id='bookedSeat' for="${seatList.seatNumber}">${seatList.seatNumber}</label>
                                                    </c:if>
                                                    <c:if test="${seatList.status == 'Còn trống'}">
                                                        <input type="Radio" name="bookedSeat" id="${seatList.seatNumber}" value="${seatList.seatNumber}">
                                                        <label for="${seatList.seatNumber}">${seatList.seatNumber}</label>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <h3>Điền thông tin cá nhân</h3>
                                        <!-- lấy thông tin xe được bấm cho vào form, ẩn đi -->
                                        <div style="display: none">
                                            <input type="text" name="carID" value="${carList.id}">
                                            <input type="text" name="name" value="${carList.name}">
                                            <input type="text" name="licensePlate" value="${carList.licensePlate}">
                                            <input type="text" name="startLocation" value="${carList.startLocation}">
                                            <input type="text" name="endLocation" value="${carList.endLocation}">
                                            <input type="text" name="pickupLocation" value="${carList.pickupLocation}">
                                            <input type="text" name="dropLocation" value="${carList.dropLocation}">
                                            <input type="text" name="departureDate" value="${carList.departureDate}">
                                            <input type="text" name="departureTime" value="${carList.departureTime}">
                                            <input type="text" name="arrivalTime" value="${carList.arrivalTime}">
                                            <input type="text" name="price" value="${carList.price}">                                        
                                        </div>

                                        <div class="form-group">
                                            <label for="name">Họ tên *</label>
                                            <input type="text" id="name" placeholder="Họ tên" value="${sessionScope.account_info.fullname}" name="fullname" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Số điện thoại *</label>
                                            <input type="text" id="phone" placeholder="SĐT: 0912345678" value="${sessionScope.account_info.phoneNumber}" name="phoneNumber" required>
                                        </div>

                                        <input class="datve" type="submit" value="Đặt Vé">
                                    </form>
                                </div>
                            </div>
                        </td>
                    </tr>  
                </c:forEach>                           
            </table>            
        </div>
        <script>
            // Hàm để hiển thị form chọn ghế và điền thông tin cá nhân
            function displayForm(button) {
                let form = button.closest('td').querySelector('.bookingFormSection');
                if (form.style.display === 'none') {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            }

            function selectSeat(button) {
                displayForm(button);
            }

        </script>
    </body>
</html>
