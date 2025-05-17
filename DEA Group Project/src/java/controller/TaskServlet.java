package controller;

import dao.TaskDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.List;
import model.Task;

@WebServlet(name = "TaskServlet", urlPatterns = {"/TaskServlet"})
public class TaskServlet extends HttpServlet {

    private TaskDAO taskDAO = new TaskDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            List<Task> taskList = taskDAO.listTasks(projectId);
            request.setAttribute("taskList", taskList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("TaskList.jsp");
            dispatcher.forward(request, response);
        } 
        catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            int employeeId = Integer.parseInt(request.getParameter("employee"));
            String status = request.getParameter("status");
            LocalDate date = LocalDate.parse(request.getParameter("deadline"));

            Task task = new Task();
            task.setTaskName(name);
            task.setTaskDescription(description);
            task.setProjectId(projectId);
            task.setEmployeeId(employeeId);
            task.setTaskStatus(status);
            task.setTaskDeadline(date);
            
            taskDAO.insertTask(task);
            response.sendRedirect("TaskServlet");
            
        } catch (Exception ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
        
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
