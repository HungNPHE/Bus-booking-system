/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author admin
 */
public class AccountDAO extends DBContext{
    public List<Account> findAll(){
        List<Account> listFound = new ArrayList<>();
        //connect with DB
        connection = getConnection();
        //chuẩn bị câu lệnh SQL để lấy ra dữ liệu
        String sql = "SELECT * FROM [User]";
        try{
            //tạo đối tượng preparedStatement
            statement = connection.prepareStatement(sql);
            // thực thi câu lệnh
            resultSet = statement.executeQuery();
            //trả về kết quả
            while(resultSet.next()){
                int id_found = resultSet.getInt("User_ID");
                String fullname_found = resultSet.getString("FullName").trim();
                String phonenumber_found = resultSet.getString("User_phone").trim();
                String password_found = resultSet.getString("User_password").trim();
                String role_found = resultSet.getString("User_role").trim();
                Account account = new Account(id_found, fullname_found, phonenumber_found, password_found, role_found);
                listFound.add(account);
            }
        }catch(SQLException e){
            System.err.println(e.getMessage());
        }       
        return listFound;
    }
    public Account findbyAccount(String phonenumber,String password){
        connection = getConnection();
        String sql = "SELECT * FROM [User]\n" +
                    "WHERE [User_phone] = ? AND [User_password] = ?";
        try{
            statement = connection.prepareStatement(sql);
            //chuyển hai tham số truyền vào cho vào câu lệnh sql thông qua dấu ?
            //i là vị trí của ?(1, 2, ......)
            statement.setObject(1,phonenumber);
            statement.setObject(2,password);
            resultSet = statement.executeQuery();
            if(resultSet.next()){
                int id_found = resultSet.getInt("User_ID");
                String fullname_found = resultSet.getString("FullName").trim();
                String phonenumber_found = resultSet.getString("User_phone").trim();
                String password_found = resultSet.getString("User_password").trim();
                String role_found = resultSet.getString("User_role").trim();
                Account account = new Account(id_found, fullname_found, phonenumber_found, password_found, role_found);
                return account;
            }
        }catch(SQLException e){
            System.err.println(e.getMessage());
        }       
        return null;
    }
    public void insertToDB(String fullname, String phonenumber, String password){
        //kết nối với db
        connection = getConnection();
        //tạo câu lệnh sql
        String sql = "INSERT INTO [dbo].[User]\n" +
                    "           ([FullName]\n" +
                    "           ,[User_phone]\n" +
                    "           ,[User_password]\n" +
                    "           ,[User_role])\n" +
                    "     VALUES\n" +
                    "           (?\n" +
                    "           ,?\n" +
                    "           ,?\n" +
                    "           ,?)";       
        try{
            //tạo đối tượng prepare statement để chuyển sql sang câu lệnh sql
            //Statement.RETURN_GENERATED_KEYS để giúp bạn lấy lại các giá trị 
            //khóa chính tự động sinh ra từ cơ sở dữ liệu, hoặc các giá trị ngay sau khi thực hiện một thao tác chèn
            statement = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            //thay các ? trong sql thành các giá trị muốn thêm vào
            statement.setObject(1, fullname);
            statement.setObject(2, phonenumber);
            statement.setObject(3, password);
            statement.setObject(4, "User");
            //thực thi câu lệnh
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        }catch(SQLException e){
            System.err.println(e.getMessage());
        }
    }
}
