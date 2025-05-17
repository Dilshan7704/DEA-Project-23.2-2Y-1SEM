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
        String sql = "INSERT INTO employee (fullname, email, phone, department,profile_picture) VALUES (?, ?, ?, ?, ?)";
        try {
            
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setString(1, employee.getFullname());
            statement.setString(2, employee.getEmail());
            statement.setInt(3, employee.getPhone());
            statement.setString(4, employee.getDepartment());
            statement.setBytes(5, employee.getProfilePicture());
            statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Employee> listEmployees() {
        List<Employee> employees = new ArrayList<>();
        String sql = "SELECT * FROM employee";
        try {
            
            Statement statement = jdbcConnection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String fullname = resultSet.getString("fullname");
                String email = resultSet.getString("email");
                int phone = resultSet.getInt("phone");
                String department = resultSet.getString("department");
                byte[] profilePicture = resultSet.getBytes("profile_picture");
                employees.add(new Employee(id,fullname, email, phone, department,profilePicture));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }
    
    
 
    
    
    public boolean deleteEmployeeById(int id) {
    String sql = "DELETE FROM employee WHERE id = ?";
    try {
        
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
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
    String sql = "UPDATE employee SET fullname=?, email=?, phone=?, department=?, profile_picture=? WHERE id=?";
    try {
        
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, emp.getFullname());
        statement.setString(2, emp.getEmail());
        statement.setInt(3, emp.getPhone());
        statement.setString(4, emp.getDepartment());
        statement.setBytes(5, emp.getProfilePicture());
        statement.setInt(6, originalId);

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
        
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            employee = new Employee(
                resultSet.getInt("id"),
                resultSet.getString("fullname"),
                resultSet.getString("email"),
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