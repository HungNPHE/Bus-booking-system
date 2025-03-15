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
import model.Car;

/**
 *
 * @author fpt shop
 */
public class CarServlet_Admin extends HttpServlet {

    private AdminDAO carDAO = new AdminDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                List<Car> carList = carDAO.getCar();
                request.setAttribute("lst", carList);
                request.getRequestDispatcher("Car_admin.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Car car = carDAO.getCarById(id);
                request.setAttribute("car", car);
                request.getRequestDispatcher("edit_car.jsp").forward(request, response);
                break;
            case "delete":
                int carId = Integer.parseInt(request.getParameter("id"));
                carDAO.deleteCar(carId);
                response.sendRedirect("Car_admin");
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
                String licensePlate = request.getParameter("licensePlate");
                String carName = request.getParameter("carName");
                int roadId = Integer.parseInt(request.getParameter("roadId"));

                Car newCar = new Car(0, licensePlate, carName, roadId);
                carDAO.insertCar(newCar);
                response.sendRedirect("Car_admin");
                break;

            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                String updatedLicensePlate = request.getParameter("licensePlate");
                String updatedCarName = request.getParameter("carName");
                int updatedRoadId = Integer.parseInt(request.getParameter("roadId"));

                Car updatedCar = new Car(id, updatedLicensePlate, updatedCarName, updatedRoadId);
                carDAO.updateCar(updatedCar);
                response.sendRedirect("Car_admin");
                break;

            case "searchByRoadName":
                String roadName = request.getParameter("roadName");
                List<Car> cars = carDAO.searchByRoadName(roadName);
                request.setAttribute("lst", cars);
                request.getRequestDispatcher("Car_admin.jsp").forward(request, response);

                break;

        }

    }

}
