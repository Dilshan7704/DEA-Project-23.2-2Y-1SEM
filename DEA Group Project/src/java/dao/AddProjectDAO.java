package com.project.dao;

import com.project.model.Client;
import com.project.model.Project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class AddProjectDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/projectmanagementdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    
    public int addProject(Project project) {
        int rowinserted = 0;
    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to Database
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Insert Query
        String query = "INSERT INTO project(project_name,project_description,project_startdate,project_enddate,status,project_budget,client_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(query);
        statement.setString(1, project.getProject_name());
        statement.setString(2, project.getProject_description());
        statement.setString(3, project.getProject_startdate());
        statement.setString(4, project.getProject_enddate());
        statement.setString(5, project.getStatus());
        statement.setInt(6, project.getProject_budget());
        statement.setInt(7, project.getClient_id());

        // Execute Update
        rowinserted = statement.executeUpdate();

        // Check if Inserted Successfully
        if (rowinserted > 0) {
            System.out.println("Student registered successfully!");
        } else {
            System.out.println("Something wrong");
        }

    }  catch (Exception e) {
        e.printStackTrace();
    }
    
    return rowinserted;
}
    
    
    
     public ArrayList<Project> ProjectList() {
     ArrayList<Project> projectList  = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

       String sql = "SELECT * FROM project";
Statement statement = conn.createStatement();
ResultSet resultSet = statement.executeQuery(sql);

while (resultSet.next()) {
    int id = resultSet.getInt(1);
    String projectName = resultSet.getString(2);
    String projectDescription = resultSet.getString(3);
    String startDate = resultSet.getString(4);
    String endDate = resultSet.getString(5);
    String status = resultSet.getString(6);
    int budget = resultSet.getInt(7);
    int clientId = resultSet.getInt(8);

    Project pj = new Project(id, projectName, projectDescription, startDate, endDate, status, budget, clientId);
    projectList.add(pj);

     
    
}

    } catch (Exception e) {
    
        e.printStackTrace();
    } 
    return projectList;
}
     
     public int deleteProject(int projectId) {
    
         int rowdeleted = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        String sql = "DELETE FROM project WHERE project_id = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, projectId);

         // Execute Update
        rowdeleted = statement.executeUpdate();

        // Check if Inserted Successfully
        if (rowdeleted > 0) {
            System.out.println("Project deleted successfully");
            
        } else {
            System.out.println("Something wrong");
        }

        
    } catch (Exception e) {
        e.printStackTrace();
    }
        
        return rowdeleted;

     }
     
     
     //update project
 public Project getProjectById(int projectId) {
    Project project = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        String sql = "SELECT * FROM project WHERE project_id = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, projectId);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            int id = resultSet.getInt("project_id");
            String projectName = resultSet.getString("project_name");
            String projectDescription = resultSet.getString("project_description");
            String startDate = resultSet.getString("project_startdate");
            String endDate = resultSet.getString("project_enddate");
            String status = resultSet.getString("status");
            int budget = resultSet.getInt("project_budget");
            int clientId = resultSet.getInt("client_id");

            project = new Project(id, projectName, projectDescription, startDate, endDate, status, budget, clientId);
            
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
        

    return project;
}

}




