
package controller;

import dao.UpdateTaskDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Task;


public class ChangeTaskStatus extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
              response.setContentType("text/html");  
        PrintWriter out = response.getWriter();
        String status = request.getParameter("status");
        String t_id = request.getParameter("task_id");
        String p_id = request.getParameter("project_id");
        String e_id = request.getParameter("employee_id");
        
        int task_id = Integer.parseInt(t_id);
        int project_id = Integer.parseInt(p_id);
        int employee_id = Integer.parseInt(e_id);
        
        out.println(status);
        out.println(task_id);
        out.println(employee_id);
        Task task = new Task();
task.setTask_id(task_id);
task.setTask_status(status);
        
        UpdateTaskDAO taskupdate = new UpdateTaskDAO();
        int rowinserted = taskupdate.updateTaskStatus(task_id, status);
        
        if(rowinserted>0){
              response.sendRedirect("employeeProjectView.jsp?project_id=" + project_id + "&employee_id=" + employee_id);
         }
    }


}
