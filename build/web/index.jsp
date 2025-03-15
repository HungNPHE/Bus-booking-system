<%-- 
    Document   : index
    Created on : Oct 20, 2024, 10:50:01 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet">
    
        <style>
            body {

                margin: 0;
                font-family: Arial, sans-serif;
                /*background-image: url(https://vanminh76.vn/wp-content/uploads/2024/03/bg-trong-dong.jpg);
                background-repeat: no-repeat;  không lặp lại hình nền */
                background-color: white;
                height: 100vh; /* chiếm toàn bộ chiều cao viewport */


            }

            /* Header */
            .header {
                background-color: rgba(0,0,0,0.3);/*  Vàng tươi */
                padding: 20px;
                color: green;
                text-align: center;
                
                height: 200px;
                
            }

            .header p {
                margin: 5px 0;
            }


            /* Background image */
            .image-container {
                background-image: url('blabla'); /* Replace with actual image path */
                height: 800px;
                background-size: cover;
                background-position: center;
            }




            .history_logout-button:hover {
                color: darkblue;
            }
            .contact-buttons {
                position: fixed;
                top: 550px; /* Tùy chỉnh vị trí trên trang */
                left: 20px; /* Vị trí từ lề trái */
                z-index: 1000;
            }

            .icon-btn {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                color: white;
                font-size: 24px;
                text-decoration: none;
                margin-bottom: 15px; /* Khoảng cách giữa các nút */
            }
            .gmail {
                background-color: #D44638; /* Màu đỏ cho Gmail */
            }

            .phone {
                background-color: #4CAF50; /* Màu xanh lá cây cho Điện thoại */
            }

            .icon-btn i {
                font-size: 24px; /* Kích thước của icon */
            }
            .container{
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                border: 1px solid greenyellow;
                background-color: greenyellow;
                height: 40px;

            }
            .container a{
                font-size: 30px;
                text-decoration: none;
            }

            span{
                font-size: 25px;
            }
            h1, h2, span {
                font-family: 'Dancing Script', cursive;
                color: #333333;
              /*  font-weight: bold;
                background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);
                -webkit-background-clip: text;
                color: transparent;
                animation: changeColors 3s infinite;
                text-align: center; */
            }

           /* @keyframes changeColors {
                0% {
                    background-position: 0%;
                }
                100% {
                    background-position: 100%;
                }
            }*/

            .company-info {
                display: flex;
                justify-content: space-between;
                background-color: #f4f4f4;
                border-radius: 8px;
                margin-top: -790px;
            }

            .intro {
                width: 48%;
                color: black;
            }

            .intro h1 {
                font-size: 3em;
                color: #007F3E;
            }

            .intro h2 {
                font-size: 1.5em;
                color: #333;
                margin: 20px 0 10px;
            }

            .intro p {
                line-height: 1.6;
                margin-left: 40px;
            }

            .intro .learn-more {
                color: #007F3E;
                font-weight: bold;
                text-decoration: none;
            }

            .images {
                display: flex;
                width: 48%;
                gap: 10px;
            }

            .image-box {
                width: 32%;
                position: relative;
            }

            .image-box img {
                width: 100%;
                border-radius: 8px;
            }

            .image-box h3 {
                position: absolute;
                bottom: 10px;
                left: 10px;
                color: white;
                font-size: 1.2em;
                background-color: rgba(0, 0, 0, 0.6);
                padding: 5px;
                border-radius: 4px;
            }


            /* Hiệu ứng trượt từ trên xuống cho các hình ảnh */
            .image-box {
                width: 32%;
                position: relative;
                opacity: 0; /* Ẩn ban đầu */
                transform: translateY(-50px); /* Di chuyển ảnh lên trên ban đầu */
                animation: slideDown 1s ease forwards; /* Kích hoạt hiệu ứng */
            }

            /* Tạo hiệu ứng trượt */
            @keyframes slideDown {
                0% {
                    opacity: 0;
                    transform: translateY(-50px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Thêm độ trễ cho mỗi ảnh */
            .image-box:nth-child(1) {
                animation-delay: 0.2s;
            }

            .image-box:nth-child(2) {
                animation-delay: 0.4s;
            }

            .image-box:nth-child(3) {
                animation-delay: 0.6s;
            }

        </style>
    </head>
    <body>
        <div class="header">
            <h1 style="font-size: 40px;">XE TUYẾN GIƯỜNG NẰM</h1>
            <h2 style="font-size: 35px;">NHÀ XE HÒA LẠC LỐI</h2>
            <div class="sub-title">
                <span>UY TÍN -</span>
                <span>CHẤT LƯỢNG -</span>
                <span>CHUYÊN NGHIỆP</span>
            </div>
        </div>
        <div class="container">
            <a href="profile.jsp">Thông tin cá nhân</a>
            <br>
            <a href="booking.jsp">Đặt vé</a>
            <br>
            <a href="#" onclick="submitformHistory()">Lịch sử đặt vé</a>
            <br>
            <a href="#" onclick="submitformLogout()">Đăng xuất</a>
            <br>
        </div>
        <div id="historyform" style="display: none">
            <form action="book?action=history" method="POST">
                <input type="submit" value="Lịch sử đặt vé">
            </form>
        </div>

        <div id="logoutform" style="display: none">
            <form action="login?action=logout" method="POST">
                <input type="submit" value="Đăng xuất">
            </form>
        </div>

        <script>
            function submitformHistory() {
                let x = document.querySelector('#historyform');
                x.querySelector('form').submit();
            }
            function submitformLogout() {
                let x = document.querySelector('#logoutform');
                x.querySelector('form').submit();
            }
        </script>
        <div class="contact-buttons">
            <a href="mailto:tranhuyhoang091203@gmail.com" class="icon-btn gmail">
                <i class="fas fa-envelope"></i>
            </a>
            <a href="tel:+84945928898" class="icon-btn phone">
                <i class="fas fa-phone"></i>
            </a>
        </div>
        <div class="image-container"></div>


        <!-- Phần giới thiệu công ty và hình ảnh -->
        <div class="company-info">
            <div class="intro">
                <h1>NHỮNG CUNG ĐƯỜNG</h1>

                <p>
                    Đa dạng các dòng xe giường nằm cao cấp: Vip 20 giường.</p>
                <p>
                    60 chuyến/1 ngày, chuyên tuyến: Hà Nội các tỉnh lân cận và ngược lại.
                </p>
                <P>
                    Xuất bến từ: Fomosa TP Vinh, Cửa Lò, Yên Nghĩa, Nước Ngầm.
                </P>
                
            </div>

            <div class="images">
                <div class="image-box">
                    <img src="https://xenamquynhanh.vn/wp-content/uploads/2021/12/260707036_674535093921667_2070458975578565918_n.png" alt="Lịch sử hình thành">
                    <a href="Introduction.html"> <h3>LỊCH SỬ HÌNH THÀNH</h3></a>
                </div>
                <div class="image-box">
                    <img src="https://media.istockphoto.com/id/1190550908/vi/anh/m%E1%BB%A5c-ti%C3%AAu-b%E1%BA%AFn-cung-v%C3%A0-m%C5%A9i-t%C3%AAn-3d-tr%C3%AAn-b%E1%BA%A7u-tr%E1%BB%9Di-xanh.jpg?s=612x612&w=0&k=20&c=sUlWKPSOKUgi5LhB4RjWItbz2WLvVyAaoCE93Y0mfTs=" alt="Tầm nhìn sứ mệnh">
                    <a href="Giatricotloi.html"><h3 style="margin-left: 20px;">GIÁ TRỊ CỐT LÕI</h3></a>
                     </div>
                <div class="image-box">
                    <img src="https://vanminh76.vn/wp-content/uploads/2024/03/R-768x517.jpg " alt="Giá trị cốt lõi">
                    <a href="tamnhinsumenh.html"><h3>TẦM NHÌN SỨ MỆNH</h3></a>
                </div>
            </div>
        </div>

    </body>
</html>
