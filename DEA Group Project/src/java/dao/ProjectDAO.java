package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Project;

public class ProjectDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/projectmanagementdb";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    
    public List<Project> listProjects() throws ClassNotFoundException, SQLException {
        
        List<Project> projectList = new ArrayList<>();
        String getProjects = "select * from project";
        Class.forName("com.mysql.cj.jdbc.Driver");
            
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(getProjects);
        
        while(rs.next()){
            Project project = new Project();
            project.setProjectId(rs.getInt("project_id"));
            project.setProjectName(rs.getString("project_name"));
            project.setProjectDescription(rs.getString("project_description"));
            project.setProjectStartDate(rs.getDate("project_startdate").toLocalDate());
            project.setProjectEndDate(rs.getDate("project_enddate").toLocalDate());
            project.setProjectStatus(rs.getString("status"));
            project.setProjectBudget(rs.getFloat("project_budget"));
            project.setClientId(rs.getInt("client_id"));

            projectList.add(project);
        }
        
        return projectList;
    }
}
