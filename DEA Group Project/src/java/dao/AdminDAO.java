package dao;

import util.DB;
import java.sql.*;
import model.Employee;
import model.Admin;


public class AdminDAO {
    public Admin validateAdmin(String email, String password) {
        Admin admin = null;
        try {
            String sql = "SELECT * FROM admin WHERE admin_email = ? AND admin_password = ?";
            Connection conn = DB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setEmail(rs.getString("admin_email"));
                admin.setPassword(rs.getString("admin_password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
}