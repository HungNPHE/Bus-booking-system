/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author fpt shop
 */
public class Booking {

    private int Booking_ID;
    private String BookingDate;
    private int Ticket_ID;
    private int User_ID;
    private String Booking_Status;

    public Booking() {
    }

    public Booking(int Booking_ID, String BookingDate, int Ticket_ID, int User_ID, String Booking_Status) {
        this.Booking_ID = Booking_ID;
        this.BookingDate = BookingDate;
        this.Ticket_ID = Ticket_ID;
        this.User_ID = User_ID;
        this.Booking_Status = Booking_Status;
    }

    public int getBooking_ID() {
        return Booking_ID;
    }

    public void setBooking_ID(int Booking_ID) {
        this.Booking_ID = Booking_ID;
    }

    public String getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(String BookingDate) {
        this.BookingDate = BookingDate;
    }

    public int getTicket_ID() {
        return Ticket_ID;
    }

    public void setTicket_ID(int Ticket_ID) {
        this.Ticket_ID = Ticket_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int User_ID) {
        this.User_ID = User_ID;
    }

    public String getBooking_Status() {
        return Booking_Status;
    }

    public void setBooking_Status(String Booking_Status) {
        this.Booking_Status = Booking_Status;
    }

    @Override
    public String toString() {
        return "Booking{" + "Booking_ID=" + Booking_ID + ", BookingDate=" + BookingDate + ", Ticket_ID=" + Ticket_ID + ", User_ID=" + User_ID + ", Booking_Status=" + Booking_Status + '}';
    }

}
