package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Task;

public class TaskDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/projectmanagementdb";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    
    public void insertTask(Task task) throws ClassNotFoundException, SQLException{
        String InsertTask = "INSERT INTO tasks (task_name, task_description, "
                + "project_id, employee_id, task_status, task_deadline) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement stmt = conn.prepareStatement(InsertTask);

        stmt.setString(1, task.getTaskName());
        stmt.setString(2, task.getTaskDescription());
        stmt.setInt(3, task.getProjectId());
        stmt.setInt(4, task.getEmployeeId());
        stmt.setString(5, task.getTaskStatus());
        stmt.setObject(6, task.getTaskDeadline());

        stmt.executeUpdate();
        conn.close();
    }
    
    public List<Task> listTasks(int projectId) throws ClassNotFoundException, SQLException {
        
        List<Task> taskList = new ArrayList<>();
        String getTasks = "select * from tasks where project_id = ?";
        Class.forName("com.mysql.cj.jdbc.Driver");
            
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement stmt = conn.prepareStatement(getTasks);

        stmt.setInt(1, projectId);
        ResultSet rs = stmt.executeQuery(); 
        
        while(rs.next()){
            Task task = new Task();
            task.setTaskId(rs.getInt("task_id"));
            task.setTaskName(rs.getString("task_name"));
            task.setTaskDescription(rs.getString("task_description"));
            task.setProjectId(rs.getInt("project_id"));
            task.setEmployeeId(rs.getInt("employee_id"));
            task.setTaskStatus(rs.getString("task_status"));
            task.setTaskDeadline(rs.getDate("task_deadline").toLocalDate());
            taskList.add(task);
        }
        
        return taskList;
    }

    public Task getTaskById(int taskId) throws ClassNotFoundException, SQLException {
        String query = "SELECT * FROM tasks WHERE task_id = ?";
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, taskId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Task task = new Task();
                task.setTaskId(rs.getInt("task_id"));
                task.setTaskName(rs.getString("task_name"));
                task.setTaskDescription(rs.getString("task_description"));
                task.setProjectId(rs.getInt("project_id"));
                task.setEmployeeId(rs.getInt("employee_id"));
                task.setTaskStatus(rs.getString("task_status"));
                task.setTaskDeadline(rs.getDate("task_deadline").toLocalDate());
                return task;
            } else {
                return null;
            }
        }
    }

    public void updateTask(Task task) throws SQLException, ClassNotFoundException {
        String query = "UPDATE tasks SET task_name = ?, task_description = ?, task_status = ?, task_deadline = ? WHERE task_id = ?";

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, task.getTaskName());
            stmt.setString(2, task.getTaskDescription());
            stmt.setString(3, task.getTaskStatus());
            stmt.setObject(4, task.getTaskDeadline());
            stmt.setInt(5, task.getTaskId());

            stmt.executeUpdate();
        }
    }

    public void deleteTaskById(int taskId) throws SQLException, ClassNotFoundException {
        String query = "DELETE FROM tasks WHERE task_id = ?";
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, taskId);
            stmt.executeUpdate();
        }
    }

}