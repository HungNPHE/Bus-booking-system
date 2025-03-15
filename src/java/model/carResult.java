/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.sql.*;

/**
 *
 * @author admin
 */
public class carResult {
    private int id;
    private String name;
    private String licensePlate;
    private String startLocation;
    private String endLocation;
    private String pickupLocation;
    private String dropLocation;
    private Date departureDate;
    private Time departureTime;
    private Time arrivalTime;
    private int price;
    private int numberOfAvailableSeats;
    private List<Seat> availableSeats;

    public carResult() {
    }

    public carResult(int id, String name, String licensePlate, String startLocation, String endLocation, String pickupLocation, String dropLocation, Date departureDate, Time departureTime, Time arrivalTime, int price, int numberOfAvailableSeats, List<Seat> availableSeats) {
        this.id = id;
        this.name = name;
        this.licensePlate = licensePlate;
        this.startLocation = startLocation;
        this.endLocation = endLocation;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.price = price;
        this.numberOfAvailableSeats = numberOfAvailableSeats;
        this.availableSeats = availableSeats;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public String getStartLocation() {
        return startLocation;
    }

    public void setStartLocation(String startLocation) {
        this.startLocation = startLocation;
    }

    public String getEndLocation() {
        return endLocation;
    }

    public void setEndLocation(String endLocation) {
        this.endLocation = endLocation;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDropLocation() {
        return dropLocation;
    }

    public void setDropLocation(String dropLocation) {
        this.dropLocation = dropLocation;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    public Time getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Time departureTime) {
        this.departureTime = departureTime;
    }

    public Time getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Time arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumberOfAvailableSeats() {
        return numberOfAvailableSeats;
    }

    public void setNumberOfAvailableSeats(int numberOfAvailableSeats) {
        this.numberOfAvailableSeats = numberOfAvailableSeats;
    }

    public List<Seat> getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(List<Seat> availableSeats) {
        this.availableSeats = availableSeats;
    }

    @Override
    public String toString() {
        return "carResult{" + "id=" + id + ", name=" + name + ", licensePlate=" + licensePlate + ", startLocation=" + startLocation + ", endLocation=" + endLocation + ", pickupLocation=" + pickupLocation + ", dropLocation=" + dropLocation + ", departureDate=" + departureDate + ", departureTime=" + departureTime + ", arrivalTime=" + arrivalTime + ", price=" + price + ", numberOfAvailableSeats=" + numberOfAvailableSeats + ", availableSeats=" + availableSeats + '}';
    }



    
    
}
