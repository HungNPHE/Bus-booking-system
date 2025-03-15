package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Car;
import model.Road;
import model.User;
import model.Booking;
import model.Seat_2;

public class AdminDAO extends DBContext {

    public List<Road> getRoad() {
        List<Road> r = new ArrayList<>();

        connection = getConnection();

        String sql = "select * from Road";

        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("Road_ID");
                String star = resultSet.getString("Start");
                String end = resultSet.getString("End");
                int price = resultSet.getInt("Price");
                String pickup = resultSet.getString("PickupLocation");
                String drop = resultSet.getString("DropLocation");
                Road a = new Road(id, star, end, price, pickup, drop);
                r.add(a);

            }

        } catch (Exception e) {
        }
        return r;
    }

    public List<Road> searchRoadByStart(String start) {
        connection = getConnection();
        List<Road> roads = new ArrayList<>();
        String sql = "SELECT * FROM Road WHERE Start LIKE ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + start + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                roads.add(mapResultSetToRoad(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return roads;
    }

    public List<Road> searchRoadByEnd(String end) {
        connection = getConnection();
        List<Road> roads = new ArrayList<>();
        String sql = "SELECT * FROM Road WHERE [End] LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + end + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                roads.add(mapResultSetToRoad(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return roads;
    }

    private Road mapResultSetToRoad(ResultSet rs) throws Exception {
        int id = rs.getInt("Road_ID");
        String start = rs.getString("Start");
        String end = rs.getString("End");
        int price = rs.getInt("Price");
        String pickup = rs.getString("PickupLocation");
        String drop = rs.getString("DropLocation");
        return new Road(id, start, end, price, pickup, drop);
    }

    public List<User> getUser() {
        List<User> r = new ArrayList<>();

        connection = getConnection();

        String sql = "select * from [User]";

        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("User_ID");
                String fullname = resultSet.getString("FullName");
                String phone = resultSet.getString("User_phone");
                String password = resultSet.getString("User_password");
                String role = resultSet.getString("User_role");
                User a = new User(id, fullname, phone, password, role);

                r.add(a);

            }

        } catch (Exception e) {
        }
        return r;
    }

    public List<User> searchUserByName(String name) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE FullName LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("User_ID");
                String fullName = rs.getString("FullName");
                String phone = rs.getString("User_phone");
                String password = rs.getString("User_password");
                String role = rs.getString("User_role");
                users.add(new User(id, fullName, phone, password, role));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public List<Car> getCar() {
        List<Car> r = new ArrayList<>();

        connection = getConnection();

        String sql = "select * from Car";

        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("Car_ID");
                String licenseplate = resultSet.getString("LicensePlate");
                String name = resultSet.getString("Car_name");
                int Road_ID = resultSet.getInt("Road_ID");
                Car a = new Car(id, licenseplate, name, Road_ID);

                r.add(a);

            }

        } catch (Exception e) {
        }
        return r;
    }

    public List<Car> searchByRoadName(String roadName) {
        List<Car> list = new ArrayList<>();
        String sql = "SELECT c.Car_ID, c.Car_name, c.LicensePlate, c.Road_ID "
                + "FROM Car c JOIN Road r ON c.Road_ID = r.Road_ID  "
                + "WHERE r.Start LIKE ? OR r.[End] LIKE ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + roadName + "%");
            stmt.setString(2, "%" + roadName + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Car car = new Car(
                        rs.getInt("Car_ID"),
                        rs.getString("Car_name"),
                        rs.getString("LicensePlate"),
                        rs.getInt("Road_ID"));
                list.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Booking> getBooking() {
        List<Booking> r = new ArrayList<>();

        connection = getConnection();

        String sql = "select * from Booking";

        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("Booking_ID");
                String date = resultSet.getString("bookingDate");
                int ticket_id = resultSet.getInt("Ticket_ID");
                int user_id = resultSet.getInt("User_ID");
                String status = resultSet.getString("Booking_Status");

                Booking a = new Booking(id, date, ticket_id, user_id, status);
                r.add(a);

            }

        } catch (Exception e) {
        }
        return r;
    }

    public List<Booking> searchByDate(String date) {
        List<Booking> list = new ArrayList<>();
        String sql = "SELECT * FROM Booking WHERE BookingDate = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, date);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("Booking_ID"),
                        rs.getString("BookingDate"),
                        rs.getInt("Ticket_ID"),
                        rs.getInt("User_ID"),
                        rs.getString("Booking_Status"));
                list.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Seat_2> getSeat() {
        List<Seat_2> r = new ArrayList<>();

        connection = getConnection();

        String sql = "select * from SeatDetails";

        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("SeatDetails_ID");
                int Seat_id = resultSet.getInt("Seat_ID");
                String date = resultSet.getString("Date");
                String status = resultSet.getString("Status");

                Seat_2 a = new Seat_2(id, Seat_id, date, status);
                r.add(a);

            }

        } catch (Exception e) {
        }
        return r;
    }

    public List<Seat_2> searchSeatByDate(String date) {
        List<Seat_2> list = new ArrayList<>();
        String sql = "SELECT * FROM SeatDetails WHERE Date = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, date);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Seat_2 seat = new Seat_2(
                        rs.getInt("SeatDetails_ID"),
                        rs.getInt("Seat_ID"),
                        rs.getString("Date"),
                        rs.getString("Status"));
                list.add(seat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insertRoad(Road road) {
        String sql = "INSERT INTO Road (Start, [End], Price, PickupLocation, DropLocation) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, road.getStart());
            stmt.setString(2, road.getEnd());
            stmt.setInt(3, road.getPrice());
            stmt.setString(4, road.getPickupLocation());
            stmt.setString(5, road.getDropLocation());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateRoad(Road road) {
        String sql = "UPDATE Road SET Start = ?, [End] = ?, Price = ?, PickupLocation = ?, DropLocation = ? WHERE Road_ID = ?";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, road.getStart());
            stmt.setString(2, road.getEnd());
            stmt.setInt(3, road.getPrice());
            stmt.setString(4, road.getPickupLocation());
            stmt.setString(5, road.getDropLocation());
            stmt.setInt(6, road.getRoadID());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteRoad(int id) {
        String sql = "DELETE FROM Road WHERE Road_ID = ?";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Road getRoadById(int id) {
        String sql = "SELECT * FROM Road WHERE Road_ID = ?";
        Road road = null;

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String start = rs.getString("Start");
                    String end = rs.getString("End");
                    int price = rs.getInt("Price");
                    String pickup = rs.getString("PickupLocation");
                    String drop = rs.getString("DropLocation");

                    road = new Road(id, start, end, price, pickup, drop);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return road;
    }

    public void insertSeat(Seat_2 seat) {
        String sql = "INSERT INTO SeatDetails (Seat_ID, Date, Status) VALUES (?, ?, ?)";
        connection = getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, seat.getSeat_ID());
            ps.setString(2, seat.getDate());
            ps.setString(3, seat.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateSeat(Seat_2 seat) {
        String sql = "UPDATE SeatDetails SET Seat_ID = ?, Date = ?, Status = ? WHERE SeatDetails_ID = ?";
        connection = getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, seat.getSeat_ID());
            ps.setString(2, seat.getDate());
            ps.setString(3, seat.getStatus());
            ps.setInt(4, seat.getSeatDetails_ID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteSeat(int id) {
        String sql = "DELETE FROM SeatDetails WHERE SeatDetails_ID = ?";
        connection = getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Seat_2 getSeatById(int id) {
        String sql = "SELECT * FROM SeatDetails WHERE SeatDetails_ID = ?";
        connection = getConnection();
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Seat_2(
                        rs.getInt("SeatDetails_ID"),
                        rs.getInt("Seat_ID"),
                        rs.getString("Date"),
                        rs.getString("Status")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Car getCarById(int id) {
        String sql = "SELECT * FROM Car WHERE Car_ID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int car_id = rs.getInt("Car_ID");
                String licne = rs.getString("LicensePlate");
                String carNa = rs.getString("Car_name");
                int R_id = rs.getInt("Road_ID");

                Car a = new Car(car_id, licne, carNa, R_id);
                return a;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertCar(Car car) {
        String sql = "INSERT INTO Car (LicensePlate, Car_name, Road_ID) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, car.getLicensePlate());
            ps.setString(2, car.getCar_name());
            ps.setInt(3, car.getRoadID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCar(Car car) {
        String sql = "UPDATE Car SET LicensePlate = ?, Car_name = ?, Road_ID = ? WHERE Car_ID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, car.getLicensePlate());
            ps.setString(2, car.getCar_name());
            ps.setInt(3, car.getRoadID());
            ps.setInt(4, car.getCar_ID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCar(int id) {
        String sql = "DELETE FROM Car WHERE Car_ID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM [User] WHERE User_ID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("User_ID"),
                        rs.getString("FullName"),
                        rs.getString("User_phone"),
                        rs.getString("User_password"),
                        rs.getString("User_role")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertUser(User user) {
        String sql = "INSERT INTO [User] (FullName, User_phone, User_password, User_role) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUser_phone());
            ps.setString(3, user.getUser_password());
            ps.setString(4, user.getUser_role());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        String sql = "UPDATE [User] SET FullName = ?, User_phone = ?, User_password = ?, User_role = ? WHERE User_ID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getUser_phone());
            ps.setString(3, user.getUser_password());
            ps.setString(4, user.getUser_role());
            ps.setInt(5, user.getUser_Id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {
        String sql = "DELETE FROM [User] WHERE User_ID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Booking findBookingById(int bookingId) {
        Booking booking = null;
        String sql = "SELECT * FROM Booking WHERE Booking_ID = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, bookingId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String bookingDate = resultSet.getString("BookingDate");
                int ticketId = resultSet.getInt("Ticket_ID");
                int userId = resultSet.getInt("User_ID");
                String bookingStatus = resultSet.getString("Booking_Status");

                booking = new Booking(bookingId, bookingDate, ticketId, userId, bookingStatus);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return booking;
    }

    public void insertBooking(Booking booking) {
        String sql = "INSERT INTO Booking (BookingDate, Ticket_ID, User_ID, Booking_Status) VALUES (?, ?, ?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, booking.getBookingDate());
            statement.setInt(2, booking.getTicket_ID());
            statement.setInt(3, booking.getUser_ID());
            statement.setString(4, booking.getBooking_Status());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateBooking(Booking booking) {
        String sql = "UPDATE Booking SET BookingDate = ?, Ticket_ID = ?, User_ID = ?, Booking_Status = ? WHERE Booking_ID = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, booking.getBookingDate());
            statement.setInt(2, booking.getTicket_ID());
            statement.setInt(3, booking.getUser_ID());
            statement.setString(4, booking.getBooking_Status());
            statement.setInt(5, booking.getBooking_ID());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteBooking(int bookingId) {
        String sql = "DELETE FROM Booking WHERE Booking_ID = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, bookingId);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void checkDateBooking() {
        //kết nối với db
        connection = getConnection();
        //tạo câu lệnh sql
        String sql = "UPDATE b\n"
                + "SET b.Booking_Status = N'Đã thanh toán'\n"
                + "FROM Booking b\n"
                + "JOIN Ticket t ON b.Ticket_ID = t.Ticket_ID\n"
                + "JOIN BusSchedule bs ON t.Schedule_ID = bs.Schedule_ID\n"
                + "WHERE bs.DepartureDate <= DATEADD(day, -1, GETDATE())\n"
                + "AND b.Booking_Status = N'Đã đặt'\n"
                + "AND b.Booking_Status <> N'Đã hủy';";

        try {
            //tạo đối tượng prepare statement để chuyển sql sang câu lệnh sql
            statement = connection.prepareStatement(sql);
            //thực thi câu lệnh
            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }
//    public static void main(String[] args) {
//        AdminDAO rd = new AdminDAO();
//        List<Road> r = rd.getRoad();
//        List<User> u = rd.getUser();
//        List<Car> c = rd.getCar();
//        List<Booking> b = rd.getBooking();
//        List<Seat_2> s = rd.getSeat();
//
//    }

}
