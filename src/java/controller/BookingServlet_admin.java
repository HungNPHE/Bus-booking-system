/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AdminDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Booking;

/**
 *
 * @author fpt shop
 */
public class BookingServlet_admin extends HttpServlet {

    private AdminDAO bookingDAO = new AdminDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        try {
            switch (action) {
                case "list":
                    listBookings(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteBooking(request, response);
                    break;
                default:
                    listBookings(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        try {
            if ("insert".equals(action)) {
                insertBooking(request, response);

            } else if ("update".equals(action)) {
                updateBooking(request, response);

            } else if ("search".equals(action)) {
                searchByBookingDate(request, response);

            } else if ("checkDate".equals(action)) {
                updateBookingStatus(request, response);
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listBookings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Booking> bookings = bookingDAO.getBooking();
        request.setAttribute("lst", bookings);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Booking_admin.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Booking booking = bookingDAO.findBookingById(id);
        request.setAttribute("booking", booking);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit_booking.jsp");
        dispatcher.forward(request, response);
    }

    private void insertBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookingDate = request.getParameter("bookingDate");
        int ticketId = Integer.parseInt(request.getParameter("ticketId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String bookingStatus = request.getParameter("bookingStatus");

        Booking newBooking = new Booking(0, bookingDate, ticketId, userId, bookingStatus);
        bookingDAO.insertBooking(newBooking);
        response.sendRedirect("Booking_admin?action=list");
    }

    private void updateBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String bookingDate = request.getParameter("bookingDate");
        int ticketId = Integer.parseInt(request.getParameter("ticketId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String bookingStatus = request.getParameter("bookingStatus");

        Booking booking = new Booking(id, bookingDate, ticketId, userId, bookingStatus);
        bookingDAO.updateBooking(booking);
        response.sendRedirect("Booking_admin?action=list");
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookingDAO.deleteBooking(id);
        response.sendRedirect("Booking_admin?action=list");
    }

    private void searchByBookingDate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String date = request.getParameter("date");
        List<Booking> bookings = bookingDAO.searchByDate(date);
        request.setAttribute("lst", bookings);
        request.getRequestDispatcher("Booking_admin.jsp").forward(request, response);
    }

    private void updateBookingStatus(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        bookingDAO.checkDateBooking(); // Gọi phương thức checkDateBooking() trong AdminDAO
        listBookings(request, response); // Sau khi cập nhật, hiển thị lại danh sách bookings
    }

}
