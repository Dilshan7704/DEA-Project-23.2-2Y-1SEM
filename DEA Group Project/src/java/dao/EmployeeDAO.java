package dao;

import java.sql.*;
import model.Employee;
import util.DB;

public class EmployeeDAO {
    public Employee validateEmployee(String email, String password) {
        Employee employee = null;
        try {
            String sql = "SELECT * FROM employee WHERE employee_email = ? AND employee_password = ?";
            Connection conn = DB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                employee = new Employee();
                employee.setEmployeeId(rs.getInt("employee_id"));
                employee.setName(rs.getString("employee_name"));
                employee.setEmail(rs.getString("employee_email"));
                employee.setPassword(rs.getString("employee_password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employee;
    }
}