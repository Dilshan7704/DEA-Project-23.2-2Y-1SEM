package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/project_management","root","");
    }
}
