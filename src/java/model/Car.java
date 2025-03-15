/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author fpt shop
 */
public class Car {

    private int Car_ID;
    private String LicensePlate;
    private String Car_name;
    private int RoadID;

    public Car() {
    }

    public Car(int Car_ID, String LicensePlate, String Car_name, int RoadID) {
        this.Car_ID = Car_ID;
        this.LicensePlate = LicensePlate;
        this.Car_name = Car_name;
        this.RoadID = RoadID;
    }

    public int getCar_ID() {
        return Car_ID;
    }

    public void setCar_ID(int Car_ID) {
        this.Car_ID = Car_ID;
    }

    public String getLicensePlate() {
        return LicensePlate;
    }

    public void setLicensePlate(String LicensePlate) {
        this.LicensePlate = LicensePlate;
    }

    public String getCar_name() {
        return Car_name;
    }

    public void setCar_name(String Car_name) {
        this.Car_name = Car_name;
    }

    public int getRoadID() {
        return RoadID;
    }

    public void setRoadID(int RoadID) {
        this.RoadID = RoadID;
    }

    @Override
    public String toString() {
        return "Car{" + "Car_ID=" + Car_ID + ", LicensePlate=" + LicensePlate + ", Car_name=" + Car_name + ", RoadID=" + RoadID + '}';
    }

}
