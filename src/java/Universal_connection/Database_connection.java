/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Universal_connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author yoges
 */
public class Database_connection {
  private static final String url="jdbc:mysql://localhost:3307/online_book";
     private static final String user="root";
     private static final String pas="1234";
     
     static{
         try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             
         } catch (Exception e) {
             System.out.println(e.getMessage());
         }
     }
         
         public static Connection getconnection ()throws SQLException{
         return(DriverManager.getConnection(url, user, pas));
         }
     }

