package model;

public class Seat_2 {

    private int SeatDetails_ID;
    private int Seat_ID;
    private String Date;
    private String Status;

    public Seat_2() {
    }

    public Seat_2(int SeatDetails_ID, int Seat_ID, String Date, String Status) {
        this.SeatDetails_ID = SeatDetails_ID;
        this.Seat_ID = Seat_ID;
        this.Date = Date;
        this.Status = Status;
    }

    public int getSeatDetails_ID() {
        return SeatDetails_ID;
    }

    public void setSeatDetails_ID(int SeatDetails_ID) {
        this.SeatDetails_ID = SeatDetails_ID;
    }

    public int getSeat_ID() {
        return Seat_ID;
    }

    public void setSeat_ID(int Seat_ID) {
        this.Seat_ID = Seat_ID;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Seat_2{" + "SeatDetails_ID=" + SeatDetails_ID + ", Seat_ID=" + Seat_ID + ", Date=" + Date + ", Status=" + Status + '}';
    }

}
