/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author fpt shop
 */
public class Road {

    private int RoadID;
    private String Start;
    private String End;
    private int price;
    private String PickupLocation;
    private String DropLocation;

    public Road() {
    }

    public Road(int RoadID, String Start, String End, int price, String PickupLocation, String DropLocation) {
        this.RoadID = RoadID;
        this.Start = Start;
        this.End = End;
        this.price = price;
        this.PickupLocation = PickupLocation;
        this.DropLocation = DropLocation;
    }

    public int getRoadID() {
        return RoadID;
    }

    public void setRoadID(int RoadID) {
        this.RoadID = RoadID;
    }

    public String getStart() {
        return Start;
    }

    public void setStart(String Start) {
        this.Start = Start;
    }

    public String getEnd() {
        return End;
    }

    public void setEnd(String End) {
        this.End = End;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPickupLocation() {
        return PickupLocation;
    }

    public void setPickupLocation(String PickupLocation) {
        this.PickupLocation = PickupLocation;
    }

    public String getDropLocation() {
        return DropLocation;
    }

    public void setDropLocation(String DropLocation) {
        this.DropLocation = DropLocation;
    }

    @Override
    public String toString() {
        return "Road{" + "RoadID=" + RoadID + ", Start=" + Start + ", End=" + End + ", price=" + price + ", PickupLocation=" + PickupLocation + ", DropLocation=" + DropLocation + '}';
    }

}
