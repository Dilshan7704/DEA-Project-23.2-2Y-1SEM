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
       
            
        Connection conn = DB.getConnection();
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
}
