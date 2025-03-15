/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class User {

    private int User_Id;
    private String FullName;
    private String User_phone;
    private String User_password;
    private String User_role;

    public User() {
    }

    public User(int User_Id, String FullName, String User_phone, String User_password, String User_role) {
        this.User_Id = User_Id;
        this.FullName = FullName;
        this.User_phone = User_phone;
        this.User_password = User_password;
        this.User_role = User_role;
    }

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int User_Id) {
        this.User_Id = User_Id;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getUser_phone() {
        return User_phone;
    }

    public void setUser_phone(String User_phone) {
        this.User_phone = User_phone;
    }

    public String getUser_password() {
        return User_password;
    }

    public void setUser_password(String User_password) {
        this.User_password = User_password;
    }

    public String getUser_role() {
        return User_role;
    }

    public void setUser_role(String User_role) {
        this.User_role = User_role;
    }

    @Override
    public String toString() {
        return "User{" + "User_Id=" + User_Id + ", FullName=" + FullName + ", User_phone=" + User_phone + ", User_password=" + User_password + ", User_role=" + User_role + '}';
    }

}
