/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author admin
 */
public class bookingDAO extends DBContext {

    public void insertToTicket(String startLocation, String endLocation,
            String seatNumber, int carId, String departureDate, String departureTime) {
        connection = getConnection();
        String sql = "INSERT INTO Ticket (Road_ID,Seat_ID,Schedule_ID)\n"
                + "VALUES(\n"
                + "	(SELECT r.Road_ID FROM Road AS r \n"
                + "	WHERE r.[Start] = ? \n"
                + "         AND r.[End] = ?),\n"
                + "	(SELECT s.Seat_ID FROM Seat AS s \n"
                + "	WHERE s.Seat_Number = ? \n"
                + "         AND s.Car_ID = ?),\n"
                + "	(SELECT bs.Schedule_ID FROM BusSchedule AS bs \n"
                + "	WHERE bs.Car_ID = ? \n"
                + "         AND bs.DepartureDate= ? \n"
                + "         AND bs.DepartureTime = ?)\n"
                + "	)";
        try {
            //tạo đối tượng prepare statement để chuyển sql sang câu lệnh sql
            //Statement.RETURN_GENERATED_KEYS để giúp bạn lấy lại các giá trị 
            //khóa chính tự động sinh ra từ cơ sở dữ liệu, hoặc các giá trị ngay sau khi thực hiện một thao tác chèn
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //thay các ? trong sql thành các giá trị muốn thêm vào
            statement.setObject(1, startLocation);
            statement.setObject(2, endLocation);
            statement.setObject(3, seatNumber);
            statement.setObject(4, carId);
            statement.setObject(5, carId);
            statement.setObject(6, departureDate);
            statement.setObject(7, departureTime);
            //thực thi câu lệnh
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public void insertToBooking(String bookingDate, String startLocation, String endLocation,
            String seatNumber, int carId, String departureDate, String departureTime, String phoneNumber) {
        connection = getConnection();
        String sql = "INSERT INTO Booking (BookingDate,Ticket_ID,[User_ID],Booking_Status)\n"
                + "VALUES(\n"
                + "	?,\n"
                + "	(SELECT \n"
                + "		t.Ticket_ID\n"
                + "	FROM Ticket AS t\n"
                + "	WHERE t.Road_ID = (SELECT r.Road_ID FROM Road AS r "
                + "                         WHERE r.[Start] = ? "
                + "                             AND r.[End] = ?)\n"
                + "		AND t.Seat_ID = (SELECT s.Seat_ID FROM Seat AS s "
                + "                             WHERE s.Seat_Number = ? "
                + "                                 AND s.Car_ID = ?)\n"
                + "		AND t.Schedule_ID = (SELECT bs.Schedule_ID FROM BusSchedule AS bs "
                + "                             WHERE bs.Car_ID = ? "
                + "                             AND bs.DepartureDate = ? "
                + "                             AND bs.DepartureTime = ?)\n"
                + "	),\n"
                + "	(SELECT u.User_ID FROM [User] AS u "
                + "             WHERE u.User_phone = ?),\n"
                + "     N'Đã đặt'\n                       "
                + ")";
        try {
            //tạo đối tượng prepare statement để chuyển sql sang câu lệnh sql
            //Statement.RETURN_GENERATED_KEYS để giúp bạn lấy lại các giá trị 
            //khóa chính tự động sinh ra từ cơ sở dữ liệu, hoặc các giá trị ngay sau khi thực hiện một thao tác chèn
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //thay các ? trong sql thành các giá trị muốn thêm vào
            statement.setObject(1, bookingDate);
            statement.setObject(2, startLocation);
            statement.setObject(3, endLocation);
            statement.setObject(4, seatNumber);
            statement.setObject(5, carId);
            statement.setObject(6, carId);
            statement.setObject(7, departureDate);
            statement.setObject(8, departureTime);
            statement.setObject(9, phoneNumber);
            //thực thi câu lệnh
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }
    public void updateSeat(String seatNumber, int carId, String date){
        //kết nối với db
        connection = getConnection();
        //tạo câu lệnh sql
        String sql = "UPDATE SeatDetails\n" +
                    "SET Status = N'Đã đặt' WHERE Seat_ID = (\n" +
                    "	SELECT s.Seat_ID FROM Seat AS s WHERE s.Seat_Number = ? AND Car_ID = ? \n" +
                    ") AND Date = ?";
        
        try{
            //tạo đối tượng prepare statement để chuyển sql sang câu lệnh sql
            statement = connection.prepareStatement(sql);
            //thay các ? trong sql thành các giá trị muốn thêm vào
            statement.setObject(1, seatNumber);
            statement.setObject(2, carId);
            statement.setString(3, date);
            //thực thi câu lệnh
            statement.executeUpdate();
        }catch(SQLException e){
            System.err.println(e.getMessage());
        }
    }
    

    public void updateBooking_cancel(int ticket_id){
        //kết nối với db
        connection = getConnection();
        //tạo câu lệnh sql
        String sql = "UPDATE Booking "
                + "SET Booking_Status = N'Đã hủy' "
                + "WHERE Ticket_ID = ?";
        
        try{
            //tạo đối tượng prepare statement để chuyển sql sang câu lệnh sql
            statement = connection.prepareStatement(sql);
            //thay các ? trong sql thành các giá trị muốn thêm vào
            statement.setObject(1, ticket_id);
            //thực thi câu lệnh
            statement.executeUpdate();
        }catch(SQLException e){
            System.err.println(e.getMessage());
        }        
    }
    public void updateSeat_Cancel(String date, String seatNumber, String licensePlate){
        //kết nối với db
        connection = getConnection();
        //tạo câu lệnh sql
        String sql = "UPDATE SeatDetails\n" +
                    "SET [Status] = N'Còn trống' \n" +
                    "WHERE SeatDetails.[Date] = ? \n" +
                    "	AND SeatDetails.Seat_ID = (\n" +
                    "		SELECT Seat.Seat_ID FROM Seat \n" +
                    "		WHERE Seat_Number = ? \n" +
                    "			AND Seat.Car_ID IN (\n" +
                    "				SELECT Car.Car_ID FROM Car \n" +
                    "				WHERE Car.LicensePlate = ?\n" +
                    "				)\n" +
                    "	)";
        
        try{
            //tạo đối tượng prepare statement để chuyển sql sang câu lệnh sql
            statement = connection.prepareStatement(sql);
            //thay các ? trong sql thành các giá trị muốn thêm vào
            statement.setString(1, date);
            statement.setObject(2, seatNumber);
            statement.setObject(3, licensePlate);
            //thực thi câu lệnh
            statement.executeUpdate();
        }catch(SQLException e){
            System.err.println(e.getMessage());
        }
    }

}
