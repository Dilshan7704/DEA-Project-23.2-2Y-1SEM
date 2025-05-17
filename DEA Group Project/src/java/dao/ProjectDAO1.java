package dao;

import model.Project;
import util.DB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO1 {
    
    public List<Project> getProjectsByClientId(int clientId) {
        List<Project> projects = new ArrayList<>();
        try {
            String sql = "SELECT * FROM project WHERE client_id = ?";
            Connection conn = DB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, clientId);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Project project = new Project();
                project.setProject_id(rs.getInt("project_id"));
                project.setProject_name(rs.getString("project_name"));
                project.setProject_description(rs.getString("project_description"));
                project.setProject_startdate(rs.getDate("project_startdate").toLocalDate());
                project.setProject_enddate(rs.getDate("project_enddate").toLocalDate());
                project.setStatus(rs.getString("status"));
                project.setProject_budget(rs.getFloat("project_budget"));
                project.setClient_id(rs.getInt("client_id"));
                projects.add(project);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return projects;
    }
}
