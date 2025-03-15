/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.bookingDAO;
import dal.checkDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Account;
import model.bookingHistory;
import model.carResult;

/**
 *
 * @author admin
 */
@WebServlet(name="bookingServlet", urlPatterns={"/book"})
public class bookingServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet bookingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bookingServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {      
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        switch(action){
            case "search":
                search(request, response);
                break;
            case "bookTicket":
                bookTicket(request, response);
                break;
            case "history":
                history(request,response);
                break;
            case "cancel":
                cancelTicket(request,response);
                break;
                
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String start = request.getParameter("start").trim();
        String end = request.getParameter("end").trim();
        String date = request.getParameter("date").trim();

        checkDAO check = new checkDAO();
        List<carResult> carfoundList = check.car_foundList(start, end, date);
        request.setAttribute("carfoundList", carfoundList);
        request.getRequestDispatcher("checkResult.jsp").forward(request, response);
    }

    private void bookTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int car_id = Integer.parseInt(request.getParameter("carID"));
        String startLocation = request.getParameter("startLocation");
        String endLocation = request.getParameter("endLocation");
        String departureDate = request.getParameter("departureDate");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        int price = Integer.parseInt(request.getParameter("price"));
        String phoneNumber = request.getParameter("phoneNumber");
        String seatNumber = request.getParameter("bookedSeat");
        //lấy ngày hiện tại để lưu vào bookingDate
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String bookingDate = currentDate.format(formatter);
        
        bookingDAO book = new bookingDAO();
        book.insertToTicket(startLocation, endLocation, seatNumber, car_id, departureDate, departureTime);
        book.insertToBooking(bookingDate, startLocation, endLocation, seatNumber, car_id, departureDate, departureTime, phoneNumber);
        book.updateSeat(seatNumber, car_id,departureDate);
        
        HttpSession session = request.getSession();
        session.setAttribute("notificationBooking", "Successfully, click BookingHistory at Home to see ticket !");
        response.sendRedirect("checkResult.jsp");
        
    }

    private void history(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account_info");
        System.out.println(account);
        checkDAO check = new checkDAO();
        List<bookingHistory> historyList = check.historyList(account.getId());
        request.setAttribute("historyList", historyList);
        request.getRequestDispatcher("bookingHistory.jsp").forward(request, response);
    }

    private void cancelTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ticket_id = Integer.parseInt(request.getParameter("ticketId_cancel"));
        String date_cancel = request.getParameter("departureDate_cancel");
        String seatNumber_cancel = request.getParameter("seatNumber_cancel");
        String licensePlate_cancel = request.getParameter("licensePlate_cancel");       
        System.out.println(ticket_id + ","+ date_cancel + "," + seatNumber_cancel + "," + licensePlate_cancel);
        bookingDAO book = new bookingDAO();
        book.updateBooking_cancel(ticket_id);
        book.updateSeat_Cancel(date_cancel, seatNumber_cancel, licensePlate_cancel);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account_info");
        checkDAO check = new checkDAO();
        List<bookingHistory> historyList = check.historyList(account.getId());
        request.setAttribute("historyList", historyList);
        request.getRequestDispatcher("bookingHistory.jsp").forward(request, response);
    }
}
