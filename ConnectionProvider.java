 
package com.tech.blog.helper;

 import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
           if(con==null)
           {
            //loading the driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
            //creating a connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","012345");
            
           }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
}
