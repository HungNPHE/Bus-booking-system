/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import dal.AdminDAO;
import jakarta.servlet.RequestDispatcher;
import model.Road;

/**
 *
 * @author fpt shop
 */
public class RoadServlet_admin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        AdminDAO ad = new AdminDAO();
        switch (action == null ? "" : action) {
            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Road road = ad.getRoadById(editId);
                request.setAttribute("road", road);
                request.getRequestDispatcher("edit_road.jsp").forward(request, response);
                break;

            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                ad.deleteRoad(deleteId);
                response.sendRedirect("Road_admin?action=list");
                break;

            case "list":
                List<Road> roads = ad.getRoad();
                request.setAttribute("lst", roads);
                request.getRequestDispatcher("Road_admin.jsp").forward(request, response);
                break;

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                insertRoad(request, response);
                break;
            case "update":
                updateRoad(request, response);
                break;
            case "delete":
                deleteRoad(request, response); // Nếu delete qua POST, ta gọi từ đây
                break;
            case "searchByStart":
                searchRoadByStart(request, response);
                break;
            case "searchByEnd":
                searchRoadByEnd(request, response);
                break;
        }

    }

    private void insertRoad(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String start = request.getParameter("start");
        String end = request.getParameter("end");
        int price = Integer.parseInt(request.getParameter("price"));
        String pickup = request.getParameter("pickupLocation");
        String drop = request.getParameter("dropLocation");

        Road newRoad = new Road(0, start, end, price, pickup, drop);
        AdminDAO u = new AdminDAO();
        u.insertRoad(newRoad);
        response.sendRedirect("Road_admin?action=list");
    }

    private void updateRoad(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        int price = Integer.parseInt(request.getParameter("price"));
        String pickup = request.getParameter("pickupLocation");
        String drop = request.getParameter("dropLocation");

        Road road = new Road(id, start, end, price, pickup, drop);
        AdminDAO u = new AdminDAO();
        u.updateRoad(road);
        response.sendRedirect("Road_admin?action=list");
    }

    private void deleteRoad(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AdminDAO u = new AdminDAO();
        u.deleteRoad(id);
        response.sendRedirect("Road_admin?action=list");
    }

    private void searchRoadByStart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String start = request.getParameter("Start");
        AdminDAO u = new AdminDAO();

        List<Road> roads = u.searchRoadByStart(start);
        request.setAttribute("lst", roads);
        request.getRequestDispatcher("Road_admin.jsp").forward(request, response);
    }

    private void searchRoadByEnd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDAO u = new AdminDAO();

        String end = request.getParameter("End");
        List<Road> roads = u.searchRoadByEnd(end);
        request.setAttribute("lst", roads);

        request.getRequestDispatcher("Road_admin.jsp").forward(request, response);
    }

}
