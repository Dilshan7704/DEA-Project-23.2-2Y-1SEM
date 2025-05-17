package dao;

import com.nsbm.model.Project;
import com.nsbm.util.DB;
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
                project.setProjectId(rs.getInt("project_id"));
                project.setProjectName(rs.getString("project_name"));
                project.setProjectDescription(rs.getString("project_description"));
                project.setProjectStartDate(rs.getDate("project_startdate"));
                project.setProjectEndDate(rs.getDate("project_enddate"));
                project.setStatus(rs.getString("status"));
                project.setProjectBudget(rs.getFloat("project_budget"));
                project.setClientId(rs.getInt("client_id"));
                projects.add(project);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return projects;
    }
}