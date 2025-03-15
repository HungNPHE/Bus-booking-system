/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Seat_2;

/**
 *
 * @author fpt shop
 */
public class SeatServlet_admin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        AdminDAO u = new AdminDAO();
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; // Mặc định hiển thị danh sách
        }
        switch (action) {
            case "list":
                List<Seat_2> seats = u.getSeat();
                request.setAttribute("lst", seats);
                request.getRequestDispatcher("Seat_admin.jsp").forward(request, response);
                break;
            case "delete":
                int id = Integer.parseInt(request.getParameter("id"));
                u.deleteSeat(id);
                response.sendRedirect("Seat_admin?action=list");
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                Seat_2 seat = u.getSeatById(id);
                request.setAttribute("seat", seat);
                request.getRequestDispatcher("edit_seat.jsp").forward(request, response);
                break;
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        AdminDAO u = new AdminDAO();

        String action = request.getParameter("action");
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            int number = Integer.parseInt(request.getParameter("number"));
            String date = request.getParameter("date");
            String status = request.getParameter("status");

            Seat_2 seat = new Seat_2(id, number, date, status);
            u.updateSeat(seat);
            response.sendRedirect("Seat_admin?action=list");
        } else if ("insert".equals(action)) {
            int number = Integer.parseInt(request.getParameter("seat_id"));
            String date = request.getParameter("date");
            String status = request.getParameter("status");

            Seat_2 seat = new Seat_2(0, number, date, status);
            u.insertSeat(seat);
            response.sendRedirect("Seat_admin?action=list");
        } else if ("search".equals(action)) {
            String date = request.getParameter("date");
            List<Seat_2> seats = u.searchSeatByDate(date);
            request.setAttribute("lst", seats);
            request.getRequestDispatcher("Seat_admin.jsp").forward(request, response);

        }
    }

}
