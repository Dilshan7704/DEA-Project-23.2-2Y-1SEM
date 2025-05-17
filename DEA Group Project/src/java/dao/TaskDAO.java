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
import util.DB;

public class TaskDAO {
   
    
    public void insertTask(Task task) throws ClassNotFoundException, SQLException{
        String InsertTask = "INSERT INTO tasks (task_name, task_description, "
                + "project_id, employee_id, task_status, task_deadline) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
         Connection conn = DB.getConnection();
        PreparedStatement stmt = conn.prepareStatement(InsertTask);

        stmt.setString(1, task.getTask_name());
        stmt.setString(2, task.getTask_description());
        stmt.setInt(3, task.getProject_id());
        stmt.setInt(4, task.getEmployee_id());
        stmt.setString(5, task.getTask_status());
        stmt.setObject(6, task.getTask_deadline());

        stmt.executeUpdate();
        conn.close();
    }
    
    public List<Task> listTasks(int projectId) throws ClassNotFoundException, SQLException {
        
        List<Task> taskList = new ArrayList<>();
        String getTasks = "select * from tasks where project_id = ?";
        Connection conn = DB.getConnection();
        PreparedStatement stmt = conn.prepareStatement(getTasks);

        stmt.setInt(1, projectId);
        ResultSet rs = stmt.executeQuery(); 
        
        while(rs.next()){
            Task task = new Task();
            task.setTask_id(rs.getInt("task_id"));
            task.setTask_name(rs.getString("task_name"));
            task.setTask_description(rs.getString("task_description"));
            task.setProject_id(rs.getInt("project_id"));
            task.setEmployee_id(rs.getInt("employee_id"));
            task.setTask_description(rs.getString("task_status"));
            task.setTask_deadline(rs.getDate("task_deadline").toLocalDate());
            taskList.add(task);
        }
        
        return taskList;
    }

    public Task getTaskById(int taskId) throws ClassNotFoundException, SQLException {
        String query = "SELECT * FROM tasks WHERE task_id = ?";
       

        try ( Connection conn = DB.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, taskId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Task task = new Task();
                task.setTask_id(rs.getInt("task_id"));
                task.setTask_name(rs.getString("task_name"));
                task.setTask_description(rs.getString("task_description"));
                task.setProject_id(rs.getInt("project_id"));
                task.setEmployee_id(rs.getInt("employee_id"));
                task.setTask_status(rs.getString("task_status"));
                task.setTask_deadline(rs.getDate("task_deadline").toLocalDate());
                return task;
            } else {
                return null;
            }
        }
    }

    public void updateTask(Task task) throws SQLException, ClassNotFoundException {
        String query = "UPDATE tasks SET task_name = ?, task_description = ?, task_status = ?, task_deadline = ? WHERE task_id = ?";

       
        try ( Connection conn = DB.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, task.getTask_name());
            stmt.setString(2, task.getTask_description());
            stmt.setString(3, task.getTask_status());
            stmt.setObject(4, task.getTask_deadline());
            stmt.setInt(5, task.getTask_id());

            stmt.executeUpdate();
        }
    }

    public void deleteTaskById(int taskId) throws SQLException, ClassNotFoundException {
        String query = "DELETE FROM tasks WHERE task_id = ?";
        Class.forName("com.mysql.cj.jdbc.Driver");

        try ( Connection conn = DB.getConnection();
            PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, taskId);
            stmt.executeUpdate();
        }
    }

}