
package model;

import java.sql.*;
public class bookingHistory {
    private int ticket_id;
    private Date bookingDate;
    private int user_id;
    private String fullname;
    private String phonenumber;
    private String startLocation;
    private String endLocation;
    private Date departureDate;
    private Time departureTime;
    private Time arrivalTime;
    private String licensePlate;
    private String seatNumber;
    private int price;
    private String bookingStatus;

    public bookingHistory() {
    }

    public bookingHistory(int ticket_id, Date bookingDate, int user_id, String fullname, String phonenumber, String startLocation, String endLocation, Date departureDate, Time departureTime, Time arrivalTime, String licensePlate, String seatNumber, int price, String bookingStatus) {
        this.ticket_id = ticket_id;
        this.bookingDate = bookingDate;
        this.user_id = user_id;
        this.fullname = fullname;
        this.phonenumber = phonenumber;
        this.startLocation = startLocation;
        this.endLocation = endLocation;
        this.departureDate = departureDate;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.licensePlate = licensePlate;
        this.seatNumber = seatNumber;
        this.price = price;
        this.bookingStatus = bookingStatus;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
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

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    @Override
    public String toString() {
        return "bookingHistory{" + "ticket_id=" + ticket_id + ", bookingDate=" + bookingDate + ", user_id=" + user_id + ", fullname=" + fullname + ", phonenumber=" + phonenumber + ", startLocation=" + startLocation + ", endLocation=" + endLocation + ", departureDate=" + departureDate + ", departureTime=" + departureTime + ", arrivalTime=" + arrivalTime + ", licensePlate=" + licensePlate + ", seatNumber=" + seatNumber + ", price=" + price + ", bookingStatus=" + bookingStatus + '}';
    }
    
}