package com.project.dao;

import com.project.model.Project;

import java.sql.*;

public class UpdateProjectDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/projectmanagementdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    
    public int updateProject(Project project, int projectId) {
        int rowinserted = 0;
    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to Database
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Insert Query
        String query = "UPDATE project SET project_name=?, project_description=?, project_startdate=?, project_enddate=?, status=?, project_budget=? WHERE project_id=?";
        PreparedStatement statement = conn.prepareStatement(query);
        
        statement.setString(1, project.getProject_name());
        statement.setString(2, project.getProject_description());
        statement.setString(3, project.getProject_startdate());
        statement.setString(4, project.getProject_enddate());
        statement.setString(5, project.getStatus());
        statement.setInt(6, project.getProject_budget());
        statement.setInt(7, projectId);
        

        // Execute Update
        rowinserted = statement.executeUpdate();

        // Check if Inserted Successfully
        if (rowinserted > 0) {
            System.out.println("Project Updated successfully!");
        } else {
            System.out.println("Something wrong");
        }

    }  catch (Exception e) {
        e.printStackTrace();
    }
    
    return rowinserted;
}
}
