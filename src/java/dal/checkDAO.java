/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.carResult;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Seat;
import model.bookingHistory;

/**
 *
 * @author admin
 */
public class checkDAO extends DBContext {

    public List<Seat> availableSeats(int car_id,String date) {
        List<Seat> list = new ArrayList<>();
        connection = getConnection();
        String sql = "	SELECT \n"
                + "                	s.Seat_Number,sd.Status\n"
                + "                FROM Seat AS s\n"
                + "				JOIN SeatDetails AS sd ON s.Seat_ID = sd.Seat_ID\n"
                + "                WHERE s.Car_ID = ? AND sd.Date = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setObject(1, car_id);
            statement.setString(2, date);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String seat_Number = resultSet.getString("Seat_Number");
                String status = resultSet.getString("Status");
                Seat seat = new Seat(seat_Number, status);
                list.add(seat);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return list;
    }

    public List<carResult> car_foundList(String start, String end, String date) {
        List<carResult> list = new ArrayList<>();
        connection = getConnection();
        String sql = "SELECT\n"
                + "    c.Car_ID,\n"
                + "    c.Car_name,\n"
                + "    c.LicensePlate,\n"
                + "    r.[Start],\n"
                + "    r.[End],\n"
                + "    r.PickupLocation,\n"
                + "    r.Droplocation,\n"
                + "    bs.DepartureDate,\n"
                + "    CAST(bs.DepartureTime AS TIME(0)) AS DepartureTime,\n"
                + "    CAST(bs.ArrivalTime AS TIME(0)) AS ArrivalTime,\n"
                + "    r.Price,\n"
                + "    COUNT(s.Seat_ID) AS NumberOfAvailableSeats\n"
                + "FROM Car AS c\n"
                + "JOIN BusSchedule AS bs ON c.Car_ID = bs.Car_ID\n"
                + "JOIN Road AS r ON c.Road_ID = r.Road_ID\n"
                + "JOIN Seat AS s ON c.Car_ID = s.Car_ID\n"
                + "JOIN SeatDetails AS sd ON s.Seat_ID = sd.Seat_ID\n"
                + "WHERE r.[Start] = ?\n"
                + "    AND r.[End] = ?\n"
                + "    AND bs.DepartureDate = ?\n"
                + "    AND sd.Status = N'Còn trống'\n"
                + "	AND sd.Date = ?\n"
                + "GROUP BY\n"
                + "    c.Car_ID,\n"
                + "    c.Car_name,\n"
                + "    c.LicensePlate,\n"
                + "    r.[Start],\n"
                + "    r.[End],\n"
                + "    r.PickupLocation,\n"
                + "    r.Droplocation,\n"
                + "    bs.DepartureDate,\n"
                + "    bs.DepartureTime,\n"
                + "    bs.ArrivalTime,\n"
                + "    r.Price;";
        try {
            statement = connection.prepareStatement(sql);
            //chuyển hai tham số truyền vào cho vào câu lệnh sql thông qua dấu ?
            //i là vị trí của ?(1, 2, ......)
            statement.setString(1, start);
            statement.setString(2, end);
            statement.setString(3, date);
            statement.setString(4, date);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int car_id = resultSet.getInt("Car_ID");
                String car_name = resultSet.getNString("Car_name");
                String licensePlate = resultSet.getString("LicensePlate");
                String startLocation = resultSet.getNString("Start");
                String endLocation = resultSet.getNString("End");
                String pickupLocation = resultSet.getNString("PickupLocation");
                String dropLocation = resultSet.getNString("Droplocation");
                Date departureDate = resultSet.getDate("DepartureDate");
                Time departureTime = resultSet.getTime("DepartureTime");
                Time arrivalTime = resultSet.getTime("ArrivalTime");
                int price = resultSet.getInt("Price");
                int numberOfAvailableSeats = resultSet.getInt("NumberOfAvailableSeats");
                //set giá trị vào carResult
                carResult car = new carResult();
                car.setId(car_id);
                car.setName(car_name);
                car.setLicensePlate(licensePlate);
                car.setStartLocation(startLocation);
                car.setEndLocation(endLocation);
                car.setPickupLocation(pickupLocation);
                car.setDropLocation(dropLocation);
                car.setDepartureDate(departureDate);
                car.setDepartureTime(departureTime);
                car.setArrivalTime(arrivalTime);
                car.setPrice(price);
                car.setNumberOfAvailableSeats(numberOfAvailableSeats);
                list.add(car);
            }
            //lấy số ghế trống của mỗi xe
            for (int i = 0; i < list.size(); i++) {
                list.get(i).setAvailableSeats(availableSeats(list.get(i).getId(),date));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return list;
    }

    public List<bookingHistory> historyList(int user_id) {
        List<bookingHistory> list = new ArrayList<>();
        connection = getConnection();
        String sql = "SELECT \n"
                + "	t.Ticket_ID,b.BookingDate,\n"
                + "	u.[User_ID],u.FullName,u.User_phone,\n"
                + "	r.[Start],r.[End],bs.DepartureDate,\n"
                + "	CAST(bs.DepartureTime AS TIME(0)) AS DepartureTime,\n"
                + "	CAST(bs.ArrivalTime AS TIME(0)) AS ArrivalTime,\n"
                + "   c.LicensePlate,s.Seat_Number,r.Price,b.Booking_Status\n"
                + "FROM Booking AS b\n"
                + "JOIN Ticket AS t ON b.Ticket_ID = t.Ticket_ID\n"
                + "JOIN [User] AS u ON b.[User_ID] = u.[User_ID]\n"
                + "JOIN Road AS r ON t.Road_ID = r.Road_ID\n"
                + "JOIN BusSchedule AS bs ON t.Schedule_ID = bs.Schedule_ID\n"
                + "JOIN Seat AS s ON t.Seat_ID = s.Seat_ID\n"
                + "JOIN Car AS c ON bs.Car_ID = c.Car_ID\n"
                + "WHERE u.[User_ID] = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setObject(1, user_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int ticket_id = resultSet.getInt("Ticket_ID");
                Date bookingDate = resultSet.getDate("BookingDate");
                String fullname = resultSet.getNString("FullName");
                String phoneNumber = resultSet.getString("User_phone");
                String startLocation = resultSet.getNString("Start");
                String endLocation = resultSet.getNString("End");
                Date departureDate = resultSet.getDate("DepartureDate");
                Time departureTime = resultSet.getTime("DepartureTime");
                Time arrivalTime = resultSet.getTime("ArrivalTime");
                String licensePlate = resultSet.getString("LicensePlate");
                String seatNumber = resultSet.getString("Seat_Number");
                int price = resultSet.getInt("Price");
                String bookingStatus = resultSet.getNString("Booking_Status");
                bookingHistory history = new bookingHistory(ticket_id, bookingDate, user_id, fullname,
                        phoneNumber, startLocation, endLocation, departureDate, departureTime, arrivalTime,
                        licensePlate, seatNumber, price, bookingStatus);
                list.add(history);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return list;
    }
}
