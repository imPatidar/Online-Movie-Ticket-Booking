/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pankaj.Connection;

import java.sql.Connection;
import java.sql.DriverManager;


/**
 *
 * @author Lenovo
 */
public class DBConnection {
    public static Connection getConnection() 
    {
        Connection con=null;
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String url = "jdbc:derby://localhost:1527/Sound";
            String user= "pankaj";
            String pass="pankaj";
            con = DriverManager.getConnection(url, user, pass);
         
            } 
        catch (Exception e)
        {
            System.out.println(e);
        }
        return con;
    }
    //check connection
//    public static void main(String[] args) throws SQLException {
//        getPreparedStatement("select * from login");
//    }
}
