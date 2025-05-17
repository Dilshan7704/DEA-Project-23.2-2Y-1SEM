package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
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
                employee.setEmployee_Id(rs.getInt("employee_id"));
                employee.setEmployee_name(rs.getString("employee_name"));
                employee.setEmployee_email(rs.getString("employee_email"));
                employee.setEmployee_password(rs.getString("employee_password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employee;
    }

    public void insertEmployee(Employee employee) {
        String sql = "INSERT INTO employee (employee_name,employee_email,employee_password, phone, department,profile_picture) VALUES (?, ?, ?, ?, ?)";
        try {
            
             Connection conn = DB.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
           
            statement.setString(1, employee.getEmployee_name());
            statement.setString(2, employee.getEmployee_email());
            statement.setString(3, employee.getEmployee_password());
            statement.setInt(4, employee.getPhone());
            statement.setString(5, employee.getDepartment());
            statement.setBytes(6, employee.getProfilePicture());
            statement.executeUpdate();
      
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Employee> listEmployees() {
        List<Employee> employees = new ArrayList<>();
        String sql = "SELECT * FROM employee";
        try {
            
            Connection conn = DB.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery(sql);

            while (resultSet.next()) {
                
                int id = resultSet.getInt("employee_id");
                String fullname = resultSet.getString("employee_name");
                String email = resultSet.getString("employee_email");
                String password = resultSet.getString("employee_password");
                int phone = resultSet.getInt("phone");
                String department = resultSet.getString("department");
                byte[] profilePicture = resultSet.getBytes("profile_picture");
                employees.add(new Employee(id,fullname, email,password, phone, department,profilePicture));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    public boolean deleteEmployeeById(int id) {
    String sql = "DELETE FROM employee WHERE id = ?";
    try {
        
        Connection conn = DB.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);

        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        
        return rowDeleted;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

    public boolean updateEmployee(int originalId, Employee emp) {
    String sql = "UPDATE employee SET employee_name=?, employee_email=?,employee_password=?, phone=?, department=?, profile_picture=? WHERE id=?";
    try {
        
        Connection conn = DB.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, emp.getEmployee_name());
        statement.setString(2, emp.getEmployee_email());
        statement.setString(3, emp.getEmployee_password());
        statement.setInt(4, emp.getPhone());
        statement.setString(5, emp.getDepartment());
        statement.setBytes(6, emp.getProfilePicture());
        statement.setInt(7, originalId);

        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        
        return rowUpdated;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    
    public Employee getEmployeeById(int id) throws SQLException {
    Employee employee = null;
    String sql = "SELECT * FROM employee WHERE id = ?";
    try {
        
       Connection conn = DB.getConnection();
       PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            employee = new Employee(
                resultSet.getInt("id"),
                resultSet.getString("fullname"),
                resultSet.getString("email"),
                resultSet.getString("password"),    
                resultSet.getInt("phone"),
                resultSet.getString("department"),
                resultSet.getBytes("profile_picture")
            );
        }
    } finally {
        
    }
    return employee;
}
}