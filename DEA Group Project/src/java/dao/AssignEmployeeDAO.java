package com.project.dao;

import com.project.model.Project;
import com.project.model.ProjectAssign;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class AssignEmployeeDAO {
    
     private String jdbcURL = "jdbc:mysql://localhost:3306/projectmanagementdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    
    public int addProject(ProjectAssign projectassign) {
        int rowinserted = 0;
    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to Database
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Insert Query
        String query = "INSERT INTO projectassign(project_id,employee_id) VALUES (?, ?)";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setInt(1, projectassign.getProject_id());
        statement.setInt(2, projectassign.getEmployee_id());

        // Execute Update
        rowinserted = statement.executeUpdate();

        // Check if Inserted Successfully
        if (rowinserted > 0) {
            System.out.println("Employee assigned successfully!");
        } else {
            System.out.println("Something wrong");
        }

    }  catch (Exception e) {
        e.printStackTrace();
    }
    
    return rowinserted;
}
}
