package edu.toubou.librarymanagement;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author theo
 */
import java.sql.*;
import javax.swing.*;

public class DatabaseConnection {
    
  public Connection connection = null;
    public static Connection getConnection()
    {
        System.out.println("------------MySQL Connection Testing-----------");
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("Where is MySQL Driver?");
            e.printStackTrace();
        }
        System.out.println("MySQL Driver Registered!");
        Connection connection = null;
        try{
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","user1","user1");
        }
        catch(SQLException e)
        {
            System.out.println("Connection Failed: Check output console");
            e.printStackTrace();
        }

        if(connection != null)
        {
            System.out.println("Successful connection to Library Database");
        }else{
            System.out.println("Failed to make connection!");
        }

        return connection;
    }
    
}
