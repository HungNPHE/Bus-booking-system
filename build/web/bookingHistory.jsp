<%-- 
    Document   : bookingHistory
    Created on : Oct 20, 2024, 10:18:25 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            /* Cài đặt chung */
            body{
                margin: 0;
                padding: 0;
                background-color: #999999;
                height: 100vh;
            }
            .header {
                font-family: Arial, sans-serif;
                color: #333;
                display: flex;
                justify-content: center;
                align-items: center;

            }
            a {
                text-decoration: none;
                color: #007bff;
                font-size: 25px;
                margin-left: 30px;
                margin-top: 30px;
                border: 1px solid #00ffcc;
                background-color: #00ffcc;
                border-radius: 7px;

            }
            h1 {
                text-align: center;
                color: #222;
                font-size: 40px;
                margin-bottom: 20px;
            }
            h1 {
                font-size: 48px;
                font-weight: bold;
                background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);
                -webkit-background-clip: text;
                color: transparent;
                animation: changeColors 3s infinite;
                text-align: center;
            }
            /* Phong cách bảng */
            table {
                width: 90%;
                max-width: 1000px;
                border-collapse: collapse;
                margin: 0 auto;
                background-color: #fffff;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }
            th, td {
                padding: 15px;
                text-align: center;
            }
            th {
                background-color: #007bff;
                color: #fff;
                font-weight: bold;
                font-size: 16px;
            }
            td {
                background-color: #f9f9f9;
                font-size: 15px;
                color: #555;
            }
            tr:nth-child(even) td {
                background-color: #f0f0f0;
            }
            tr:hover td {
                background-color: #e8f4fc;
            }
            /* Phong cách cột tuỳ chỉnh */
            .cancel-button {
                color: #ff4d4d;
                font-weight: bold;
                cursor: pointer;
            }
            .cancel-button:hover {
                text-decoration: underline;
            }
            /* Hiển thị thông báo nếu lịch sử trống */
            .empty-history {
                text-align: center;
                color: #888;
                font-size: 18px;
                padding: 20px;
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
            .header-b{
                font-size: 15px;
            }
        </style>
    </head>
    <body>
        <a href="index.jsp" class="home-icon">
            <i class="fa fa-home"></i>
        </a>
        <h1>Lịch sử đặt vé</h1>
        <div class="header">
            <table border="1">
                <tr>
                    <td><b>Mã vé</b></td>
                    <td><b>Ngày đặt vé</b></td>
                    <td><b>Nơi đi</b></td>
                    <td><b>Nơi đến</b></td>
                    <td><b>Ngày khởi hành</b></td>
                    <td><b>Giờ đi</b></td>
                    <td><b>Giờ đến</b></td>
                    <td><b>Biển số xe</b></td>
                    <td><b>Số ghế</b></td>
                    <td><b>Giá vé</b></td>
                    <td><b>Trạng thái</b></td>
                    <td><b>Tùy chỉnh</b></td>
                </tr>
                <c:if test="${empty historyList}">
                    <tr>
                        <td>Lịch sử trống</td>
                    </tr>
                </c:if>
                <c:forEach var="historyList" items="${historyList}">
                    <tr>
                        <td>${historyList.ticket_id}</td>
                        <td>${historyList.bookingDate}</td>
                        <td>${historyList.startLocation}</td>
                        <td>${historyList.endLocation}</td>
                        <td>${historyList.departureDate}</td>
                        <td>${historyList.departureTime}</td>
                        <td>${historyList.arrivalTime}</td>
                        <td>${historyList.licensePlate}</td>
                        <td>${historyList.seatNumber}</td>
                        <td>${historyList.price}</td>
                        <td>${historyList.bookingStatus}</td>
                        <td>               
                            <c:if test="${historyList.bookingStatus == 'Đã đặt'}">
                                <form action="book?action=cancel" method="POST" style="display: inline">
                                    <input type="hidden" name="ticketId_cancel" value="${historyList.ticket_id}"/>
                                    <input type="hidden" name="departureDate_cancel" value="${historyList.departureDate}"/>
                                    <input type="hidden" name="seatNumber_cancel" value="${historyList.seatNumber}"/>
                                    <input type="hidden" name="licensePlate_cancel" value="${historyList.licensePlate}"/>
                                    <a style="margin-left: -8px;" href="#" onclick="submitCancel(this)">HỦY</a>
                                </form> 
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <script>
            function submitCancel(e) {
                let form = e.closest('form');
                form.submit();
            }
        </script>
    </body>
</html>
