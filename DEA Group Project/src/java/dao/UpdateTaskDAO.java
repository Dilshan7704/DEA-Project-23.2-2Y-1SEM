
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UpdateTaskDAO {
    
     private String jdbcURL = "jdbc:mysql://localhost:3306/projectmanagementdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    public int updateTaskStatus(int taskId, String newStatus) {
        int rowinserted = 0;

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "UPDATE tasks SET task_status = ? WHERE task_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, newStatus);
            statement.setInt(2, taskId);

             // Execute Update
        rowinserted = statement.executeUpdate();

        // Check if Inserted Successfully
        if (rowinserted > 0) {
            System.out.println("Task Updated successfully!");
        } else {
            System.out.println("Something wrong");
        }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowinserted;
    }
    
}
